import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
import 'package:spenditure/shared/widget/buttons/secondary_action_button.dart';

class IncomeAndExpenseButtons extends StatelessWidget {
  const IncomeAndExpenseButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //income button
        SecondaryActionButton(
          labelText: 'Income\n',
          onPressed: () {},
          secondaryText: '₹${5000}',
          color: AppColors.kSuccessColor,
          icon: SvgPicture.asset(R.ASSETS_ICONS_INCOME_SVG),
        ),
        //expense button
        SecondaryActionButton(
          labelText: 'Expense\n',
          onPressed: () {},
          secondaryText: '₹${1200}',
          color: AppColors.kErrorColor,
          icon: SvgPicture.asset(R.ASSETS_ICONS_EXPENSE_SVG),
        ),
      ],
    );
  }
}
