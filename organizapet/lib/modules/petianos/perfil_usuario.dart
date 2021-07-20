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
      body: Column(
        children:[
          Center(
            heightFactor: 3,
            child: 
             Text("Dados do Petiano", style: TextStyle(
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
          ),
            TextField(
              decoration: InputDecoration(hintText: " Nome"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " RG"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " CPF"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " RA"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " Telefone"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " E-mail"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " Data de nascimento"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " Ano"),
            ),
            TextField(
              decoration: InputDecoration(hintText: " Tema ICV"),
            ),
          //  TextField(
           //   decoration: InputDecoration(hintText: " Orientador"),
          //  ),
           // TextField(
           //   decoration: InputDecoration(hintText: " Camiseta"),
            //),
            //TextField(
             // decoration: InputDecoration(hintText: " Github"),
           // ),
            //TextField(
            //  decoration: InputDecoration(hintText: " Instagram"),
            //),

          ]
          )
        ),
      );
    
  }
}
