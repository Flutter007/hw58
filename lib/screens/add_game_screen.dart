import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/widgets/add_game_form/add_game_form.dart';
import '../providers/platforms_list_provider.dart';
import '../providers/statuses_list_provider.dart';
import '../widgets/add_game_form/add_game_controllers.dart';

class AddGameScreen extends ConsumerStatefulWidget {
  const AddGameScreen({super.key});

  @override
  ConsumerState<AddGameScreen> createState() => _AddGameScreenState();
}

class _AddGameScreenState extends ConsumerState<AddGameScreen> {
  final gameController = AddGameController();
  String? selectedPlatform;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final platforms = ref.watch(platformsProvider);
    final statuses = ref.watch(statusesProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          AddGameForm(
            controller: gameController,
            platformSelector: DropdownMenu(
              width: 350,
              label: Text('Choose platform:'),
              initialSelection: selectedPlatform,
              onSelected: (value) => setState(() => selectedPlatform = value),
              dropdownMenuEntries:
                  platforms
                      .map(
                        (t) => DropdownMenuEntry(
                          value: t.id,
                          label: t.title,
                          leadingIcon: Image.network(
                            t.logo,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      )
                      .toList(),
            ),
            statusSelector: DropdownMenu(
              width: 350,
              label: Text('Choose status:'),
              initialSelection: selectedStatus,
              onSelected: (value) => setState(() => selectedStatus = value),
              dropdownMenuEntries:
                  statuses
                      .map(
                        (s) => DropdownMenuEntry(
                          value: s.id,
                          label: s.title,
                          leadingIcon: Icon(s.icon),
                        ),
                      )
                      .toList(),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {},
            child: Text('Add', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
