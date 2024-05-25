import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String title;
  const HeaderTextWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
