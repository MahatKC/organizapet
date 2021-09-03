import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/popup/popup_adicionar_membro.dart';

class IconTitleSubtitleBoxEditavel extends StatefulWidget {
  final String titulo;

  final String subtitulo;
  const IconTitleSubtitleBoxEditavel(
      {Key? key, required this.titulo, required this.subtitulo})
      : super(key: key);

  @override
  _IconTitleSubtitleBoxEditavelState createState() =>
      _IconTitleSubtitleBoxEditavelState();
}

class _IconTitleSubtitleBoxEditavelState
    extends State<IconTitleSubtitleBoxEditavel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.lightBlueBorder, width: 1)),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Membros",
                        style: TextStyles.darkBlue,
                      )),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => PopupAdicionarMembro());
                      },
                      icon: Image.asset(AppImages.adicionarMembro)))
            ]),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.subtitulo,
                    style: TextStyles.buttonGray,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.subtitulo));
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
    } else {
      return Text(texto, style: TextStyles.infoBox, textAlign: TextAlign.left);
    }
  }
}

  // title: BoxWithTextAdjustment(texto: widget.titulo),
  //         subtitle: BoxWithTextAdjustment(texto: widget.subtitulo),
  //         leading: Image.asset(AppImages.adicionarMembro),
          