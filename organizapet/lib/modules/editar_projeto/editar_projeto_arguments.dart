import 'package:organizapet/modules/current_user_data/current_user_data.dart';

class EditarProjetoArguments {
  final String nome;
  final String? descricao;
  final CurrentUserData user;

  EditarProjetoArguments(
      {required this.nome, required this.user, this.descricao});
}
