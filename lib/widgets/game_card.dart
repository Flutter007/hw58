import 'package:flutter/material.dart';

import '../models/video_game.dart';
import 'custom_text.dart';

class GameCard extends StatelessWidget {
  final VideoGame game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(game.platform['logo'], width: 60, height: 60),
                    SizedBox(width: 15),
                    CustomText(text: game.platform['title']),
                  ],
                ),
                SizedBox(height: 16),
                CustomText(text: 'Name : ${game.name}'),
                CustomText(text: 'About : ${game.description}'),
                CustomText(text: 'Year : ${game.releaseDate}'),
                CustomText(text: 'Status:  ${game.status}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
