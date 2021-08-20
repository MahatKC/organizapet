import 'package:flutter/cupertino.dart';

class ResponsiveList extends StatelessWidget {
  final ListView list;
  const ResponsiveList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 700,
            child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: list)));
  }
}
