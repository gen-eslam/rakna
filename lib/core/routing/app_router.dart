import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/dependency_injection/dependency_injection.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/features/auth/data/repo/auth_repo.dart';
import 'package:rakna/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:rakna/features/auth/view/login_view.dart';
import 'package:rakna/features/auth/view/sign_up_view.dart';
import 'package:rakna/features/garage_details/view/garage_details_view.dart';
import 'package:rakna/features/home_layout/view/home_layout_view.dart';
import 'package:rakna/features/payment/view/pages/payment_ui.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';
import 'package:rakna/features/search/data/repo/search_repo.dart';
import 'package:rakna/features/search/logic/cubit/search_cubit.dart';
import 'package:rakna/features/search/view/search_city_view.dart';
import 'package:rakna/features/search/view/garages_view.dart';
import 'package:rakna/features/splash/view/splash_view.dart';
import 'package:rakna/features/vehicles/logic/vehicles_cubit.dart';
import 'package:rakna/features/vehicles/view/pages/add_vehicles_screen.dart';
import 'package:rakna/features/vehicles/view/pages/vehicles_page.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: PageName.kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: PageName.kLoginView,
      builder: (context, state) => BlocProvider(
          create: (context) => LogInCubit(authRepo: getIt.get<AuthRepoImpl>()),
          child: const LoginView()),
    ),
    GoRoute(
      path: PageName.kSignUpView,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(
          authRepo: getIt.get<AuthRepoImpl>(),
        ),
        child: const SignUpView(),
      ),
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
        page: BlocProvider(
          create: (context) =>
              SearchCubit(searchRepo: getIt.get<SearchRepoImpl>())..getCitys(),
          child: const SearchCityView(),
        ),
      ),
    ),
    GoRoute(
      path: PageName.kSearchGarageView,
      pageBuilder: (context, state) => transitionFunction(
        page: BlocProvider(
          create: (context) =>
              SearchCubit(searchRepo: getIt.get<SearchRepoImpl>())
                ..getGaragesInCity(city: state.extra as String),
          child: const GaragesView(),
        ),
      ),
    ),
    GoRoute(
      path: PageName.kGarageDetailsView,
      pageBuilder: (context, state) => transitionFunction(
        page: BlocProvider(
          create: (context) =>
              SearchCubit(searchRepo: getIt.get<SearchRepoImpl>()),
          child: GarageDetailsView(garageModel: state.extra as GarageModel),
        ),
      ),
    ),
    GoRoute(
      path: PageName.kVisaScreen,
      builder: (context, state) =>
          PaymentPage(garageModel: state.extra as GarageModel),
    ),
    //kVehiclesView
    GoRoute(
      path: PageName.kVehiclesView,
      pageBuilder: (context, state) => transitionFunction(
        page: BlocProvider(
          create: (context) => VehiclesCubit(),
          child: const VehiclesPage(),
        ),
      ),
    ),

    GoRoute(
      path: PageName.kAddVehicleView,
      builder: (context, state) => const AddVehiclesScreen(),
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
