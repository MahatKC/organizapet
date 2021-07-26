import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/useful_functions/print_current_time.dart';

class petianosController {
  final nomeController = TextEditingController();
  final rgController = TextEditingController();
  final cpfController = TextEditingController();
  final raController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final anoController = TextEditingController();
  final temaICVController = TextEditingController();
  final orientadorController = TextEditingController();
  final camisetaController = TextEditingController();
  final githubController = TextEditingController();
  final instagramController = TextEditingController();

  petianosController();

  List get_all_texts() {
    List<String> all_texts = List.empty(growable: true);

    all_texts.add(nomeController.text);
    all_texts.add(rgController.text);
    all_texts.add(cpfController.text);
    all_texts.add(raController.text);
    all_texts.add(telefoneController.text);
    all_texts.add(emailController.text);
    all_texts.add(dataNascimentoController.text);
    all_texts.add(anoController.text);
    all_texts.add(temaICVController.text);
    all_texts.add(orientadorController.text);
    all_texts.add(camisetaController.text);
    all_texts.add(githubController.text);
    all_texts.add(instagramController.text);

    return all_texts;
  }

  void not_null() {}

  void instantiateAll(dadosPetiano dbController) {
    print_time_now("outside controller");
    if (dbController.rg != null) {
      print_time_now("in controller");
      nomeController.text = dbController.nome;
      rgController.text = dbController.rg.toString();
      cpfController.text = dbController.cpf.toString();
      raController.text = dbController.ra.toString();
      telefoneController.text = dbController.telefone.toString();
      emailController.text = dbController.email.toString();
      dataNascimentoController.text = dbController.dataNascimento.toString();
      anoController.text = dbController.ano.toString();
      temaICVController.text = dbController.temaICV.toString();
      orientadorController.text = dbController.orientador.toString();
      camisetaController.text = dbController.camiseta.toString();
      githubController.text = dbController.github.toString();
      instagramController.text = dbController.instagram.toString();
    }
  }
}
