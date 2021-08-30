import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'editar_petianos_db_controller.dart';

class petianosController {
  final nomeController = TextEditingController();
  final nomeCurtoController = TextEditingController();
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

  final maskTelefone = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  final maskCpf = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  final maskRg = new MaskTextInputFormatter(
      mask: '##.###.###-#', filter: {"#": RegExp(r'[0-9]')});
  final maskDtNascimento = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  final maskAno =
      new MaskTextInputFormatter(mask: '#°', filter: {"#": RegExp(r'[1-9]')});

  petianosController();

  List get_all_texts() {
    List<String> all_texts = List.empty(growable: true);

    all_texts.add(nomeController.text);
    all_texts.add(nomeCurtoController.text);
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

  void instantiateAll(dadosPetiano dbController) {
    nomeController.text = dbController.nome;
    nomeCurtoController.text = dbController.nomeCurto ?? "";
    rgController.text = dbController.rg ?? "";
    cpfController.text = dbController.cpf ?? "";
    raController.text = dbController.ra ?? "";
    telefoneController.text = dbController.telefone ?? "";
    emailController.text = dbController.email ?? "";
    dataNascimentoController.text = dbController.dataNascimento ?? "";
    anoController.text = dbController.ano ?? "";
    temaICVController.text = dbController.temaICV ?? "";
    orientadorController.text = dbController.orientador ?? "";
    camisetaController.text = dbController.camiseta ?? "";
    githubController.text = dbController.github ?? "";
    instagramController.text = dbController.instagram ?? "";
  }
}
