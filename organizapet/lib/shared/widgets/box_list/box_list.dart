import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class BoxList extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback callback;
  const BoxList(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 60, right: 60),
      child: Container(
          height: 67,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: AppColors.boxList,
              border: Border.all(color: AppColors.boxListBorder, width: 1)),
          child: ListView(
            children: [
              Align(
                child: ListTile(
                    title: Text(
                      titulo,
                      style: TextStyles.titleBoxList,
                    ),
                    subtitle: Text(
                      subtitulo,
                      style: TextStyles.subtitleBoxList,
                    ),
                    // leading: Icon(Icons.flash_on),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 32,
                        color: AppColors.arrow,
                      ),
                      onPressed: callback,
                    )),
              )
            ],
          )),
    );
  }
}
