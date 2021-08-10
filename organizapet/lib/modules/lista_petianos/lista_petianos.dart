import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/modules/useful_functions/ano_formatter.dart';
import 'package:organizapet/modules/useful_functions/first_and_last_name.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/box_list/box_list.dart';
import 'package:organizapet/shared/widgets/button_picker/button_picker.dart';
import 'package:organizapet/shared/widgets/menu/menu_sanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';

class ListaPetianos extends StatefulWidget {
  final UserData user;
  const ListaPetianos({Key? key, required this.user}) : super(key: key);

  @override
  _ListaPetianosState createState() => _ListaPetianosState();
}

class _ListaPetianosState extends State<ListaPetianos> {
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
        body: ListView(children: [
          PageTitle(title: "Petianos"),
          StreamBuilder<QuerySnapshot>(
            stream: _petianosStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Erro ao acessar o banco.');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return new BoxList(
                      titulo: first_and_last_name(data),
                      subtitulo: ano_formatter(data),
                      callback: () {
                        bool is_self = (data['nome'] == widget.user.name);
                        go_to_petiano(
                            context, data['nome'], is_self, widget.user);
                      });
                }).toList(),
              );
            },
          ),
          enableButton(widget.user),
        ]));
  }
}

void go_to_petiano(
    BuildContext context, String nome, bool is_self, UserData user) {
  Navigator.pushNamed(context, "/visualizar_dados_petiano",
      arguments: VisualizarDadosArguments(nome, is_self, user));
}

Widget enableButton(UserData user){
      if(user.isTutor == true){
       return ButtonPicker(isDouble: false, tipoBotao1: 'add');
      }else {
        return Container();
      }
  }