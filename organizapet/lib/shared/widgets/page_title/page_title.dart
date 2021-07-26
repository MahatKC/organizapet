import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        heightFactor: 3,
        child: Text(title,
            style: TextStyle(fontSize: 27, shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
              )
            ])));
  }
}
