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
              padding: const EdgeInsets.only(bottom: 40, top: 30),
              child:
                  Text("OrganizaPET", style: TextStyles.nameApp),
            ),
            Center(child: Image.asset(AppImages.logoOrganiza)),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
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
