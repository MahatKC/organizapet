import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/checkbox_pessoa.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';

class PopupAdicionarPessoa extends StatefulWidget {
  const PopupAdicionarPessoa({Key? key}) : super(key: key);

  @override
  _PopupAdicionarPessoaState createState() => _PopupAdicionarPessoaState();
}

class _PopupAdicionarPessoaState extends State<PopupAdicionarPessoa> {
  final controller = popupAdicionarPessoaController();

  @override
  Widget build(BuildContext context) {
    print("popup foi");
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        Container(
            width: 400,
            height: 500,
            child: SingleChildScrollView(child: Column(
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
                  petianos_membros: [true, false, true, false, true, false, true, false],
                  petianos_names: ["Davi", "Roberta", "Davi", "Roberta", "Davi", "Roberta", "Davi", "Roberta"],
                ),
                SizedBox(
                  height: 5,
                ),
                CenterTextButton(
                    buttonLabel: "Adicionar", callback: adicionar_membro_button)
              ],
            )))
      ],
    );
  }
}

void adicionar_membro_button() {
  print("adicionar membro button");
}
