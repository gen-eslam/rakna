import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utils/string_manager.dart';

class HomeLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeLayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(StringManager.appName),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 40.h);
}
