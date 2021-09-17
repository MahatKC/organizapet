import 'package:flutter/material.dart';
import 'package:organizapet/modules/current_user_data/current_user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petianos_db_controller.dart';

import 'login_google_auth.dart';

class loginController {
  late String email;
  late String name_key;

  loginController();

  bool googleLogin(BuildContext context) {
    bool has_access = false;
    executeLogin(context).then((value) => has_access = value);

    return has_access;
  }

  Future<bool> executeLogin(BuildContext context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _users = _firestore.collection('users');
    final user = await Authentication.signInWithGoogle(context: context);

    String? email = user!.email;
    bool has_access = false;

    await _users
        .doc(email)
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            has_access = true;
            nameKeyFromJson(snapshot.data() as Map<String, dynamic>);
          }
        })
        .then((value) => print("Usuário $email lido"))
        .catchError((error) => print("Falha $error"));

    return has_access;
  }

  nameKeyFromJson(Map<String, dynamic> data) {
    this.name_key = data['name_key'];
  }

  Future<CurrentUserData> getUser() async {
    dadosPetiano dadosUsuario = dadosPetiano(nome: "");
    await dadosUsuario.read_from_login(name_key);

    bool isTutor = await readIsTutor(name_key);

    List<String> gerente = await readGerente(name_key);

    CurrentUserData user = CurrentUserData();
    await user.set_prefs(
        new_name: dadosUsuario.nome,
        new_nomeCurto: dadosUsuario.nomeCurto,
        new_isTutor: isTutor,
        new_gerenciaProjetos: gerente);

    return user;
  }

  bool isTutor(String name_key) {
    bool isTutor = false;
    readIsTutor(name_key).then((value) => isTutor = value);
    return isTutor;
  }

  Future<bool> readIsTutor(String name_key) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _tutor = _firestore.collection('tutor');
    bool isTutor = false;

    await _tutor
        .doc(name_key)
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            isTutor = true;
          }
        })
        .then((value) => print("Tutor lido"))
        .catchError((error) => print("Falha $error"));

    return isTutor;
  }

  Future<List<String>> readGerente(String name_key) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _petianos = _firestore.collection('petianos');
    List<String> projetos = [];

    await _petianos
        .doc(name_key)
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            projetos = gerenteFromJson(snapshot.data() as Map<String, dynamic>);
          }
        })
        .then((value) => print("Tutor lido"))
        .catchError((error) => print("Falha $error"));

    return projetos;
  }

  List<String> gerenteFromJson(Map<String, dynamic> data) {
    return List.from(data['projetos_gerente'] ?? []);
  }
}
