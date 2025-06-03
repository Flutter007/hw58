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
  bool platformError = false;
  bool statusError = false;

  void clearController() {
    gameController.formKey.currentState!.reset();
    gameController.nameController.clear();
    gameController.descriptionController.clear();
    gameController.releaseDateController.clear();
    ref.read(selectedPlatformProvider.notifier).state = null;
    ref.read(selectedStatusProvider.notifier).state = null;
  }

  bool checkPlatformAndStatus() {
    final selectedPlatform = ref.read(selectedPlatformProvider);
    final selectedStatus = ref.read(selectedStatusProvider);

    setState(() {
      platformError = selectedPlatform == null;
      statusError = selectedStatus == null;
    });

    return platformError || statusError;
  }

  void addGame() {
    final selectedPlatform = ref.read(selectedPlatformProvider);
    final selectedStatus = ref.read(selectedStatusProvider);

    bool isMenuError = checkPlatformAndStatus();
    if (gameController.formKey.currentState!.validate() && !isMenuError) {
      ref
          .read(createGameProvider.notifier)
          .createGame(selectedPlatform!, selectedStatus!, gameController);
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
          AddGameForm(
            controller: gameController,
            platformError: platformError,
            statusError: statusError,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: gameState.isLoading ? null : addGame,
            child: Text('Add game ✔', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
