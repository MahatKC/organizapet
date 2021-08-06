import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  bool isTutor = false;
  String name = "";
  List<String> gerenciaProjetos = [];

  late SharedPreferences prefs;

  Future<void> _get_prefs_from_file() async {
    prefs = await SharedPreferences.getInstance();
    isTutor = prefs.getBool('isTutor') ?? false;
    name = prefs.getString('name') ?? "";
    gerenciaProjetos = prefs.getStringList('gerenciaProjetos') ?? [];
  }

  Future<void> set_prefs(
      {bool? new_isTutor,
      String? new_name,
      List<String>? new_gerenciaProjetos}) async {
    await _get_prefs_from_file();

    prefs.setBool('isTutor', new_isTutor ?? isTutor);
    prefs.setString('name', new_name ?? name);
    prefs.setStringList(
        'gerenciaProjetos', new_gerenciaProjetos ?? gerenciaProjetos);
  }

  UserData() {
    _get_prefs_from_file();
  }

  Future<void> set_perfil(String perfil) async {
    if (perfil == 'tutor') {
      await set_prefs(new_isTutor: true, new_name: "Marcio Seiji Oyamada");
    } else if (perfil == 'gerente') {
      await set_prefs(
          new_isTutor: false,
          new_name: "Leonardo Vanzin"); //TO-DO: Inicializar projetos
    } else {
      await set_prefs(
          new_isTutor: false,
          new_name: "Mateus Karvat Camara",
          new_gerenciaProjetos: []);
    }
  }

  Future<void> print_shared_prefs() async {
    await _get_prefs_from_file();
    print(isTutor);
    print(name);
    print(gerenciaProjetos);
  }

  Future<String> get_name() async {
    await _get_prefs_from_file();
    return name;
  }

  Future<bool> get_isTutor() async {
    await _get_prefs_from_file();
    return isTutor;
  }

  Future<List<String>> get_gerenciaProjetos() async {
    await _get_prefs_from_file();
    return gerenciaProjetos;
  }
}
