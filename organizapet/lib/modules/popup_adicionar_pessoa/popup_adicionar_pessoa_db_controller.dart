import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/database_document_title.dart';
import 'package:organizapet/modules/useful_functions/first_and_last_name.dart';

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
            gerentes = gerentesFromJson(snapshot.data() as Map<String, dynamic>);
          } else {
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

  Future<List<String>> readAll() async {
    List<String> membros = [];

    await _petianos.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        membros.add(first_and_last_name_from_string(doc["nome"], doc["nome_curto"]));
      });
    });

    return membros;
  }
}
