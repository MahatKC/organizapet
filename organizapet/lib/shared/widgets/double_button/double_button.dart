import 'package:flutter/material.dart';
import 'package:organizapet/shared/widgets/icon_button/icon_button.dart';

class DoubleButton extends StatelessWidget {
  final String tipoBotao1;
  final String tipoBotao2;
  const DoubleButton({
    Key? key, required this.tipoBotao1, required this.tipoBotao2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      circleButton(tipoBotao: tipoBotao1),
      circleButton(tipoBotao: tipoBotao2)
    ],);
  }
}