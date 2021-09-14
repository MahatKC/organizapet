import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/database_document_title.dart';
import 'package:organizapet/modules/useful_functions/first_and_last_name.dart';
import 'package:organizapet/modules/useful_functions/nome_abreviado.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _projetos = _firestore.collection('projetos');
final CollectionReference _petianos = _firestore.collection('petianos');

class popupAdicionarPessoaDBController {
  Future<List<String>> readGerentes(String nome_projeto) async {
    late List<String> gerentes;

    await _projetos
        .doc(document_title(nome_projeto))
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            gerentes =
                gerentesFromJson(snapshot.data() as Map<String, dynamic>);
          } else {
            gerentes = [];
            print("Non Ecziste");
          }
        })
        .then((value) => print("Projeto $nome_projeto lido"))
        .catchError((error) => print("Falha $error"));

    return gerentes;
  }

  List<String> gerentesFromJson(Map<String, dynamic> data) {
    return List.from(data['gerente_nome_curto'] ?? []);
  }

  Future<List<String>> readMembros(String nome_projeto) async {
    late List<String> membros;

    await _projetos
        .doc(document_title(nome_projeto))
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            membros = membrosFromJson(snapshot.data() as Map<String, dynamic>);
          } else {
            membros = [];
            print("Non Ecziste");
          }
        })
        .then((value) => print("Projeto $nome_projeto lido"))
        .catchError((error) => print("Falha $error"));

    return membros;
  }

  List<String> membrosFromJson(Map<String, dynamic> data) {
    return List.from(data['membros_nomes_curtos'] ?? []);
  }

  Future<List<List<String>>> readAll() async {
    List<String> membros_nome = [];
    List<String> membros_nome_curto = [];

    await _petianos.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        membros_nome.add(doc["nome"]);
        membros_nome_curto.add(
            first_and_last_name_from_string(doc["nome"], doc["nome_curto"]));
      });
    });

    List<List<String>> lista_de_listas = [];
    lista_de_listas.add(membros_nome);
    lista_de_listas.add(membros_nome_curto);

    return lista_de_listas;
  }

  Future<void> write_membro(List<String> nome, List<String> nome_curto,
      List<String> nome_abrv, String nome_projeto) async {
    await _projetos
        .doc(document_title(nome_projeto))
        .set({
          "membros_nomes": FieldValue.arrayUnion(nome),
          "membros_nomes_curtos": FieldValue.arrayUnion(nome_curto),
          "membros_nomes_abreviados": FieldValue.arrayUnion(nome_abrv)
        }, SetOptions(merge: true))
        .then((value) => print("$nome_projeto atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    var projeto_nome = [nome_projeto];
    nome.forEach((nome) async {
      await _petianos
          .doc(document_title(nome))
          .set({"projetos_membro": FieldValue.arrayUnion(projeto_nome)},
              SetOptions(merge: true))
          .then((value) => print("Membro $nome_projeto atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
  }

  Future<void> write_gerente(List<String> nome, List<String> nome_curto,
      List<String> nome_abrv, String nome_projeto) async {
    await _projetos
        .doc(document_title(nome_projeto))
        .set({
          "gerente_nome": FieldValue.arrayUnion(nome),
          "gerente_nome_curto": FieldValue.arrayUnion(nome_curto),
          "gerente_nome_abreviado": FieldValue.arrayUnion(nome_abrv)
        }, SetOptions(merge: true))
        .then((value) => print("$nome_projeto atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    var projeto_nome = [nome_projeto];
    nome.forEach((nome) async {
      await _petianos
          .doc(document_title(nome))
          .set({"projetos_gerente": FieldValue.arrayUnion(projeto_nome)},
              SetOptions(merge: true))
          .then(
              (value) => print("Gerente $nome_projeto atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
  }

  Future<void> remove_membro(List<String> nome, List<String> nome_curto,
      List<String> nome_abrv, String nome_projeto) async {
    await _projetos
        .doc(document_title(nome_projeto))
        .set({
          "membros_nomes": FieldValue.arrayRemove(nome),
          "membros_nomes_curtos": FieldValue.arrayRemove(nome_curto),
          "membros_nomes_abreviados": FieldValue.arrayRemove(nome_abrv)
        }, SetOptions(merge: true))
        .then((value) => print("$nome_projeto atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    var projeto_nome = [nome_projeto];
    nome.forEach((nome_petiano) async {
      await _petianos
          .doc(document_title(nome_petiano))
          .set({"projetos_membro": FieldValue.arrayRemove(projeto_nome)},
              SetOptions(merge: true))
          .then((value) => print("Membro $nome_petiano atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
  }

  Future<void> remove_gerente(List<String> nome, List<String> nome_curto,
      List<String> nome_abrv, String nome_projeto) async {
    await _projetos
        .doc(document_title(nome_projeto))
        .set({
          "gerente_nome": FieldValue.arrayRemove(nome),
          "gerente_nome_curto": FieldValue.arrayRemove(nome_curto),
          "gerente_nome_abreviado": FieldValue.arrayRemove(nome_abrv)
        }, SetOptions(merge: true))
        .then((value) => print("$nome_projeto atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    var projeto_nome = [nome_projeto];
    nome.forEach((nome_petiano) async {
      await _petianos
          .doc(document_title(nome_petiano))
          .set({"projetos_gerente": FieldValue.arrayRemove(projeto_nome)},
              SetOptions(merge: true))
          .then((value) => print("Membro $nome_petiano atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
  }
}
