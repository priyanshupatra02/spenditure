import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spenditure/features/counter/controller/counter_state_pod.dart';
import 'package:spenditure/features/theme_segmented_btn/view/theme_segmented_btn.dart';
import 'package:spenditure/l10n/l10n.dart';
import 'package:spenditure/shared/widget/app_locale_popup.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CounterAppBarTitle(),
        actions: const [
          AppLocalePopUp(),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CounterText(),
              20.heightBox,
              Text(
                'Shopping',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                'Buy some grocery',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              10.heightBox,
              const ThemeSegmentedBtn(),
              10.heightBox,
              Slider(
                value: 0.5,
                onChanged: (value) {},
              ),
              10.heightBox,
              ElevatedButton(
                onPressed: () {},
                child: 'Hey'.text.make(),
              ),
              10.heightBox,
              RadioListTile(
                title: const Text('RadioListTile'),
                value: true,
                groupValue: true,
                onChanged: (value) {},
              ),
              10.heightBox,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter a number',
                  label: Text('Enter a number'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                heroTag: 'add',
                onPressed: () => ref.read(counterPod.notifier).increment(),
                child: const Icon(Icons.add),
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                heroTag: 'subtract',
                onPressed: () => ref.read(counterPod.notifier).decrement(),
                child: const Icon(Icons.remove),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CounterAppBarTitle extends StatelessWidget {
  const CounterAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // return Text(l10n.counterAppBarTitle);
    return Text('Counter', style: Theme.of(context).textTheme.displaySmall);
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final count = ref.watch(counterPod);
    return Text('Recent Transaction', style: Theme.of(context).textTheme.headlineSmall);
  }
}
