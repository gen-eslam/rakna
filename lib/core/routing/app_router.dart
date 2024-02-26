import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/features/auth/login/view/login_view.dart';
import 'package:rakna/features/auth/sign_up/view/sign_up_view.dart';
import 'package:rakna/features/home_layout/view/home_layout_view.dart';
import 'package:rakna/features/search/view/search_view.dart';
import 'package:rakna/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: PageName.kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: PageName.kLoginView,
      builder: (context, state) => const LoginView(), 
    ),

    GoRoute(
      path: PageName.kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: PageName.kHomeLayoutView,
      pageBuilder: (context, state) => transitionFunction(
        page: const HomeLayoutView(),
      ),
    ),
     GoRoute(
      path: PageName.kSearchView,
      pageBuilder: (context, state) => transitionFunction(
        page: const SearchView(),
      ),
    ),
  ]);
}

Page<dynamic> transitionFunction({
  required Widget page,
}) {
  return CustomTransitionPage<void>(
    child: page,
    transitionDuration: const Duration(milliseconds: 750),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.decelerate,
      ),
      child: child,
    ),
  );
}
