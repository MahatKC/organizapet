import 'package:flutter/material.dart';

class circleButton extends StatelessWidget {
  final String tipoBotao;
  const circleButton({
    required this.tipoBotao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icone;
    Color cor;
    CrossAxisAlignment alinhamento;
    if (tipoBotao == 'edit') {
      icone = Icons.edit;
      cor = Colors.blue;
      alinhamento = CrossAxisAlignment.end;
    } else if (tipoBotao == 'add') {
      icone = Icons.add;
      cor = Colors.blue;
      alinhamento = CrossAxisAlignment.end;
    } else {
      icone = Icons.delete;
      cor = Colors.red;
      alinhamento = CrossAxisAlignment.start;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 15, bottom: 30, left: 20),
      child: Column(crossAxisAlignment: alinhamento, children: [
        RawMaterialButton(
          onPressed: () {
            //TO-DO!!!
            if (tipoBotao == 'edit') {
              //go_to_edicao();
            } else if (tipoBotao == 'add') {
              //go_to_adicao();
            } else {
              //delete_this_person();
            }
          },
          fillColor: cor,
          elevation: 2.0,
          child: Icon(
            icone,
            color: Colors.white,
            size: 30.0,
          ),
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
        ),
      ]),
    );
  }
}
