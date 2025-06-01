import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/screens/add_game_screen.dart';

import 'games_list_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Games Store !'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list_alt), text: 'List'),
              Tab(icon: Icon(Icons.add), text: 'Add'),
            ],
          ),
        ),
        body: TabBarView(children: [GamesListScreen(), AddGameScreen()]),
      ),
    );
  }
}
