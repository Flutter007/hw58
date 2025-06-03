import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/providers/games_provider.dart';

import '../widgets/event_container.dart';
import '../widgets/game_card.dart';

class GamesListScreen extends ConsumerWidget {
  const GamesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesState = ref.watch(gamesListProvider);

    Widget body = switch (gamesState) {
      AsyncData(value: final game) =>
        game.isEmpty
            ? EventContainer(txt: 'No games', icon: Icons.games_outlined)
            : ListView.builder(
              itemCount: game.length,
              itemBuilder: (ctx, index) => GameCard(game: game[index]),
            ),
      AsyncError() => EventContainer(
        txt: 'Something went wrong',
        icon: Icons.error_outline,
      ),
      _ => Center(child: CircularProgressIndicator()),
    };

    return body;
  }
}
