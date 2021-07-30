import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/box_info/box_info.dart';
import 'package:organizapet/shared/widgets/menu/menuSanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';

class VisualizarDadosPetiano extends StatefulWidget {
  const VisualizarDadosPetiano({Key? key}) : super(key: key);

  @override
  _VisualizarDadosPetianoState createState() => _VisualizarDadosPetianoState();
}

class _VisualizarDadosPetianoState extends State<VisualizarDadosPetiano> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: AppColors.background,
            drawer: MenuSanduiche(),
            appBar: AppBar(
              title: BarraApp(),
            ),
            body: ListView(children: [
              PageTitle(title: "Dados do Petiano"),
              BoxInfo(
                imagem: AppImages.google,
              ),
              Center(child: Image.asset(AppImages.usuario)),
            ])));
  }
}
