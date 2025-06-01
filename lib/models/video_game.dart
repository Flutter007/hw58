import 'package:hw58/models/game_platform.dart';

class VideoGame {
  final String? id;
  final String name;
  final String description;
  final GamePlatform platform;
  final int releaseDate;
  final String status;

  VideoGame({
    this.id,
    required this.name,
    required this.description,
    required this.platform,
    required this.releaseDate,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'platform': platform.toJson(),
      'release_date': releaseDate,
      'status': status,
    };
  }

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    return VideoGame(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      platform: json['platform'],
      releaseDate: json['release_date'],
      status: json['status'],
    );
  }
}
