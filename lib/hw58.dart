import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/screens/home_screen.dart';

class Hw58 extends ConsumerWidget {
  const Hw58({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(home: HomeScreen());
  }
}
