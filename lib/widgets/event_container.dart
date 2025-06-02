import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  final String txt;
  final IconData icon;
  const EventContainer({super.key, required this.txt, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade400, Colors.blueAccent.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80),
            Text(txt, style: TextStyle(fontSize: 36)),
          ],
        ),
      ),
    );
  }
}
