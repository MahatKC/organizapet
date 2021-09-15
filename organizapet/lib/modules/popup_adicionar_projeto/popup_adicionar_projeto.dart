import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/popup_adicionar_projeto/checkbox_projeto.dart';
import 'package:organizapet/modules/popup_adicionar_projeto/popup_adicionar_projeto_controller.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';

class PopupAdicionarProjeto extends StatefulWidget {
  final EditarPetianoArguments dados;
  final String nome_membro;
  const PopupAdicionarProjeto(
      {Key? key,
      required this.dados,
      required this.nome_membro})
      : super(key: key);

  @override
  _PopupAdicionarProjetoState createState() => _PopupAdicionarProjetoState();
}

class _PopupAdicionarProjetoState extends State<PopupAdicionarProjeto> {
  final controller = popupAdicionarProjetoController();
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = controller.populateController(widget.nome_membro);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: start,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              actions: <Widget>[
                Container(
                    width: 400,
                    height: 500,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Adicionar projetos",
                            style: TextStyles.darkBlue,
                          ),
                        ),
                        CheckboxProjeto(
                          nome_membro: widget.nome_membro,
                          controller: controller,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CenterTextButton(
                            buttonLabel: "Adicionar",
                            callback: adicionar_button)
                      ],
                    )))
              ],
            );
          }
        });
  }

  void adicionar_button() {
    adicionar_projeto();
  }

  Future<void> adicionar_projeto() async {
    List<int> indices = [];
    for (int i = 0; i < controller.projetos.length; i++) {
      if (controller.projetos_selecionados[i]) {
        indices.add(i);
      }
    }
    await controller.write_projeto(indices, widget.nome_membro);

    remove_popup_and_refresh(context);
  }

  void remove_popup_and_refresh(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "/visualizar_dados_petiano",
        arguments: VisualizarDadosArguments(
            widget.nome_membro, false, widget.dados.user));
  }
}
