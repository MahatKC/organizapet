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
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.lightBlueBackground,
              border: Border.all(color: AppColors.lightBlueBorder, width: 2)),
          child: Align(
            child: ListTile(
                title: Text(
                  titulo,
                  style: TextStyles.darkBlue,
                ),
                subtitle: dimensionarTexto(subtitulo),
                ),
          )),
    );
  }
}

dimensionarTexto(String subtitulo){
  if (subtitulo.isNotEmpty) {
      return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(subtitulo,
              style: TextStyles.infoBox, textAlign: TextAlign.left));
    } else {
      return Text(subtitulo, style: TextStyles.infoBox, textAlign: TextAlign.left);
    }
}
