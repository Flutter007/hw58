import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/data/platform_data.dart';
import 'package:hw58/models/game_platform.dart';

final platformsProvider = Provider((ref) {
  return platforms;
});

final platformByIdProvider = Provider.family<GamePlatform, String>((ref, id) {
  final platforms = ref.watch(platformsProvider);
  return platforms.firstWhere((p) => p.id == id);
});
