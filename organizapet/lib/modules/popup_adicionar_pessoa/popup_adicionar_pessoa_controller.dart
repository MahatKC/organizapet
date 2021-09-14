import 'package:organizapet/modules/popup_adicionar_pessoa/popup_adicionar_pessoa_db_controller.dart';
import 'package:organizapet/modules/useful_functions/nome_abreviado.dart';

class popupAdicionarPessoaController {
  late List<String> petianos_names;
  late List<String> petianos_names_full;
  late List<bool> petianos;
  late List<bool> petianos_old;
  final db = popupAdicionarPessoaDBController();

  popupAdicionarPessoaController();

  Future<void> populateController(
      bool is_popup_gerentes, String nome_projeto) async {
    List<String> names;
    List<List<String>> list = await db.readAll();
    petianos_names_full = list[0];
    petianos_names = list[1];
    if (is_popup_gerentes) {
      names = await db.readGerentes(nome_projeto);
      petianos = getBoolList(names, petianos_names);
      petianos_old = getBoolList(names, petianos_names);
    } else {
      names = await db.readMembros(nome_projeto);
      petianos = getBoolList(names, petianos_names);
      petianos_old = getBoolList(names, petianos_names);
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

  Future<void> write_membro(List<int> indices, String nome_projeto) async {
    await write_operation(indices, nome_projeto, "membro");
  }

  Future<void> write_gerente(List<int> indices, String nome_projeto) async {
    await write_operation(indices, nome_projeto, "gerente");
  }

  Future<void> write_operation(
      List<int> indices, String nome_projeto, String tipo) async {
    
    List<String> add_nome = [];
    List<String> add_nome_curto = [];
    List<String> add_nome_abrv = [];
    List<String> remove_nome = [];
    List<String> remove_nome_curto = [];
    List<String> remove_nome_abrv = [];

    for (int i = 0; i < indices.length; i++) {
      int idx = indices[i];
      String nome = petianos_names_full[idx];
      String nomeCurto = petianos_names[idx];
      if (petianos[idx]) {
        add_nome.add(nome);
        add_nome_curto.add(nomeCurto);
        add_nome_abrv.add(nome_abreviado(nome, nomeCurto));
      } else {
        remove_nome.add(nome);
        remove_nome_curto.add(nomeCurto);
        remove_nome_abrv.add(nome_abreviado(nome, nomeCurto));
      }
    }

    if (tipo == "gerente") {
      if (add_nome.length > 0) {
        await db.write_gerente(
            add_nome, add_nome_curto, add_nome_abrv, nome_projeto);
      }
      if (remove_nome.length > 0) {
        await db.remove_gerente(
            remove_nome, remove_nome_curto, remove_nome_abrv, nome_projeto);
      }
    } else if (tipo == "membro") {
      if (add_nome.length > 0) {
        await db.write_membro(
            add_nome, add_nome_curto, add_nome_abrv, nome_projeto);
      }
      if (remove_nome.length > 0) {
        await db.remove_membro(
            remove_nome, remove_nome_curto, remove_nome_abrv, nome_projeto);
      }
    }
  }
}
