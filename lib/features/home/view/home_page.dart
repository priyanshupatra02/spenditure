import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 300,
        title: Column(
          children: [
            Row(
              children: [
                //profile picture
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      fit: BoxFit.cover,
                      'https://cdn.pixabay.com/photo/2024/03/16/10/29/ai-generated-8636784_1280.jpg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                const Spacer(),
                //month
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.kPrimaryColor.withOpacity(0.3)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  label: const Text('October'),
                ),
                const Spacer(),
                const Icon(
                  Icons.notifications,
                  color: AppColors.kPrimaryColor,
                )
              ],
            ),
            20.heightBox,
            //account balance header text
            Text(
              'Account Balance',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.kGrey500,
                letterSpacing: 0.4,
              ),
            ),
            5.heightBox,
            //account balance amount
            Text(
              '₹9400',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
            30.heightBox,
            //income & expense
            Row(
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
            ),
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
