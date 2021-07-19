import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child:
                  Center(child: Text("OrganizaPET", style: TextStyles.nameApp)),
            ),
            Center(child: Image.asset(AppImages.logoOrganiza)),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: SocialLoginButton(
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
