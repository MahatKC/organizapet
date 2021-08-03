import 'package:flutter/cupertino.dart';

Future<bool> back_to_previous(BuildContext context) {
  Navigator.pop(context);
  return Future.value(true);
}
