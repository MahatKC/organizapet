import 'package:flutter/material.dart';
import 'package:organizapet/shared/widgets/circle_button/circle_button.dart';

class DoubleButton extends StatelessWidget {
  final String tipoBotao1;
  final String tipoBotao2;
  final VoidCallback callback1;
  final VoidCallback callback2;
  const DoubleButton({
    Key? key,
    required this.tipoBotao1,
    required this.tipoBotao2,
    required this.callback1,
    required this.callback2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(
          tipoBotao: tipoBotao1,
          callback: callback1,
        ),
        circleButton(tipoBotao: tipoBotao2, callback: callback2)
      ],
    );
  }
}
