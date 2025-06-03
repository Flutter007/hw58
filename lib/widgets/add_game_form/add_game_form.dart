import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw58/widgets/add_game_form/add_game_controllers.dart';
import 'package:hw58/widgets/custom_text_form_field.dart';
import '../../providers/platforms_list_provider.dart';
import '../../providers/statuses_list_provider.dart';
import '../custom_drop_down_menu.dart';

class AddGameForm extends ConsumerStatefulWidget {
  final bool platformError;
  final bool statusError;
  final AddGameController controller;

  const AddGameForm({
    super.key,
    required this.controller,
    required this.platformError,
    required this.statusError,
  });

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
            labelText: 'Enter game name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter game name';
              }
              return null;
            },
            controller: widget.controller.nameController,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Enter game description',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter game description';
              }
              return null;
            },
            controller: widget.controller.descriptionController,
          ),
          SizedBox(height: 20),
          CustomDropDownMenu(
            key: ValueKey('pl-$platform'),
            label: 'Choose platform:',
            initialSelection: platform,
            errorText: widget.platformError ? 'Please choose platform' : null,
            onSelected:
                (value) =>
                    ref.read(selectedPlatformProvider.notifier).state = value,
            dropdownMenuEntries:
                platforms
                    .map(
                      (t) => DropdownMenuEntry(
                        value: t.id,
                        label: t.title,
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(
                            TextStyle(fontSize: 18),
                          ),
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(vertical: 5),
                          ),
                        ),
                        leadingIcon: Image.network(
                          t.logo,
                          width: 80,
                          height: 60,
                        ),
                      ),
                    )
                    .toList(),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: 'Enter game year',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 4) {
                return 'Please enter game year';
              } else if (int.parse(value) < 1950) {
                return 'Enter correct year';
              }
              return null;
            },
            controller: widget.controller.releaseDateController,
          ),
          SizedBox(height: 20),
          CustomDropDownMenu(
            initialSelection: status,
            key: ValueKey('st_$status'),
            label: 'Choose status:',
            errorText: widget.statusError ? 'Please choose status' : null,
            onSelected:
                (value) =>
                    ref.read(selectedStatusProvider.notifier).state = value,
            dropdownMenuEntries:
                statuses
                    .map(
                      (t) => DropdownMenuEntry(
                        value: t.id,
                        label: t.title,
                        leadingIcon: Icon(t.icon, size: 40),
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(
                            TextStyle(fontSize: 17),
                          ),
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(vertical: 3),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
