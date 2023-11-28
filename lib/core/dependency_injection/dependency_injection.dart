import 'package:get_it/get_it.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';

final getIt = GetIt.instance;
void dependencyInjectionSetup() {
  getIt.registerSingleton<HomeLayoutRepoImpl>(HomeLayoutRepoImpl());

}