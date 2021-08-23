import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/modules/current_user_data/current_user_data.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/menu/menu_sanduiche.dart';
import 'package:organizapet/modules/useful_functions/ano_formatter.dart';
import 'package:organizapet/modules/useful_functions/first_and_last_name.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/responsive_list/responsive_list.dart';
import 'package:organizapet/shared/widgets/title_subtitle_box/title_subtitle_box.dart';
import 'package:organizapet/shared/widgets/single_double_button_selector/single_double_button_selector.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';

class ListaProjetos extends StatefulWidget {
  final CurrentUserData user;
  const ListaProjetos({Key? key, required this.user}) : super(key: key);

  @override
  _ListaProjetosState createState() => _ListaProjetosState();
}

class _ListaProjetosState extends State<ListaProjetos> {
  final Stream<QuerySnapshot> _petianosStream =
      FirebaseFirestore.instance.collection('petianos').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        drawer: MenuSanduiche(user: widget.user),
        appBar: AppBar(
          title: BarraApp(),
        ),
        body: ResponsiveList(list: ListView(children: [
                      PageTitle(title: "Projetos"),
                      StreamBuilder<QuerySnapshot>(
                        stream: _petianosStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Erro ao acessar o banco.');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return new ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return new TitleSubtitleBox(
                                  titulo: first_and_last_name(data),
                                  subtitulo: ano_formatter(data),
                                  callback: () {
                                    bool is_self =
                                        (data['nome'] == widget.user.name);
                                    go_to_petiano(context, data['nome'],
                                        is_self, widget.user);
                                  });
                            }).toList(),
                          );
                        },
                      ),
                      enableButton(widget.user),
                    ])));
  }

  void go_to_petiano(
      BuildContext context, String nome, bool is_self, CurrentUserData user) {
    Navigator.pushNamed(context, "/visualizar_dados_petiano",
        arguments: VisualizarDadosArguments(nome, is_self, user));
  }

  Widget enableButton(CurrentUserData user) {
    if (user.isTutor == true) {
      return SingleDoubleButtonSelector(
        isDouble: false,
        tipoBotao1: 'add',
        callback1: add_buton,
      );
    } else {
      return Container();
    }
  }

  void add_buton() {
    Navigator.pushNamed(context, "/editar_petiano",
        arguments: EditarPetianoArguments(nome: "", user: widget.user));
  }
}
