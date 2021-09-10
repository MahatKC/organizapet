import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/widgets/icon_textfield/icon_textfield.dart';

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
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
        ],
        keyboardType: tipo,
      );
    }
    if (hint == "Nome") {
      return TextField(
        controller: ctrl,
        decoration: InputDecoration(hintText: " " + hint),
        enabled: enable,
        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp(r'^[a-zA-Z\u00C0-\u00FF\s]*'))
        ],
        keyboardType: tipo,
      );
    }
    if (hint == "Gerente") {
      return TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => PopupAdicionarPessoa());
              },
              icon: Image.asset(AppImages.adicionarMembro)),
          hintText: "Gerente",
        ),
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
