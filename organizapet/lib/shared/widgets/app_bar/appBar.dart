import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class BarraApp extends StatelessWidget {
  const BarraApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("OrganizaPET", style: TextStyles.nameAppBarra,);
  }
}