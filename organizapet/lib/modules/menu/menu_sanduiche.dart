import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/modules/dados_petiano/petiano_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';

class MenuSanduiche extends StatelessWidget {
  final UserData user;

  const MenuSanduiche({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                    height: 160,
                    decoration: BoxDecoration(
                        color: AppColors.boxListBorder,
                        boxShadow: [
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
                  onTap: () {
                    go_to_lista_petianos(context, user);
                  },
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
                  onTap: () {
                    go_to_dados_petiano(context, user);
                  },
                ),
                Container(
                  height: 	MediaQuery.of(context).size.height * 0.306,
                  decoration: BoxDecoration(
                    color: AppColors.barraMenu,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
            height: 1,
          ),
          ListTile(
            tileColor: AppColors.barraMenu,
            trailing: Image.asset(AppImages.sair),
            selectedTileColor: AppColors.boxListBorder,
            title: Text(
              user.nomeCurto,
              style: TextStyles.textItemMenu,
            ),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => PopupDuasOpcoes(
                    title: "Atenção",
                    message: "Deseja sair do OrganizaPET?",
                    yes_callback: logout_function),
              );
            },
          ),
        ],
      ),
    );
  }

  void logout_function() {
    //TO-DO
    print("SAI DAI VEI");
  }

  Future<void> go_to_lista_petianos(BuildContext context, UserData user) async {
    Navigator.pushReplacementNamed(context, "/lista_petianos", arguments: user);
  }

  Future<void> go_to_dados_petiano(BuildContext context, UserData user) async {
    print("go_to_dados");
    print(user.name);
    print("-----");
    Navigator.pushReplacementNamed(context, "/dados_petiano",
        arguments: PetianoArguments(nome: user.name, user: user));
  }
}
