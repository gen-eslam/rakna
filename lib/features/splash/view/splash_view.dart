import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';

import 'package:rakna/features/splash/view/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.forward();
    Future.delayed(const Duration(milliseconds: 3000), () {
      context.push(PageName.kLoginView);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SplashViewBody(
        animation: animation,
      )),
    );
  }
}
