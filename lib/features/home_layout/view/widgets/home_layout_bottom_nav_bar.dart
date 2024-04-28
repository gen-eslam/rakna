import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeLayoutBottomNavBar extends StatelessWidget {
  const HomeLayoutBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return SalomonBottomBar(
            currentIndex: HomeLayoutCubit.get(context).currentIndex,
            onTap: (value) {
              HomeLayoutCubit.get(context).changePageOnTab(index: value);
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: CustomText(
                  text: StringManager.home,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: CustomText(
                  text: StringManager.settings,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
            ]);
      },
    );
  }
}
