
import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_db_controller.dart';

class projetosController {
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final membrosController = TextEditingController();
  final gerentesController = TextEditingController();

  projetosController();

  List get_all_texts() {
    List<String> all_texts = List.empty(growable: true);

    all_texts.add(nomeController.text);
    all_texts.add(descricaoController.text);
    all_texts.add(membrosController.text);
    all_texts.add(gerentesController.text);

    return all_texts;
  }

  void instantiateAll(dadosProjeto dbController) {
    List<String> gerentes = dbController.gerente_nome_abreviado ?? [];
    List<String> membros = dbController.membros_nomes_abreviados ?? [];

    nomeController.text = dbController.nome;
    descricaoController.text = dbController.descricao ?? "";
    membrosController.text = membros.join(", ");
    gerentesController.text = gerentes.join(", ");
  }
}