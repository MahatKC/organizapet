import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petiano_arguments.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/lista_petianos/lista_petianos.dart';
import 'package:organizapet/modules/menu/menu_sanduiche.dart';
import 'package:organizapet/modules/useful_functions/back_to_previous.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/box_info/box_info.dart';
import 'package:organizapet/shared/widgets/button_picker/button_picker.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';

class VisualizarDadosPetiano extends StatefulWidget {
  final VisualizarDadosArguments dados;

  const VisualizarDadosPetiano({required this.dados, Key? key})
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
    return WillPopScope(
      onWillPop: () {
        return back_to_previous(context);
      },
      child: Scaffold(
          backgroundColor: AppColors.background,
          drawer: MenuSanduiche(user: widget.dados.user),
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
                    enableButton(context),
                  ]);
                }
              })),
    );
  }

  Widget enableButton(BuildContext context) {
    if (widget.dados.user.isTutor == true) {
      return ButtonPicker(
        isDouble: true,
        tipoBotao1: 'bla',
        tipoBotao2: 'edit',
        callback1: delete_button,
        callback2: edit_button,
      );
    } else if (widget.dados.is_self == true) {
      return ButtonPicker(
          isDouble: false, tipoBotao1: 'edit', callback1: edit_button);
    } else {
      return Container();
    }
  }

  Future<dadosPetiano> read_db() async {
    var dbController = dadosPetiano(nome: widget.dados.nome);
    if (access_db == true && widget.dados.nome.isNotEmpty) {
      await dbController.read();
    }
    return dbController;
  }

  void eliminado() {
    String nome = controller.nomeController.text;
    if (nome.isNotEmpty) {
      final dbController = dadosPetiano(nome: nome);
      dbController.delete();
      Navigator.pop(context, 'sim');

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => PopupUmaOpcao(
          title: "Sucesso",
          message: "Petiano removido do OrganizaPET!",
          after_func: delete_concluded,
        ),
      );
    }
  }

  void delete_concluded() {
    Navigator.popUntil(context, ModalRoute.withName('/lista_petianos'));
  }

  void delete_button() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupDuasOpcoes(
          title: "Atenção",
          message: "Deseja sair do OrganizaPET?",
          yes_callback: eliminado),
    );
  }

  void edit_button() {
    Navigator.pushNamed(context, "/dados_petiano",
        arguments: PetianoArguments(nome: widget.dados.nome, user: widget.dados.user));
  }
}
