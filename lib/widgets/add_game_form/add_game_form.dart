import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/widgets/add_game_form/add_game_controllers.dart';
import 'package:hw58/widgets/custom_text_form_field.dart';

import '../../providers/platforms_list_provider.dart';
import '../../providers/statuses_list_provider.dart';

class AddGameForm extends ConsumerStatefulWidget {
  final AddGameController controller;

  const AddGameForm({super.key, required this.controller});

  @override
  ConsumerState<AddGameForm> createState() => _AddGameFormState();
}

class _AddGameFormState extends ConsumerState<AddGameForm> {
  @override
  Widget build(BuildContext context) {
    final platforms = ref.watch(platformsProvider);
    final statuses = ref.watch(statusesProvider);
    final platform = ref.watch(selectedPlatformProvider);
    final status = ref.watch(selectedStatusProvider);

    return Form(
      key: widget.controller.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: 'Enter Game name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 3) {
                return 'Please enter game name';
              }
              return null;
            },
            controller: widget.controller.nameController,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Enter Game description',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter game description';
              }
              return null;
            },
            controller: widget.controller.descriptionController,
          ),
          SizedBox(height: 20),
          DropdownMenu(
            width: 370,
            label: Text('Choose platform:'),
            initialSelection: platform,
            errorText: 'Please choose platform',
            inputDecorationTheme: InputDecorationTheme(),
            onSelected:
                (value) =>
                    ref.read(selectedPlatformProvider.notifier).state = value,
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
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: 'Enter Game year',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter game year';
              } else if (int.parse(value) < 1950) {
                return 'Enter correct year';
              }
              return null;
            },
            controller: widget.controller.releaseDateController,
          ),
          SizedBox(height: 20),
          DropdownMenu(
            initialSelection: status,
            width: 370,
            label: Text('Choose status:'),
            errorText: 'Please choose status',
            inputDecorationTheme: InputDecorationTheme(),
            onSelected:
                (value) =>
                    ref.read(selectedStatusProvider.notifier).state = value,
            dropdownMenuEntries:
                statuses
                    .map(
                      (t) => DropdownMenuEntry(
                        value: t.id,
                        label: t.title,
                        leadingIcon: Icon(t.icon),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
