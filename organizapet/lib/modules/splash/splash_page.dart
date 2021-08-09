import 'package:flutter/material.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData user = UserData();
    user.set_perfil("gerente");

    change_screen(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.logoOrganiza)),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child:
                  Center(child: Text("OrganizaPET", style: TextStyles.nameApp)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> change_screen(BuildContext context) async {
    UserData user = await UserData();
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/lista_petianos",
        arguments: user.isTutor);
  }
}
