import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/helpers/request.dart';
import 'package:hw58/models/video_game.dart';
import 'package:hw58/providers/platforms_list_provider.dart';
import 'package:hw58/providers/statuses_list_provider.dart';
import 'package:hw58/widgets/add_game_form/add_game_controllers.dart';

final baseURL =
    'https://my-db-7777-default-rtdb.europe-west1.firebasedatabase.app';
final gamesListProvider = FutureProvider.autoDispose<List<VideoGame>>((
  ref,
) async {
  final url = '$baseURL/games.json';
  final Map<String, dynamic>? response = await request(url);
  if (response == null) {
    return [];
  }
  final List<VideoGame> newGames = [];
  for (var key in response.keys) {
    final game = VideoGame.fromJson({...response[key], 'id': key});
    newGames.add(game);
  }
  return newGames;
});

class CreateGameNotifier extends AsyncNotifier<void> {
  @override
  build() {}
  Future<void> createGame(
    String platformId,
    String statusId,
    AddGameController controller,
  ) async {
    final platform = ref.read(platformByIdProvider(platformId));
    final status = ref.read(statusByIdProvider(statusId));
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final url = '$baseURL/games.json';

      final game = VideoGame(
        name: controller.nameController.text,
        description: controller.descriptionController.text,
        releaseDate: int.parse(controller.releaseDateController.text),
        platform: platform.toJson(),
        status: status.title,
      );
      await request(url, method: 'POST', body: game.toJson());
    });
  }
}

final createGameProvider = AsyncNotifierProvider<CreateGameNotifier, void>(
  CreateGameNotifier.new,
);
