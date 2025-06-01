import 'package:flutter/material.dart';

class AddGameController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final releaseDateController = TextEditingController();

  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    releaseDateController.dispose();
  }
}
