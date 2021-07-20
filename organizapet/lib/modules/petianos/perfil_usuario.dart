import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/appBar.dart';
import 'package:organizapet/shared/widgets/menuSanduiche.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: AppColors.background,
      drawer: MenuSanduiche(),
      appBar: AppBar(
        title: BarraApp(),
      ),
      body: //Column(
         
        //children:[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text("Dados do Petiano", style: TextStyle(
              fontSize: 27,
              shadows:[
                Shadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 4),
                  )
                ] 
              )
            )
          )
         // Center(child: Text("Dados do Petiano")),
          //Padding(
           // padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
           // child: TextField(
           // decoration: InputDecoration(hintText: ' Nome'),
       // ]
        //  ),
        ),
      );
    
  }
}
