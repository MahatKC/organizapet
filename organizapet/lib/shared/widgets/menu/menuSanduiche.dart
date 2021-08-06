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
              height: 160,
              decoration:
                  BoxDecoration(color: AppColors.boxListBorder, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: AppColors.nameApp.withOpacity(0.25),
                    offset: Offset(4, 4)),
              ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Column(
                  children: [
                    Image.asset(AppImages.logoMenor),
                    Text("OrganizaPET", style: TextStyles.nameAppMenu),
                  ],
                ),
              )),
          ListTile(
            tileColor: AppColors.barraMenu,
            leading: Image.asset(AppImages.cronograma),
            title: Text(
              'Cronograma',
              style: TextStyles.textItemMenu,
            ),
            selectedTileColor: AppColors.boxListBorder,
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.projeto),
            title: Text(
              'Meus projetos',
              style: TextStyles.textItemMenu,
            ),
            tileColor: AppColors.barraMenu,
            selectedTileColor: AppColors.boxListBorder,
            onTap: () {},
          ),
          ListTile(
            tileColor: AppColors.barraMenu,
            leading: Image.asset(AppImages.membros),
            title: Text(
              'Membros',
              style: TextStyles.textItemMenu,
            ),
            selectedTileColor: AppColors.boxListBorder,
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.projeto),
            title: Text(
              'Projetos',
              style: TextStyles.textItemMenu,
            ),
            tileColor: AppColors.barraMenu,
            selectedTileColor: AppColors.boxListBorder,
            onTap: () {},
          ),
          ListTile(
            tileColor: AppColors.barraMenu,
            leading: Image.asset(AppImages.usuarioBranco),
            title: Text(
              'Perfil',
              style: TextStyles.textItemMenu,
            ),
            selectedTileColor: AppColors.boxListBorder,
            onTap: () {},
          ),
          Container(
            height: 199,
            decoration: BoxDecoration(
                color: AppColors.barraMenu,
                border: Border(
                    bottom: BorderSide(color: Colors.white70, width: 1))),
          ),
          ListTile(
            tileColor: AppColors.barraMenu,
            trailing: Image.asset(AppImages.sair),
            selectedTileColor: AppColors.boxListBorder,
            title: Text(
              'Roberta Alcantara',
              style: TextStyles.textItemMenu,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
