import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/modules/dados_petiano/petiano_arguments.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';

class MenuSanduiche extends StatelessWidget {
  final UserData user;
  const MenuSanduiche({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void logout_function() async {
      if (!kIsWeb) {
        await GoogleSignIn().signOut();
      }
      FirebaseAuth auth = await FirebaseAuth.instance;
      await auth
          .signOut()
          .then((value) => print("LogOut bem sucedido."))
          .catchError((error) => print(error));
      UserData user = UserData();
      user.clear();
      Navigator.pushReplacementNamed(context, '/splash');
    }

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                    height: 182,
                    decoration: BoxDecoration(
                        color: AppColors.boxListBorder,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: AppColors.nameApp.withOpacity(0.25),
                              offset: Offset(4, 4)),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45, bottom: 20),
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
                  height: MediaQuery.of(context).size.height * 0.8,
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
                      yes_callback: logout_function));
            },
          ),
        ],
      ),
    );
  }

  Future<void> go_to_lista_petianos(BuildContext context, UserData user) async {
    Navigator.pushReplacementNamed(context, "/lista_petianos", arguments: user);
  }

  Future<void> go_to_dados_petiano(BuildContext context, UserData user) async {
    Navigator.pushReplacementNamed(context, "/visualizar_dados_petiano",
        arguments: VisualizarDadosArguments(user.name, true, user));
  }
}
