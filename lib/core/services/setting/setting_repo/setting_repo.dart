import 'package:flutter/material.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/services/cache_service.dart';

abstract class SettingRepo {
  ThemeMode getThemeMode();
  ThemeMode changeTheme();
  bool isDarkMode();
}

class SettingRepoImpl implements SettingRepo {
  @override
  ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  ThemeMode changeTheme() {
    if (isDarkMode()) {
      CacheService.put(key: Keys.isDarkMode, value: false);
      return ThemeMode.light;
    } else {
      CacheService.put(key: Keys.isDarkMode, value: true);
      return ThemeMode.dark;
    }
  }

  @override
  bool isDarkMode() {
    return CacheService.getDataBool(key: Keys.isDarkMode) ?? false;
  }
}
