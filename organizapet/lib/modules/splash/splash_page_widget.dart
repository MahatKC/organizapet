import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class SplashPageWidget extends StatelessWidget {
  const SplashPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}