
String ano_formatter(Map<String, dynamic> data) {
  String? ano = data['ano'];
  if (ano != null && ano!="" && ano!=" ") {
    ano = ano + "\u00B0 ano";
  } else {
    ano = "";
  }
  return ano;
}
