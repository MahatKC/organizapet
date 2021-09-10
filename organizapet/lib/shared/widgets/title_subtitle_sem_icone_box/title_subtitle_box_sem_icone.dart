import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TitleSubtitleBoxSemIcone extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  const TitleSubtitleBoxSemIcone(
      {Key? key, required this.titulo, required this.subtitulo})
      : super(key: key);

  @override
  _TitleSubtitleBoxSemIconeState createState() =>
      _TitleSubtitleBoxSemIconeState();
}

class _TitleSubtitleBoxSemIconeState extends State<TitleSubtitleBoxSemIcone> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 42, right: 42),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: AppColors.lightBlueBorder, width: 1)),
          child: Align(
            child: ListTile(
              title: Text(
                widget.titulo,
                style: TextStyles.darkBlue,
              ),
              subtitle: dimensionarTexto(widget.subtitulo),
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
          )),
    );
  }

  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.subtitulo));
  }
}

dimensionarTexto(String subtitulo) {
  if (subtitulo.isNotEmpty) {
    return AutoSizeText(
      subtitulo,
      style: TextStyles.infoBox,
      minFontSize: 15,
      maxLines: 3,
    );
  } else {
    return Text(subtitulo,
        style: TextStyles.infoBox, textAlign: TextAlign.left);
  }
}
