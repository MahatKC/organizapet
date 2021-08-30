import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_db_controller.dart';

class projetosController {
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final membrosController = TextEditingController(); //nomes abreviados
  final gerentesController = TextEditingController(); //nomes abreviados
  late final List<String> membros_nomes;
  late final List<String> membros_nomes_curtos;
  late final List<String> gerente_nome;
  late final List<String> gerente_nome_curto;

  projetosController();

  List get_all_controller_info() {
    List<String> all_texts = List.empty(growable: true);

    all_texts.add(nomeController.text);
    all_texts.add(descricaoController.text);
    all_texts.add(membrosController.text);
    all_texts.add(gerentesController.text);

    return [
      all_texts,
      gerente_nome,
      membros_nomes,
      gerente_nome_curto,
      membros_nomes_curtos
    ];
  }

  void instantiateAll(dadosProjeto dbController) {
    List<String> gerentes = dbController.gerente_nome_abreviado ?? [];
    List<String> membros = dbController.membros_nomes_abreviados ?? [];
    gerente_nome = dbController.gerente_nome ?? [];
    gerente_nome_curto = dbController.gerente_nome_curto ?? [];
    membros_nomes = dbController.membros_nomes ?? [];
    membros_nomes_curtos = dbController.membros_nomes_curtos ?? [];

    nomeController.text = dbController.nome;
    descricaoController.text = dbController.descricao ?? "";
    membrosController.text = membros.join(", ");
    gerentesController.text = gerentes.join(", ");
  }
}
