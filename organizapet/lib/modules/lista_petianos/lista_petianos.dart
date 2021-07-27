import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/box_list/box_list.dart';
import 'package:organizapet/shared/widgets/menu/menuSanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';

class ListaPetianos extends StatefulWidget {
  const ListaPetianos({Key? key}) : super(key: key);

  @override
  _ListaPetianosState createState() => _ListaPetianosState();
}

class _ListaPetianosState extends State<ListaPetianos> {
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
              Center(
                  heightFactor: 3,
                  child: PageTitle(title: "Petianos"),
                  ),
                  BoxList(titulo: "Davi Giacomel", subtitulo: "1 ano",),
            ])));
  }
}
