import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa.dart';

class IconTitleSubtitleBoxEditavel extends StatefulWidget {
  final EditarProjetoArguments dados;
  final String titulo;
  final String subtitulo;
  final nome_projeto_controller;
  const IconTitleSubtitleBoxEditavel(
      {Key? key,
      required this.dados,
      required this.titulo,
      required this.subtitulo,
      required this.nome_projeto_controller})
      : super(key: key);

  @override
  _IconTitleSubtitleBoxEditavelState createState() =>
      _IconTitleSubtitleBoxEditavelState();
}

class _IconTitleSubtitleBoxEditavelState
    extends State<IconTitleSubtitleBoxEditavel> {
  @override
  Widget build(BuildContext context) {
    double sizeHeight;
    if (widget.titulo == "Gerentes") {
      sizeHeight = 90;
    } else {
      sizeHeight = 150;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: sizeHeight,
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
                        widget.titulo,
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
                            builder: (BuildContext context) =>
                                PopupAdicionarPessoa(
                                  dados: widget.dados,
                                  is_popup_gerentes:
                                      widget.titulo == "Gerentes",
                                  nome_projeto: get_projeto_nome(widget.dados.nome, widget.nome_projeto_controller.text),
                                ));
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

  String get_projeto_nome(String dados_nome, String controller_nome) {
    String nome;

    if (dados_nome == "") {
      nome = controller_nome;
    } else {
      nome = dados_nome;
    }

    return nome;
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
          