import 'package:flutter/material.dart';
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
          segments: const <ButtonSegment<TransactionType>>[
            ButtonSegment<TransactionType>(
              value: TransactionType.today,
              label: Text('Today'),
              enabled: true,
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.week,
              label: Text('Week'),
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.month,
              label: Text('Month'),
            ),
            ButtonSegment<TransactionType>(
              value: TransactionType.year,
              label: Text('Year'),
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
        //transaction date ui (use switch case instead of 'if-else')
        switch (transactionView) {
          TransactionType.today => 'Today'.text.make(),
          TransactionType.week => 'Week'.text.make(),
          TransactionType.month => 'Month'.text.make(),
          TransactionType.year => 'Year'.text.make(),
        }
      ],
    );
  }
}
