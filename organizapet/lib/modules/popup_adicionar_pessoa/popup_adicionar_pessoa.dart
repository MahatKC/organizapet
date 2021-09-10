import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/checkbox_pessoa.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';

class PopupAdicionarPessoa extends StatefulWidget {
  final bool is_popup_gerentes;
  final String nome_projeto;
  const PopupAdicionarPessoa(
      {Key? key, required this.nome_projeto, required this.is_popup_gerentes})
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
                            "Adicionar Membros",
                            style: TextStyles.darkBlue,
                          ),
                        ),
                        // CheckboxPessoa(ctrl: controller.petianos, size: 4),
                        CheckboxPessoa(
                          nome_projeto: widget.nome_projeto,
                          petianos_membros: controller.petianos,
                          petianos_names: controller.petianos_names,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CenterTextButton(
                            buttonLabel: "Adicionar",
                            callback: adicionar_membro_button)
                      ],
                    )))
              ],
            );
          }
        });
  }
}

void adicionar_membro_button() {
  print("adicionar membro button");
}
