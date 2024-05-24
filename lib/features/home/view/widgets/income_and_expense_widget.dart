import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';

class IncomeAndExpenseWidget extends StatelessWidget {
  const IncomeAndExpenseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            backgroundColor: AppColors.kSuccessColor,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(R.ASSETS_ICONS_INCOME_SVG),
          label: RichText(
            text: TextSpan(
              text: 'Income\n',
              style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: '₹${2000}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            backgroundColor: AppColors.kErrorColor,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          icon: SvgPicture.asset(R.ASSETS_ICONS_EXPENSE_SVG),
          label: RichText(
            text: TextSpan(
              text: 'Expense\n',
              style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: '₹${1200}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
