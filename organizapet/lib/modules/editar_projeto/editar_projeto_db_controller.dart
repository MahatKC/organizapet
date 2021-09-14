import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/data_list_to_string.dart';
import '../useful_functions/database_document_title.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _projetos = _firestore.collection('projetos');
final CollectionReference _petianos = _firestore.collection('petianos');

class dadosProjeto {
  String nome;
  String? descricao;
  List<String>? membros_nomes;
  List<String>? membros_nomes_abreviados;
  List<String>? membros_nomes_curtos;
  List<String>? gerente_nome;
  List<String>? gerente_nome_abreviado;
  List<String>? gerente_nome_curto;
  bool? in_db;

  dadosProjeto(
      {required this.nome,
      this.descricao,
      this.membros_nomes,
      this.membros_nomes_abreviados,
      this.membros_nomes_curtos,
      this.gerente_nome,
      this.gerente_nome_abreviado,
      this.gerente_nome_curto,
      this.in_db});

  dadosProjetoFromLista(List lista) {
    List<String> lista_controller = lista[0];

    this.descricao = lista_controller.elementAt(1);
    this.membros_nomes_abreviados = string_to_list(lista_controller, 2);
    this.gerente_nome_abreviado = string_to_list(lista_controller, 3);
    this.gerente_nome = lista[1];
    this.membros_nomes = lista[2];
    this.gerente_nome_curto = lista[3];
    this.membros_nomes_curtos = lista[4];
  }

  Future<void> write() async {
    await _projetos
        .doc(document_title(nome))
        .set({'nome': nome, 'descricao': descricao}, SetOptions(merge: true))
        .then((value) => print("$nome atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    /*
    if (email != null) {
      await _firestore
          .collection('users')
          .doc(document_title(email!))
          .set({'email': email}, SetOptions(merge: true))
          .then((value) => print("Usuário $email atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    }*/
  }

  Future<void> delete() async {
    membros_nomes!.forEach((membro) async {
      await _petianos
          .doc(document_title(membro))
          .set({"projetos_membro": FieldValue.arrayRemove([nome])},
              SetOptions(merge: true))
          .then((value) => print("Membro $membro atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
    gerente_nome!.forEach((gerente) async {
      await _petianos
          .doc(document_title(gerente))
          .set({"projetos_gerente": FieldValue.arrayRemove([nome])},
              SetOptions(merge: true))
          .then((value) => print("Membro $gerente atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
    await _projetos
        .doc(document_title(nome))
        .delete()
        .then((value) => print("$nome removido com sucesso"))
        .catchError((error) => print("Fail: $error"));
  }

  projetosFromJson(Map<String, dynamic> data) {
    this.descricao = data['descricao'] ?? "";
    this.gerente_nome = List.from(data['gerente_nome'] ?? []);
    this.gerente_nome_abreviado =
        List.from(data['gerente_nome_abreviado'] ?? []);
    this.gerente_nome_curto = List.from(data['gerente_nome_curto'] ?? []);
    this.membros_nomes = List.from(data['membros_nomes'] ?? []);
    this.membros_nomes_abreviados =
        List.from(data['membros_nomes_abreviados'] ?? []);
    this.membros_nomes_curtos = List.from(data['membros_nomes_curtos'] ?? []);
  }

  void printa_tudo() {
    print(nome);
    print(descricao);
    print(membros_nomes);
    print(membros_nomes_abreviados);
    print(membros_nomes_curtos);
    print(gerente_nome);
    print(gerente_nome_abreviado);
    print(gerente_nome_curto);
  }

  Future<void> read() async {
    String doc_title = document_title(nome);

    await _projetos
        .doc(doc_title)
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            projetosFromJson(snapshot.data() as Map<String, dynamic>);
            in_db = true;
          } else {
            print("Non Ecziste");
          }
        })
        .then((value) => print("Projeto $nome lido"))
        .catchError((error) => print("Falha $error"));
  }

  /*
  Future<void> read_from_login(String name_key) async {
    await _mainCollection
        .doc(name_key)
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            dadosUsuarioFromJson(snapshot.data() as Map<String, dynamic>);
            in_db = true;
          } else {
            print("Non Ecziste");
          }
        })
        .then((value) => print("$nome lido"))
        .catchError((error) => print("Falha $error"));
  }

  dadosUsuarioFromJson(Map<String, dynamic> data) {
    this.nome = data['nome'];
    this.nomeCurto = data['nome_curto'];
  }
  */
}
