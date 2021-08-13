import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PetianoInputField extends StatelessWidget {
  final TextEditingController ctrl;
  final MaskTextInputFormatter? mascara;
  final String hint;
  final bool? isNumeric;
  final bool? not_in_database;

  const PetianoInputField({
    Key? key,
    required this.ctrl,
    this.mascara,
    required this.hint,
    this.isNumeric,
    this.not_in_database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enable;
    TextInputType tipo = TextInputType.text;
    enable = (not_in_database) ?? true;

    if (isNumeric == true) {
      tipo = TextInputType.number;
    }

    if (hint == "RA") {
      return TextField(
      controller: ctrl,
      decoration: InputDecoration(hintText: " " + hint),
      enabled: enable,
      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
      keyboardType: tipo,
    );
    }

    return TextField(
      controller: ctrl,
      decoration: InputDecoration(hintText: " " + hint),
      enabled: enable,
      inputFormatters: [mascara ?? MaskTextInputFormatter()],
      keyboardType: tipo,
    );
  }
}
