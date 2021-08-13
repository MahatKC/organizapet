import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PetianoInputField extends StatelessWidget {
  final TextEditingController ctrl;
  final MaskTextInputFormatter? mascara;
  final String hint;
  final bool? not_in_database;

  const PetianoInputField({
    Key? key,
    required this.ctrl,
    this.mascara,
    required this.hint,
    this.not_in_database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enable;
    enable = (not_in_database) ?? true;

    return TextField(
      controller: ctrl,
      decoration: InputDecoration(hintText: " " + hint),
      enabled: enable,
      inputFormatters: [mascara ?? MaskTextInputFormatter()],
    );
  }
}
