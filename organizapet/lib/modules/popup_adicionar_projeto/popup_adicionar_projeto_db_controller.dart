import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizapet/modules/useful_functions/database_document_title.dart';
import 'package:organizapet/modules/useful_functions/nome_abreviado.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _projetos = _firestore.collection('projetos');
final CollectionReference _petianos = _firestore.collection('petianos');

class popupAdicionarProjetoDBController {
  Future<List<String>> readAll() async {
    List<String> projetos_nome = [];

    await _projetos.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        projetos_nome.add(doc["nome"]);
      });
    });

    return projetos_nome;
  }

  Future<String> read_nome_curto(String nome) async {
    late String nome_curto;
    
    await _petianos
        .doc(document_title(nome))
        .get()
        .then((snapshot) {
          if (snapshot.exists) {
            nome_curto =
                nomeCurtoFromJson(snapshot.data() as Map<String, dynamic>);
          } else {
            nome_curto = "";
            print("Non Ecziste");
          }
        })
        .then((value) => print("Projetos membro $nome lido"))
        .catchError((error) => print("Falha $error"));

    return nome_curto;
  }

  String nomeCurtoFromJson(Map<String, dynamic> data) {
    return data['nome_curto'];
  }

  Future<void> write_projeto(List<String> nomes_projetos, String nome_membro,
      String nome_curto) async {
    await _projetos
        .doc(document_title(nome_membro))
        .set({
          "projetos_membro": FieldValue.arrayUnion(nomes_projetos),
        }, SetOptions(merge: true))
        .then((value) => print("$nome_membro atualizado com sucesso"))
        .catchError((error) => print("Fail: $error"));

    nomes_projetos.forEach((projeto) async {
      await _petianos
          .doc(document_title(projeto))
          .set({
            "membros_nomes": FieldValue.arrayUnion([nome_membro]),
            "membros_nomes_curtos": FieldValue.arrayUnion([nome_curto]),
            "membros_nomes_abreviados":
                FieldValue.arrayUnion([nome_abreviado(nome_membro, nome_curto)])
          }, SetOptions(merge: true))
          .then((value) => print("Projeto $projeto atualizado com sucesso"))
          .catchError((error) => print("Fail: $error"));
    });
  }
}
