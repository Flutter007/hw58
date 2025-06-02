import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/data/status_data.dart';
import 'package:hw58/models/status.dart';

final statusesProvider = Provider((ref) {
  return statuses;
});
final selectedStatusProvider = StateProvider<String?>((ref) => null);

final statusByIdProvider = Provider.family<Status, String>((ref, id) {
  final statuses = ref.watch(statusesProvider);
  return statuses.firstWhere((p) => p.id == id);
});
