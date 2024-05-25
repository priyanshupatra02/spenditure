import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:spenditure/const/resource.dart';
import 'package:spenditure/features/home/view/widgets/see_all_button.dart';
import 'package:spenditure/shared/widget/header_text_widget.dart';
import 'package:velocity_x/velocity_x.dart';

enum TransactionType { today, week, month, year }

class TransactionDatesWidget extends StatefulWidget {
  const TransactionDatesWidget({super.key});

  @override
  State<TransactionDatesWidget> createState() => _TransactionDatesWidgetState();
}

class _TransactionDatesWidgetState extends State<TransactionDatesWidget> {
  TransactionType transactionView = TransactionType.today;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //segmented button
        SegmentedButton<TransactionType>(
          segments: <ButtonSegment<TransactionType>>[
            ButtonSegment<TransactionType>(
              value: TransactionType.today,
              label: Text(
                'Today',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                ),
              ),
              enabled: true,
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.week,
              label: Text(
                'Week',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                ),
              ),
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.month,
              label: Text(
                'Month',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                ),
              ),
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.year,
              label: Text(
                'Year',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                ),
              ),
            ),
          ],
          selected: <TransactionType>{transactionView},
          onSelectionChanged: (Set<TransactionType> newSelection) {
            setState(() {
              transactionView = newSelection.first;
            });
          },
          //segmented button style
          style: const ButtonStyle(
            side: MaterialStatePropertyAll(
              BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            minimumSize: MaterialStatePropertyAll(
              Size.fromWidth(12),
            ),
          ),
        ).centered(),
        20.heightBox,
        //recent transaction header
        Row(
          children: [
            const HeaderTextWidget(title: 'Recent Transactions').objectCenterLeft(),
            const Spacer(),
            const SeeAllButton(),
          ],
        ),
        15.heightBox,
        //transaction date ui (use switch case instead of 'if-else')
        switch (transactionView) {
          TransactionType.today => const TransactionView(),
          TransactionType.week => const TransactionView(),
          TransactionType.month => const TransactionView(),
          TransactionType.year => const TransactionView(),
        }
      ],
    );
  }
}

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: AppColors.kGrey100,
          leading: SvgPicture.asset(R.ASSETS_TRANSACTION_ICONS_SUBSCRIPTION_SVG),
          // isThreeLine: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //item title
              'Shopping'.text.make(),
              5.heightBox,
              //item description
              'Buy some grocery'
                  .text
                  .textStyle(
                    TextStyle(
                      color: AppColors.kGrey,
                      fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  )
                  .make(),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //deducted amount
              Text(
                '- ₹${120}',
                style: TextStyle(
                  color: AppColors.kErrorColor,
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.heightBox,
              //deducted time
              Text(
                '10:00AM',
                style: TextStyle(
                  color: AppColors.kGrey,
                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return 18.heightBox;
      },
    );
  }
}
