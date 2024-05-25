import 'package:flutter/material.dart';

class SpendFrequencyHeaderText extends StatelessWidget {
  const SpendFrequencyHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Spend Frequency',
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
