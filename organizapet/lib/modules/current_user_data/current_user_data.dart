import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserData {
  bool isTutor = false;
  String nomeCurto = "";
  String name = "";
  List<String> gerenciaProjetos = [];

  late SharedPreferences prefs;

  Future<void> _get_prefs_from_file() async {
    prefs = await SharedPreferences.getInstance();
    isTutor = prefs.getBool('isTutor') ?? false;
    name = prefs.getString('name') ?? "";
    nomeCurto = prefs.getString('nomeCurto') ?? "";
    gerenciaProjetos = prefs.getStringList('gerenciaProjetos') ?? [];
  }

  Future<void> set_prefs(
      {bool? new_isTutor,
      String? new_name,
      String? new_nomeCurto,
      List<String>? new_gerenciaProjetos}) async {
    await _get_prefs_from_file();

    prefs.setBool('isTutor', new_isTutor ?? isTutor);
    prefs.setString('name', new_name ?? name);
    prefs.setString('nomeCurto', new_nomeCurto ?? nomeCurto);
    prefs.setStringList(
        'gerenciaProjetos', new_gerenciaProjetos ?? gerenciaProjetos);
  }

  Future<void> set_perfil(String perfil) async {
    if (perfil == 'tutor') {
      await set_prefs(
          new_isTutor: true,
          new_name: "Marcio Seiji Oyamada",
          new_nomeCurto: "Marcio Oyamada");
    } else if (perfil == 'gerente') {
      await set_prefs(
          new_isTutor: false,
          new_name: "Leonardo Vanzin",
          new_nomeCurto: "Leonardo Vanzin"); //TO-DO: Inicializar projetos
    } else if (perfil == 'clear') {
      await set_prefs(
          new_isTutor: false,
          new_name: "",
          new_nomeCurto: ""); //TO-DO: Inicializar projetos
    } else {
      await set_prefs(
          new_isTutor: false,
          new_name: "Mateus Karvat Camara",
          new_nomeCurto: "Mateus Karvat",
          new_gerenciaProjetos: []);
    }
  }

  Future<void> print_shared_prefs() async {
    await _get_prefs_from_file();
    print(isTutor);
    print(name);
    print(nomeCurto);
    print(gerenciaProjetos);
  }

  void clear() {
    set_prefs(
        new_name: "",
        new_nomeCurto: "",
        new_isTutor: false,
        new_gerenciaProjetos: []);
  }
}
