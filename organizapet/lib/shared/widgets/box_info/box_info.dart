import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';

class BoxInfo extends StatelessWidget {
  final String imagem;
  final String texto;
  const BoxInfo({Key? key, required this.imagem, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 42, right: 42),
      child: Container(
        // height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.boxListBorder, width: 1)),
        child: ListTile(
          title: Text(
            texto,
            style: TextStyles.infoBox,
          ),
          leading: Image.asset(imagem),
          onTap: () {
            //copyToClipboard();
            Tooltip(
              message: 'play',
              child: Icon(Icons.play_arrow),
            );
          },
        ),
      ),
    );
  }

  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: texto));
    // _scaffoldKey.currentState.showSnackBar(SnackBar(
    // content: Text('Copied to clipboard'),
    //));
  }
}
