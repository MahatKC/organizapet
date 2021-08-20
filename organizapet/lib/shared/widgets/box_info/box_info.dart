import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class BoxInfo extends StatelessWidget {
  final String imagem;
  final String texto;
  const BoxInfo({Key? key, required this.imagem, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 42, right: 42),
      child: Container(
        // height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.boxListBorder, width: 1)),
        child: ListTile(
          title: BoxWithTextAdjustment(texto: texto),
          leading: Image.asset(imagem),
          onLongPress: () {
            copyToClipboard();
            final snackBar = SnackBar(
              content: Text(
                "Dado copiado!",
                style: TextStyles.textCopy,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }

  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: texto));
  }
}

class BoxWithTextAdjustment extends StatelessWidget {
  const BoxWithTextAdjustment({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    if (texto.isNotEmpty) {
      return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(texto,
              style: TextStyles.infoBox, textAlign: TextAlign.left));
    }else{
      return Text(texto,
              style: TextStyles.infoBox, textAlign: TextAlign.left);
    }
  }
}
