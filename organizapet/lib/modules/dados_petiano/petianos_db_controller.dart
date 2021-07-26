import 'package:cloud_firestore/cloud_firestore.dart';
import '../useful_functions/document_title.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('petianos');

class dadosPetiano {
  String nome;
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
  final dadosPetianoRef = _mainCollection.withConverter<dadosPetiano>(
    fromFirestore: (snapshot, _) => dadosPetiano.fromJson(snapshot.data()!),
    toFirestore: (petiano, _) => petiano.toJson(),
  );

  dadosPetiano(
      {required this.nome,
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
    this.rg = lista.elementAt(1);
    this.cpf = lista.elementAt(2);
    this.ra = lista.elementAt(3);
    this.telefone = lista.elementAt(4);
    this.email = lista.elementAt(5);
    this.dataNascimento = lista.elementAt(6);
    this.ano = lista.elementAt(7);
    this.temaICV = lista.elementAt(8);
    this.orientador = lista.elementAt(9);
    this.camiseta = lista.elementAt(10);
    this.github = lista.elementAt(11);
    this.instagram = lista.elementAt(12);
  }

  dadosPetianoFromJson(Map<String, dynamic> data) {
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

  dadosPetiano.fromJson(Map<String, Object?> json)
      : this(
            nome: json['nome']! as String,
            rg: json['rg'] as String,
            cpf: json['cpf'] as String,
            ra: json['ra'] as String,
            telefone: json['telefone'] as String,
            email: json['email'] as String,
            dataNascimento: json['dataNascimento'] as String,
            ano: json['ano'] as String,
            temaICV: json['temaICV'] as String,
            orientador: json['orientador'] as String,
            camiseta: json['camiseta'] as String,
            github: json['github'] as String,
            instagram: json['instagram'] as String);

  Map<String, Object?> toJson() {
    return {
      'nome': nome,
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
    };
  }

  Future<void> write() async {
    await _mainCollection
        .doc(document_title(nome))
        .set({
          'nome': nome,
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
  }

  Future<void> delete() async {
    _mainCollection
        .doc(document_title(nome))
        .delete()
        .then((value) => print("$nome removido com sucesso"))
        .catchError((error) => print("Fail: $error"));
  }

  Future<void> read() async {
    _mainCollection.doc(document_title(nome)).get().then((snapshot) {
      if (snapshot.exists) {
        dadosPetianoFromJson(snapshot.data() as Map<String, dynamic>);
        in_db = true;
      } else {
        print("Non Ecziste");
      }
    }).catchError((error) => print("Falha"));
  }
}
