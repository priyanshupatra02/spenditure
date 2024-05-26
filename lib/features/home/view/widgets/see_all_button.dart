import 'package:flutter/material.dart';
import 'package:spenditure/shared/widget/buttons/secondary_action_button.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryActionButton(
      isIcon: false,
      onPressed: () {},
      fontWeight: FontWeight.w500,
      labelText: 'See All',
    );
  }
}
