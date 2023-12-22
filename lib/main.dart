import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/dependency_injection/dependency_injection.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/payment_aPi_helper.dart';
import 'package:rakna/core/routing/app_router.dart';
import 'package:rakna/core/services/cache_helper.dart';
import 'package:rakna/core/services/setting/cubit/setting_cubit.dart';
import 'package:rakna/core/services/setting/setting_repo/setting_repo.dart';
import 'package:rakna/core/theme/theme_app.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';
import 'package:rakna/features/home_layout/logic/home_layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  DioHelper.init();
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
            create: (context) =>
                SettingCubit(settingRepo: getIt.get<SettingRepoImpl>())
                  ..getThemeMode(),
          ),
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
