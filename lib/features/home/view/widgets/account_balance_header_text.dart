import 'package:flutter/material.dart';
import 'package:spenditure/const/color/app_colors.dart';

class AccountBalanceHeaderText extends StatelessWidget {
  const AccountBalanceHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Account Balance',
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.kGrey500,
        letterSpacing: 0.4,
      ),
    );
  }
}
