import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';

class HomeLayoutBottomNavBar extends StatelessWidget {
  const HomeLayoutBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return BottomNavigationBar(
            currentIndex: HomeLayoutCubit.get(context).currentIndex,
            onTap: (value) {
              HomeLayoutCubit.get(context).changePageOnTab(index: value);
            },
            items: const [
              BottomNavigationBarItem(
                tooltip: StringManager.location,
                icon: Icon(Icons.location_on),
                label: StringManager.location,
              ),
              BottomNavigationBarItem(
                tooltip: StringManager.qrCode,
                icon: Icon(Icons.account_balance_wallet),
                label: StringManager.qrCode,
              ),
              BottomNavigationBarItem(
                tooltip: StringManager.settings,
                icon: Icon(Icons.settings),
                label: StringManager.settings,
              ),
            ]);
      },
    );
  }
}
