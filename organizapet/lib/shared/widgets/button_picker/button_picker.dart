import 'package:flutter/material.dart';
import 'package:organizapet/shared/widgets/double_button/double_button.dart';
import 'package:organizapet/shared/widgets/icon_button/icon_button.dart';

class ButtonPicker extends StatelessWidget {
  final bool isDouble;
  final String tipoBotao1;
  final String? tipoBotao2;
  const ButtonPicker({ Key? key , required this.isDouble, required this.tipoBotao1, this.tipoBotao2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isDouble){
      return DoubleButton(tipoBotao1: tipoBotao1, tipoBotao2: tipoBotao2 ?? tipoBotao1);
    }else{
      return circleButton(tipoBotao: tipoBotao1);
    }
  }
}