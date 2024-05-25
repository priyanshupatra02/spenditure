import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
import 'package:spenditure/features/budget/view/budget_page.dart';
import 'package:spenditure/features/home/view/home_page.dart';
import 'package:spenditure/features/profile/view/profile_page.dart';
import 'package:spenditure/features/transaction/view/transaction_page.dart';

@RoutePage()
class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavbarView();
  }
}

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  List screen = [
    const HomePage(),
    const TransactionPage(),
    const BudgetPage(),
    const ProfilePage(),
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // double displayWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: PageView.builder(
        pageSnapping: false,
        itemCount: 1,
        itemBuilder: (context, index) {
          return screen[currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(

            // indicatorColor: Colors.grey.shade400,
            ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          // height: 70,
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          selectedItemColor: AppColors.kPrimaryColor,
          selectedIconTheme: const IconThemeData(
            color: AppColors.kPrimaryColor,
          ),
          unselectedIconTheme: IconThemeData(color: AppColors.kGrey500),
          unselectedItemColor: AppColors.kGrey500,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
          // backgroundColor: Colors.white,
          // AppColors.kBottomSheetListColor.withOpacity(0.2),
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(R.ASSETS_BOTTOM_NAV_BAR_ICONS_HOME_SVG),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                R.ASSETS_BOTTOM_NAV_BAR_ICONS_HOME_SVG,
                colorFilter: const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(R.ASSETS_BOTTOM_NAV_BAR_ICONS_TRANSACTION_SVG),
              label: 'Transaction',
              activeIcon: SvgPicture.asset(
                R.ASSETS_BOTTOM_NAV_BAR_ICONS_TRANSACTION_SVG,
                colorFilter: const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(R.ASSETS_BOTTOM_NAV_BAR_ICONS_BUDGET_SVG),
              label: 'Budget',
              activeIcon: SvgPicture.asset(
                R.ASSETS_BOTTOM_NAV_BAR_ICONS_BUDGET_SVG,
                colorFilter: const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(R.ASSETS_BOTTOM_NAV_BAR_ICONS_PROFILE_SVG),
              label: 'Profile',
              activeIcon: SvgPicture.asset(
                R.ASSETS_BOTTOM_NAV_BAR_ICONS_PROFILE_SVG,
                colorFilter: const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
