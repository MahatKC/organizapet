import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/appBar.dart';
import 'package:organizapet/shared/widgets/menuSanduiche.dart';

class ListaPetianos extends StatefulWidget {
  const ListaPetianos({Key? key}) : super(key: key);

  @override
  _ListaPetianosState createState() => _ListaPetianosState();
}

class _ListaPetianosState extends State<ListaPetianos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold());
    /*Scaffold(
        backgroundColor: AppColors.background,
        drawer: MenuSanduiche(),
        appBar: AppBar(
          title: BarraApp(),
        ),
        body: ListView(children: [
          Center(
              heightFactor: 3,
              child: Text("Petianos",
                  style: TextStyle(fontSize: 27, shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                    )
                  ]))),
        ]));*/
  }
}
