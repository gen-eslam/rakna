import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/dependency_injection/dependency_injection.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/payment_aPi_helper.dart';
import 'package:rakna/core/routing/app_router.dart';
import 'package:rakna/core/services/bloc_observer.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/theme_app.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';
import 'package:rakna/features/location/data/location_repo.dart';
import 'package:rakna/features/location/logic/cubit/location_cubit.dart';
import 'package:rakna/features/setting/data/repo/driver_repo.dart';
import 'package:rakna/features/setting/logic/cubit/setting_cubit.dart';
import 'package:rakna/features/setting/logic/setting_repo/setting_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheService.init();
  DioHelper.init();
  PaymentApiHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  PaymentApiHelper.init();
  dependencyInjectionSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeLayoutCubit(
              homeLayoutRepo: getIt.get<HomeLayoutRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => SettingCubit(
                settingRepo: getIt.get<SettingRepoImpl>(),
                driverRepo: getIt.get<DriverRepoImpl>())
              ..getThemeMode(),
          ),
          BlocProvider(
              create: (context) => LocationCubit(
                  locationRepo: getIt.get<LocationRepoImpl>(),
                  settingRepo: getIt.get<SettingRepoImpl>())
                ..checkAndRequestLocationPermission()),
        ],
        child:
            BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
          return MaterialApp.router(
            title: StringManager.appName,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeApp.light(context),
            darkTheme: ThemeApp.dark(context),
            themeMode: SettingCubit.get(context).themeMode,
          );
        }),
      ),
    );
  }
}
