import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
import 'package:spenditure/features/home/view/widgets/account_balance_header_text.dart';
import 'package:spenditure/features/home/view/widgets/income_and_expense_widget.dart';
import 'package:spenditure/features/home/view/widgets/quick_action_widgets.dart';
import 'package:spenditure/features/home/view/widgets/total_account_balance.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 300,
        title: Column(
          children: [
            const QuickActionWidgets(),
            20.heightBox,
            //account balance header text
            const AccountBalanceHeaderText(),
            5.heightBox,
            //account balance amount
            const TotalAccountBalance(),
            30.heightBox,
            //income & expense
            const IncomeAndExpenseWidget(),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.kAppBarGradientStart,
                AppColors.kAppBarGradientEnd.withOpacity(0.3)
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
