String first_and_last_name(Map<String, dynamic> data) {
  List name_list = data['nome'].split(" ");
  String first_and_last = name_list[0] + " " + name_list.last;
  if (data['nome_curto'] != null &&
      data['nome_curto'] != "" &&
      data['nome_curto'] != " ") {
    return data['nome_curto'];
  } else {
    return first_and_last;
  }
}
