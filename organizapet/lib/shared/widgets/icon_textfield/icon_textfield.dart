import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_images.dart';

class IconTextField extends StatefulWidget {
  const IconTextField({ Key? key }) : super(key: key);

  @override
  _IconTextFieldState createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      child: TextField(
        decoration: 
        InputDecoration(
          suffixIcon: IconButton(onPressed: (){}, icon: Image.asset(AppImages.calendario)),
          hintText: "Prazo",
        ),
      ),
    );
  }
}