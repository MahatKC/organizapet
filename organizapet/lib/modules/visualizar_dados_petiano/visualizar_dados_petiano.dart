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
                imagem: AppImages.usuario,
                texto: "Mateus Edival Rodrigues da Silveira",
              ),
              BoxInfo(
                imagem: AppImages.cpf,
                texto: "100.111.234-56",
              ),
              BoxInfo(
                imagem: AppImages.rg,
                texto: "10.111.234-5",
              ),
              BoxInfo(
                imagem: AppImages.unioeste,
                texto: "45678",
              ),
              BoxInfo(
                imagem: AppImages.telefone,
                texto: "45 99999-3456",
              ),
              BoxInfo(
                imagem: AppImages.email,
                texto: "mateusedival@gmail.com",
              ),
              BoxInfo(
                imagem: AppImages.dataNascimento,
                texto: "23/02/1999",
              ),
              BoxInfo(
                imagem: AppImages.ano,
                texto: "4°",
              ),
              BoxInfo(
                imagem: AppImages.icv,
                texto: "AM",
              ),
              BoxInfo(
                imagem: AppImages.orientador,
                texto: "André Brun",
              ),
              BoxInfo(
                imagem: AppImages.camiseta,
                texto: "G",
              ),
              BoxInfo(
                imagem: AppImages.github,
                texto: "mateusedival",
              ),
              BoxInfo(
                imagem: AppImages.insta,
                texto: "mateusedival",
              ),
            ])));
  }
}
