import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_arguments.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/checkbox_pessoa.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';

class PopupAdicionarPessoa extends StatefulWidget {
  final EditarProjetoArguments dados;
  final String descricao;
  final bool is_popup_gerentes;
  final String nome_projeto;
  const PopupAdicionarPessoa(
      {Key? key,
      required this.nome_projeto,
      required this.is_popup_gerentes,
      required this.dados,
      required this.descricao})
      : super(key: key);

  @override
  _PopupAdicionarPessoaState createState() => _PopupAdicionarPessoaState();
}

class _PopupAdicionarPessoaState extends State<PopupAdicionarPessoa> {
  final controller = popupAdicionarPessoaController();
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = controller.populateController(
        widget.is_popup_gerentes, widget.nome_projeto);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.descricao);
    return FutureBuilder(
        future: start,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            String popuptitle;
            if (widget.is_popup_gerentes) {
              popuptitle = "Adicionar gerentes";
            } else {
              popuptitle = "Adicionar membros";
            }
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
                            popuptitle,
                            style: TextStyles.darkBlue,
                          ),
                        ),
                        CheckboxPessoa(
                          nome_projeto: widget.nome_projeto,
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
    if (widget.nome_projeto != "") {
      if (widget.is_popup_gerentes) {
        adicionar_gerente();
      } else {
        adicionar_membro();
      }
    }
    remove_popup_and_refresh(context);
  }

  Future<void> adicionar_membro() async {
    List<int> indices = [];
    for (int i = 0; i < controller.petianos_old.length; i++) {
      if (controller.petianos[i] != controller.petianos_old[i]) {
        indices.add(i);
      }
    }
    await controller.write_membro(indices, widget.nome_projeto);
  }

  Future<void> adicionar_gerente() async {
    List<int> indices = [];
    for (int i = 0; i < controller.petianos_old.length; i++) {
      if (controller.petianos[i] != controller.petianos_old[i]) {
        indices.add(i);
      }
    }
    await controller.write_gerente(indices, widget.nome_projeto);
  }

  void remove_popup_and_refresh(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "/editar_projeto",
        arguments: EditarProjetoArguments(
            nome: widget.nome_projeto,
            user: widget.dados.user,
            descricao: widget.descricao));
  }
}
