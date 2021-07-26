import 'package:flutter/material.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';

class SinglePageButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback callback;
  const SinglePageButton(
      {Key? key, required this.buttonLabel, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.button),
              elevation: MaterialStateProperty.all(5),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 15))),
          onPressed: callback,
          child: (Text(
            buttonLabel,
            style: TextStyles.button,
          )),
        ),
      ),
    );
  }
}