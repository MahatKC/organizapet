String data_list_to_string(Map<String,dynamic> data, String key_access) {
  String transformed_list ="";
  if (data[key_access] == null) {
    transformed_list = "";
  } else {
    transformed_list = data[key_access].join(", ") ?? "";
  }
  return transformed_list;
}

List<String> string_to_list(List<String> lista, int position){
  List<String> transformed_list =[];
  if (lista[position] == null) {
    transformed_list = [];
  } else {
    transformed_list = lista[position].split(", ");
  }
  return transformed_list;
}