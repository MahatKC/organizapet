import 'package:organizapet/modules/current_user_data/current_user_data.dart';

String first_and_last_name(Map<String, dynamic> data) {
  if (data['nome_curto'] != null &&
      data['nome_curto'] != "" &&
      data['nome_curto'] != " ") {
    return data['nome_curto'];
  } else {
    List name_list = data['nome'].split(" ");
    String first_and_last = name_list[0] + " " + name_list.last;
    return first_and_last;
  }
}

String first_and_last_name_from_string(String nome, String nomeCurto) {
  if (nomeCurto != "" && nomeCurto != " ") {
    return nomeCurto;
  } else {
    List name_list = nome.split(" ");
    String first_and_last = name_list[0] + " " + name_list.last;
    return first_and_last;
  }
}

String first_and_last_name_from_user(CurrentUserData user) {
  if (user.nomeCurto != "" && user.nomeCurto != " ") {
    return user.nomeCurto;
  } else {
    List name_list = user.name.split(" ");
    String first_and_last = name_list[0] + " " + name_list.last;
    return first_and_last;
  }
}
