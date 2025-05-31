import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/helpers/request.dart';
import 'package:hw58/models/video_game.dart';

final gamesListProvider = FutureProvider.autoDispose<List<VideoGame>>((
  ref,
) async {
  final url =
      'https://my-db-7777-default-rtdb.europe-west1.firebasedatabase.app/games.json';
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
  Future<void> createGame(VideoGame game) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final url =
          'https://my-db-7777-default-rtdb.europe-west1.firebasedatabase.app/games.json';
      await request(url, method: 'POST', body: game.toJson());
    });
  }
}

final createGameProvider = AsyncNotifierProvider<CreateGameNotifier, void>(
  CreateGameNotifier.new,
);
