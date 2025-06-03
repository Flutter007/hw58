import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String label;
  final String? initialSelection;
  final void Function(String?)? onSelected;
  final Key? validKey;
  final String? errorText;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  const CustomDropDownMenu({
    super.key,
    required this.label,
    required this.initialSelection,
    this.onSelected,
    required this.dropdownMenuEntries,
    this.validKey,
    required this.errorText,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      key: widget.validKey,
      expandedInsets: EdgeInsets.all(20),
      width: 370,
      errorText: widget.errorText,
      label: Text(widget.label),
      requestFocusOnTap: false,
      initialSelection: widget.initialSelection,
      inputDecorationTheme: InputDecorationTheme(),
      onSelected: widget.onSelected,
      dropdownMenuEntries: widget.dropdownMenuEntries,
    );
  }
}
