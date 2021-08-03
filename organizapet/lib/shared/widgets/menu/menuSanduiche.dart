import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_images.dart';

class MenuSanduiche extends StatelessWidget {
  const MenuSanduiche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Image.asset(AppImages.projeto),
            title: Text('Meus projetos'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.membros),
            title: Text('Membros'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
