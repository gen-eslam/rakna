import 'package:get_it/get_it.dart';
import 'package:rakna/features/location/logic/services/location_service.dart';
import 'package:rakna/core/services/setting/setting_repo/setting_repo.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';
import 'package:rakna/features/location/data/location_repo.dart';
import 'package:rakna/features/location/logic/services/map_controller.dart';
import 'package:rakna/features/search/data/repo/search_repo.dart';

final getIt = GetIt.instance;
void dependencyInjectionSetup() {
  /// services
  getIt.registerSingleton<LocationService>(LocationService());
  getIt.registerSingleton<MapController>(MapController());

  /// repo
  getIt.registerSingleton<HomeLayoutRepoImpl>(HomeLayoutRepoImpl());
  getIt.registerSingleton<SettingRepoImpl>(SettingRepoImpl());
  getIt.registerSingleton<LocationRepoImpl>(LocationRepoImpl(
      locationService: getIt.get<LocationService>(),
      mapController: getIt.get<MapController>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
}
