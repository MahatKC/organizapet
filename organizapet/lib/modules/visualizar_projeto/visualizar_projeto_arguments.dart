import 'package:organizapet/modules/current_user_data/current_user_data.dart';

class VisualizarProjetosArguments {
  final String nome;
  final bool is_gerente;
  final CurrentUserData user;

  VisualizarProjetosArguments(this.nome, this.is_gerente, this.user);
}