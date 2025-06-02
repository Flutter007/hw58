import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/providers/games_provider.dart';
import 'package:hw58/widgets/add_game_form/add_game_form.dart';
import '../providers/platforms_list_provider.dart';
import '../providers/statuses_list_provider.dart';
import '../widgets/add_game_form/add_game_controllers.dart';

class AddGameScreen extends ConsumerStatefulWidget {
  const AddGameScreen({super.key});

  @override
  ConsumerState<AddGameScreen> createState() => _AddGameScreenState();
}

class _AddGameScreenState extends ConsumerState<AddGameScreen> {
  final gameController = AddGameController();

  bool error = false;

  void clearController() {
    gameController.formKey.currentState!.reset();
    ref.read(selectedPlatformProvider.notifier).state = null;
    ref.read(selectedStatusProvider.notifier).state = null;
    gameController.nameController.clear();
    gameController.descriptionController.clear();
    gameController.releaseDateController.clear();
  }

  void addGame() {
    final selectedPlatform = ref.read(selectedPlatformProvider);
    final selectedStatus = ref.read(selectedStatusProvider);
    setState(() {
      error = true;
    });
    if (gameController.formKey.currentState!.validate() &&
        selectedStatus != null &&
        selectedPlatform != null) {
      ref
          .read(createGameProvider.notifier)
          .createGame(selectedPlatform, selectedStatus, gameController);
      clearController();
    }
  }

  void listenToAddGame() {
    ref.listen(createGameProvider, (prev, next) {
      next.whenOrNull(
        data: (d) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Game added successfully')));
        },
        error: (e, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Something went wrong')));
        },
      );
    });
  }

  @override
  void dispose() {
    gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(createGameProvider);
    listenToAddGame();
    return SingleChildScrollView(
      child: Column(
        children: [
          AddGameForm(controller: gameController),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: gameState.isLoading ? null : addGame,
            child: Text('Add', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
