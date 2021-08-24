import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/nome_abreviado.dart';
import '../useful_functions/database_document_title.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('petianos');

class dadosProjeto {
  String nome;
  String? nomeCurto;
  String? rg;
  String? cpf;
  String? ra;
  String? telefone;
  String? email;
  String? dataNascimento;
  String? ano;
  String? temaICV;
  String? orientador;
  String? camiseta;
  String? github;
  String? instagram;
  bool? in_db;

  dadosProjeto(
      {required this.nome,
      this.nomeCurto,
      this.rg,
      this.cpf,
      this.ra,
      this.telefone,
      this.email,
      this.dataNascimento,
      this.ano,
      this.temaICV,
      this.orientador,
      this.camiseta,
      this.github,
      this.instagram,
      this.in_db});

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

  dadosPetianoFromJson(Map<String, dynamic> data) {
    this.nomeCurto = data['nome_curto'];
    this.rg = data['rg'];
    this.cpf = data['cpf'];
    this.ra = data['ra'];
    this.telefone = data['telefone'];
    this.email = data['email'];
    this.dataNascimento = data['dataNascimento'];
    this.ano = data['ano'];
    this.temaICV = data['temaICV'];
    this.orientador = data['orientador'];
    this.camiseta = data['camiseta'];
    this.github = data['github'];
    this.instagram = data['instagram'];
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

  Future<void> read() async {
    await _mainCollection
        .doc(document_title(nome))
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            dadosPetianoFromJson(snapshot.data() as Map<String, dynamic>);
            in_db = true;
          } else {
            print("Non Ecziste");
          }
        })
        .then((value) => print("$nome lido"))
        .catchError((error) => print("Falha $error"));
  }

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
}
