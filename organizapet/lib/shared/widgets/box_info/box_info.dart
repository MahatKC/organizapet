import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class BoxInfo extends StatelessWidget {
  final String imagem;
  const BoxInfo({Key? key, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 42, right: 42),
      child: Container(
          height: 49,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: AppColors.boxListBorder, width: 1)),
          child: ListView(
            children: [
              Align(
                child: ListTile(
                    title: Text(
                      "Mateus Edival Rodrigues da Silveira",
                      style: TextStyles.infoBox,
                    ),
                    leading: Image.asset(imagem)),
              ),
            ],
          )),
    );
  }
}
