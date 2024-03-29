import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 56,
          width: 450,
          decoration: BoxDecoration(
              color: AppColors.shape,
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.stroke)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(4, 4)),
              ]),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.google),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColors.stroke,
                      )
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment(-0.2, 0),
                  child: Text(
                    'Entrar com o Google',
                    style: TextStyles.buttonGray,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
