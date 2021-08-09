import 'package:flutter/material.dart';

class ErrorFirebaseMessage extends StatelessWidget {
  const ErrorFirebaseMessage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AlertDialog(
          title: Text("Deu ruim"),
          content: Text("Não foi possivel acessar o firebase, porfavor reinicio o app!"),
          actions: <Widget[
            TextButton(onPressed: (){}, child: Text("OK"));
          ],
      ),
    );
  }

 
}