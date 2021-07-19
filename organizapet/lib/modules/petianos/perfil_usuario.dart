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
          body: Text("jeeje"),
        )
    );
  }
}
