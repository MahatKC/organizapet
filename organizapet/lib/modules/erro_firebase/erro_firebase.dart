import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class ErroFirebase extends StatelessWidget {
  const ErroFirebase({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          height: 170,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.warning, size: 110, color: Colors.yellow,),
              Text("Erro ao acessar\n o banco de dados!", style: TextStyles.deuRuim, textAlign: TextAlign.center,),
            ],
          ),
          
        ),
      ),
    );
  }
}