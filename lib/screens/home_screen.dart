import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: TabBarView(children: [Placeholder(), Placeholder()]),
      ),
    );
  }
}
