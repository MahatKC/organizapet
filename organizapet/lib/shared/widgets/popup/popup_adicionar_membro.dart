import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class PopupAdicionarMembro extends StatelessWidget {
  const PopupAdicionarMembro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Adicionar Membros",
                    style: TextStyles.darkBlue,
                  ),
                ),
                CheckboxListTile(
                  value: false,
                  title: Text("user1"),
                  onChanged: (value) {
                    true;
                  },
                ),
                CheckboxListTile(
                  value: false,
                  title: Text("user2"),
                  onChanged: (value) {
                    /*setState(() {
                      user2 = value;
                    });*/
                  },
                ),
                CheckboxListTile(
                  value: true,
                  title: Text("user3"),
                  onChanged: (value) {
                    /*setState(() {
                      user3 = value;
                    });*/
                  },
                ),
                CheckboxListTile(
                  value: true,
                  title: Text("user4"),
                  onChanged: (value) {
                    /* setState(() {
                              user4=value;
                            });*/
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      elevation: 5.0,
                      color: Colors.blue,
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        onPressed: () {},
                        child: Text("Save",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      color: Colors.blue,
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        onPressed: () {
                          /*setState(() {
                                    Navigator.of(context).pop();
                                  });*/
                        },
                        child: Text("Cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
