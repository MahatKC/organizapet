import 'package:flutter/material.dart';

class PetianoInputField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hint;
  final bool? not_in_database;

  const PetianoInputField({
    Key? key,
    required this.ctrl,
    required this.hint,
    this.not_in_database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enable;
    enable = (not_in_database) ?? false;

    return TextField(
      controller: ctrl,
      decoration: InputDecoration(hintText: " " + hint),
      enabled: enable,
    );
  }
}
