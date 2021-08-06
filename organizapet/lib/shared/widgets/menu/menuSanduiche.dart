import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class MenuSanduiche extends StatelessWidget {
  const MenuSanduiche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
           height: 70,
            decoration: BoxDecoration(color: AppColors.button, border: Border.all(color: AppColors.barraMenu, width: 10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Text("Roberta Alcantara", style: TextStyles.userMenu,),
            )
          ),
          ListTile(
            //leading: Image.asset(AppImages.projeto),
            title: Text('Meus projetos'),
            tileColor: AppColors.barraMenu,
            onTap: () {},
          ),
          ListTile(
            tileColor: AppColors.barraMenu,
            //leading: Image.asset(AppImages.membros),
            title: Text('Membros'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
