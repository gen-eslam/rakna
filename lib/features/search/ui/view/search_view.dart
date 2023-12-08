import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/features/search/ui/widget/animated_list_view.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(children: [
        ToggleSwitch(
          initialLabelIndex: 0,
          animate: true,
          customWidths: [context.deviceWidth * 0.3, context.deviceWidth * 0.3],
          totalSwitches: 2,
          labels: const [
            'City',
            'Nearst Place',
          ],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
        const Expanded(child: AnimatedListView()),
      ]),
    );
  }
}
