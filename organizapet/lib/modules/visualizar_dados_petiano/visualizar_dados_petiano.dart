import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/box_info/box_info.dart';
import 'package:organizapet/shared/widgets/menu/menuSanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';

class VisualizarDadosPetiano extends StatefulWidget {
  final String nome;

  const VisualizarDadosPetiano({required this.nome, Key? key})
      : super(key: key);

  @override
  _VisualizarDadosPetianoState createState() => _VisualizarDadosPetianoState();
}

class _VisualizarDadosPetianoState extends State<VisualizarDadosPetiano> {
  final controller = petianosController();
  bool access_db = true;
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = read_db();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        drawer: MenuSanduiche(),
        appBar: AppBar(
          title: BarraApp(),
        ),
        body: FutureBuilder(
            future: start,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                final dbController = snapshot.data as dadosPetiano;
                controller.instantiateAll(dbController);
                return ListView(children: [
                  PageTitle(title: "Dados do Petiano"),
                  BoxInfo(
                    imagem: AppImages.usuario,
                    texto: controller.nomeController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.rg,
                    texto: controller.rgController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.cpf,
                    texto: controller.cpfController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.unioeste,
                    texto: controller.raController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.telefone,
                    texto: controller.telefoneController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.email,
                    texto: controller.emailController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.dataNascimento,
                    texto: controller.dataNascimentoController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.ano,
                    texto: controller.anoController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.icv,
                    texto: controller.temaICVController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.orientador,
                    texto: controller.orientadorController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.camiseta,
                    texto: controller.camisetaController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.github,
                    texto: controller.githubController.text,
                  ),
                  BoxInfo(
                    imagem: AppImages.insta,
                    texto: controller.instagramController.text,
                  ),
                ]);
              }
            }));
  }

  Future<dadosPetiano> read_db() async {
    var dbController = dadosPetiano(nome: widget.nome);
    if (access_db == true && widget.nome.isNotEmpty) {
      await dbController.read();
    }
    return dbController;
  }
}
