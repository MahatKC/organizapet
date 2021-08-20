import 'package:flutter/material.dart';
import 'package:organizapet/shared/widgets/double_button/double_button.dart';
import 'package:organizapet/shared/widgets/circle_button/circle_button.dart';

class SingleDoubleButtonSelector extends StatelessWidget {
  final bool isDouble;
  final String tipoBotao1;
  final String? tipoBotao2;
  final VoidCallback callback1;
  final VoidCallback? callback2;
  const SingleDoubleButtonSelector(
      {Key? key,
      required this.isDouble,
      required this.tipoBotao1,
      this.tipoBotao2,
      required this.callback1,
      this.callback2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isDouble) {
      return DoubleButton(
          tipoBotao1: tipoBotao1, tipoBotao2: tipoBotao2 ?? tipoBotao1,
          callback1: callback1, callback2: callback2 ?? callback1,);
    } else {
      return circleButton(tipoBotao: tipoBotao1, callback: callback1,);
    }
  }
}
