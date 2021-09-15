import 'package:organizapet/modules/popup_adicionar_projeto/popup_adicionar_projeto_db_controller.dart';

class popupAdicionarProjetoController {
  late List<String> projetos;
  late List<bool> projetos_selecionados;
  late String nome_curto;
  final db = popupAdicionarProjetoDBController();

  popupAdicionarProjetoController();

  Future<void> populateController(String nome_membro) async {
    projetos = await db.readAll();
    nome_curto = await db.read_nome_curto(nome_membro);
    for (int i = 0; i < projetos.length; i++) {
      projetos_selecionados.add(false);
    }
  }

  Future<void> write_projeto(List<int> indices, String nome_membro) async {
    List<String> add_projeto = [];

    for (int i = 0; i < indices.length; i++) {
      int idx = indices[i];
      add_projeto.add(projetos[idx]);
    }

    await db.write_projeto(add_projeto, nome_membro, nome_curto);
  }
}
