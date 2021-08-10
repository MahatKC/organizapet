import 'package:organizapet/modules/authentication/user_data.dart';

class VisualizarDadosArguments {
  final String nome;
  final bool is_self;
  final UserData user;

  VisualizarDadosArguments(this.nome, this.is_self, this.user);
}