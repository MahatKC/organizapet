import 'package:flutter/material.dart';
import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_controller.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class CheckboxPessoa extends StatefulWidget {
  final String nome_projeto;
  final popupAdicionarPessoaController controller;

  const CheckboxPessoa(
      {Key? key, required this.nome_projeto, required this.controller})
      : super(key: key);

  @override
  _CheckboxPessoaState createState() => _CheckboxPessoaState();
}

class _CheckboxPessoaState extends State<CheckboxPessoa> {
  @override
  Widget build(BuildContext context) {
    if (widget.nome_projeto == "") {
      return Container(
        width: 300,
        height: 320,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 25),
              child: Icon(
                Icons.warning_rounded,
                size: 100,
                color: Colors.orange,
              ),
            ),
            Text(
              "Não é possivel adicionar membros/gerentes sem o nome do projeto preenchido. \n\nInsira-o e tente novamente.",
              textAlign: TextAlign.center,
              style: TextStyles.textCheckBoxPessoa,
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.controller.petianos_names.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(widget.controller.petianos_names[index]),
                value: widget.controller.petianos[index],
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.controller.petianos[index] = newValue ?? false;
                  });
                });
          });
    }
  }
}
