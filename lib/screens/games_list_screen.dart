import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/providers/games_provider.dart';

class GamesListScreen extends ConsumerWidget {
  const GamesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesState = ref.watch(gamesListProvider);

    Widget body = switch (gamesState) {
      AsyncData(value: final game) =>
        game.isEmpty ? const Text('Is empty') : const Text('Full'),
      AsyncError() => Center(child: Text('Something went wrong')),
      _ => Center(child: CircularProgressIndicator()),
    };
    return body;
  }
}
