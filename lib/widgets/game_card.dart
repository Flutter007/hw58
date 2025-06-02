import 'package:flutter/material.dart';

import '../models/video_game.dart';

class GameCard extends StatelessWidget {
  final VideoGame game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name : ${game.name}'),
          Text('About : ${game.description}'),
          ListTile(
            title: Text(game.platform['title']),
            leading: Image.network(
              game.platform['logo'],
              width: 60,
              height: 60,
            ),
          ),
          Text('year : ${game.releaseDate}'),
          Text(game.status),
        ],
      ),
    );
  }
}
