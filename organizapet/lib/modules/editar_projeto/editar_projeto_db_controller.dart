import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/nome_abreviado.dart';
import '../useful_functions/database_document_title.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _projetos = _firestore.collection('projetos');

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

  /*
  dadosPetianoFromLista(List lista) {
    this.nomeCurto = lista.elementAt(1);
    this.rg = lista.elementAt(2);
    this.cpf = lista.elementAt(3);
    this.ra = lista.elementAt(4);
    this.telefone = lista.elementAt(5);
    this.email = lista.elementAt(6);
    this.dataNascimento = lista.elementAt(7);
    this.ano = lista.elementAt(8);
    this.temaICV = lista.elementAt(9);
    this.orientador = lista.elementAt(10);
    this.camiseta = lista.elementAt(11);
    this.github = lista.elementAt(12);
    this.instagram = lista.elementAt(13);
  }

  Future<void> write() async {
    await _mainCollection
        .doc(document_title(nome))
        .set({
          'nome': nome,
          'nome_curto': nomeCurto,
          'nome_abreviado': nome_abreviado(nome, nomeCurto ?? ""),
          'rg': rg,
          'cpf': cpf,
          'ra': ra,
          'telefone': telefone,
          'email': email,
          'dataNascimento': dataNascimento,
          'ano': ano,
          'temaICV': temaICV,
          'orientador': orientador,
          'camiseta': camiseta,
          'github': github,
          'instagram': instagram
        }, SetOptions(merge: true))
        .then((value) => print("$nome atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));
    if (email != null) {
      await _firestore
          .collection('users')
          .doc(document_title(email!))
          .set({'email': email}, SetOptions(merge: true))
          .then((value) => print("Usuário $email atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    }
  }

  Future<void> delete() async {
    await read();
    _mainCollection
        .doc(document_title(nome))
        .delete()
        .then((value) => print("$nome removido com sucesso"))
        .catchError((error) => print("Fail: $error"));
    if (email != null) {
      _firestore
          .collection('users')
          .doc(document_title(email!))
          .delete()
          .then((value) => print("Usuário $email removido com sucesso"))
          .catchError((error) => print("Fail: $error"));
    }
  }
  */

  projetosFromJson(Map<String, dynamic> data) {
    this.descricao = data['descricao'];
    this.gerente_nome = List.from(data['gerente_nome']);
    this.gerente_nome_abreviado = List.from(data['gerente_nome_abreviado']);
    this.gerente_nome_curto = List.from(data['gerente_nome_curto']);
    this.membros_nomes = List.from(data['membros_nomes']);
    this.membros_nomes_abreviados = List.from(data['membros_nomes_abreviados']);
    this.membros_nomes_curtos = List.from(data['membros_nomes_curtos']);
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

    printa_tudo();
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
