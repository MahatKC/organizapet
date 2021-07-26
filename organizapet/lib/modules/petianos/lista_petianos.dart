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
        home: Scaffold(
            backgroundColor: AppColors.background,
            drawer: MenuSanduiche(),
            appBar: AppBar(
              title: BarraApp(),
            ),
            body: ListView(children: [
              Center(
                  heightFactor: 4,
                  child: Text("Petianos",
                      style: TextStyle(fontSize: 27, shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                        )
                      ]))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Text("It's text..."),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: AppColors.boxList,
                        border: Border.all(color: AppColors.boxListBorder),
                      ),
                      height: 46,
                    )
                  ],
                ),
              )
            ])));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red, //                   <--- border color
        width: 5.0,
      ),
    );
  }
}
