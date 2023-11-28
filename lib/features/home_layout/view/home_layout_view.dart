import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rakna/features/home_layout/view/widgets/home_layout_app_bar.dart';
import 'package:rakna/features/home_layout/view/widgets/home_layout_bottom_nav_bar.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeLayoutCubit cubit = HomeLayoutCubit.get(context);

    return Scaffold(
      appBar: const HomeLayoutAppBar(),
      body: PageView.builder(
        controller: cubit.pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: cubit.screens.length,
        onPageChanged: (value) {
          cubit.changePage(index: value);
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(15.r),
            child: cubit.screens[cubit.currentIndex],
          );
        },
      ),
      bottomNavigationBar: const HomeLayoutBottomNavBar(),
    );
  }
}
