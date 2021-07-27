import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final bool isTutor;
  final String name;
  final List<String> gerenciaProjetos;

  UserData(
      {required this.isTutor,
      required this.name,
      required this.gerenciaProjetos});
}
