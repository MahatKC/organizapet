import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class TitleSubtitleBox extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback callback;
  const TitleSubtitleBox(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 60, right: 60),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: AppColors.lightBlueBackground,
              border: Border.all(color: AppColors.lightBlueBorder, width: 1)),
          child: Align(
            child: ListTile(
                title: dimensionarTexto(titulo),
                subtitle: Text(
                  subtitulo,
                  style: TextStyles.subtitleBlue,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 32,
                    color: AppColors.arrow,
                  ),
                  onPressed: callback,
                )),
          )),
    );
  }

  dimensionarTexto(String titulo) {
    if (titulo.isNotEmpty) {
      return AutoSizeText(
        titulo,
        style: TextStyles.darkBlue,
        minFontSize: 15,
        maxLines: 1,
      );
    } else {
      return Text(titulo,
          style: TextStyles.darkBlue, textAlign: TextAlign.left);
    }
  }
}
