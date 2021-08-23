import 'package:organizapet/modules/useful_functions/first_and_last_name.dart';

String nome_abreviado(String nome, String nomeCurto) {
  String nome_curto = first_and_last_name_from_string(nome, nomeCurto);
  List name_list = nome_curto.split(" ");
  String nome_abreviado = name_list[0] + " " + name_list[0][0];
  return nome_abreviado;
}
