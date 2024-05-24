import 'package:flutter/material.dart';

class TotalAccountBalance extends StatelessWidget {
  const TotalAccountBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '₹9400',
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.3,
      ),
    );
  }
}
