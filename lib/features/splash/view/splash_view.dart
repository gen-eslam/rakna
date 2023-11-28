import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';

import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/features/splash/view/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      context.push(PageName.kLoginView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.black, body: SplashViewBody()),
    );
  }
}
