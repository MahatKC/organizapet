import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class LongTextInput extends StatelessWidget {
  final String textoLabel;
  final TextEditingController ctrl;
  const LongTextInput({Key? key, required this.textoLabel, required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: TextField(
            controller: ctrl,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: AppColors.lightBlueBorder, width: 1)),
                labelText: textoLabel,
                labelStyle: TextStyles.darkBlue)));
  }
}
