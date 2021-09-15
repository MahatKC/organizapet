import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/popup_adicionar_projeto/popup_adicionar_projeto.dart';

class PopupAdicionarProjetoSelector extends StatelessWidget {
  final EditarPetianoArguments dados;
  final String nome_membro;
  final bool activate;

  const PopupAdicionarProjetoSelector(
      {Key? key,
      required this.dados,
      required this.nome_membro,
      required this.activate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (activate) {
      return PopupAdicionarProjeto(dados: dados, nome_membro: nome_membro);
    } else {
      return Container();
    }
  }
}
