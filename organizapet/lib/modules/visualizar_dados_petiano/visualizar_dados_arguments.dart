import 'package:organizapet/modules/current_user_data/current_user_data.dart';

class VisualizarDadosArguments {
  final String nome;
  final bool is_self;
  final CurrentUserData user;

  VisualizarDadosArguments(this.nome, this.is_self, this.user);
}
