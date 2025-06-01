import 'package:flutter/material.dart';
import 'package:hw58/widgets/add_game_form/add_game_controllers.dart';
import 'package:hw58/widgets/custom_text_form_field.dart';

class AddGameForm extends StatefulWidget {
  final Widget platformSelector;
  final Widget statusSelector;
  final AddGameController controller;
  const AddGameForm({
    super.key,
    required this.controller,
    required this.platformSelector,
    required this.statusSelector,
  });

  @override
  State<AddGameForm> createState() => _AddGameFormState();
}

class _AddGameFormState extends State<AddGameForm> {
  @override
  Widget build(BuildContext context) {
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
          widget.platformSelector,
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: 'Enter Game year',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 3) {
                return 'Please enter game name';
              }
              return null;
            },
            controller: widget.controller.releaseDateController,
          ),
          SizedBox(height: 20),
          widget.statusSelector,
        ],
      ),
    );
  }
}
