import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_db_controller.dart';

class popupAdicionarPessoaController {
  late List<String> petianos_names;
  late List<bool> petianos;
  final db = popupAdicionarPessoaDBController();

  popupAdicionarPessoaController();

  Future<void> populateController(
      bool is_popup_gerentes, String nome_projeto) async {
    List<String> names;
    petianos_names = await db.readAll();
    if (is_popup_gerentes) {
      names = await db.readGerentes(nome_projeto);
      petianos = getBoolList(names, petianos_names);
    } else {
      names = await db.readMembros(nome_projeto);
      petianos = getBoolList(names, petianos_names);
    }
  }

  List<bool> getBoolList(List<String> names, List<String> all) {
    List<bool> checks = [];
    for (int i = 0; i < all.length; i++) {
      if (names.contains(all[i])) {
        checks.add(true);
      } else {
        checks.add(false);
      }
    }
    return checks;
  }
}
