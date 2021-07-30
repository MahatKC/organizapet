String first_and_last_name(Map<String, dynamic> data) {
  List name_list = data['nome'].split(" ");
  String first_and_last = name_list[0] +" "+ name_list.last;
  return first_and_last;
}
