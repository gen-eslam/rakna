import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:rakna/core/utils/space_Manager.dart';

import 'package:rakna/features/home_layout/view/widgets/home_layout_bottom_nav_bar.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
    // DioHelper.getData(
    //   url: RaknaEndPoints.getDriverProfile,
    //   token: CacheService.getDataString(key: Keys.token),
    //   queryParameters: {"uid": DriverModel.getUid()},
    // ).then((value) => print(value.data));
   

    return SafeArea(
      child: Scaffold(
        // appBar: const HomeLayoutAppBar(),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) => PageView.builder(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cubit.screens.length,
            onPageChanged: (value) {
              cubit.changePage(index: value);
            },
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsetsDirectional.all(AppPadding.p16),
                  child: cubit.screens[index]);
            },
          ),
        ),
        bottomNavigationBar: const HomeLayoutBottomNavBar(),
      ),
    );
  }
}
