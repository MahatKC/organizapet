import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/modules/login/login_controller.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';
import 'package:organizapet/shared/widgets/social_login_button/social_login_button.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = loginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40, top: 30),
            child: Text("OrganizaPET", style: TextStyles.nameApp),
          ),
          Center(child: Image.asset(AppImages.logoOrganiza)),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: SocialLoginButton(
              onTap: () async {
                await controller
                    .executeLogin(context)
                    .then((value) => loginDone(value));
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginDone(bool has_access) async {
    if (has_access) {
      print("no sistema");
      UserData user = await controller.getUser();
      change_screen(context, user);
    } else {
      print("fora do sistema");
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            PopupUmaOpcao(title: "Erro", message: "Acesso negado."),
      );
    }
  }

  Future<void> change_screen(BuildContext context, UserData user) async {
    user.print_shared_prefs();
    Navigator.pushReplacementNamed(context, "/lista_petianos", arguments: user);
  }
}
