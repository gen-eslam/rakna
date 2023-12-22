import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';

class HomeLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeLayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) => Text(HomeLayoutCubit.get(context)
              .appBarTitles[HomeLayoutCubit.get(context).currentIndex])),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 40.h);
}
