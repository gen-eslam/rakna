import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/features/setting/data/model/driver_model.dart';
import 'package:rakna/features/setting/data/repo/driver_repo.dart';
import 'package:rakna/features/setting/logic/setting_repo/setting_repo.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required this.settingRepo, required this.driverRepo}) : super(SettingInitialState());
  SettingRepo settingRepo;
  DriverRepo driverRepo ;
  DriverModel? driverModel;

  static SettingCubit get(context) => BlocProvider.of<SettingCubit>(context);
  ThemeMode themeMode = ThemeMode.system;
  
  void getDriverData() {
    driverModel = driverRepo.getDriverData();
  }
  

  void getThemeMode() {
    themeMode = settingRepo.getThemeMode();
  }

  bool isDarkMode() {
    return settingRepo.isDarkMode();
  }

  void changeTheme() {
    themeMode = settingRepo.changeTheme();
    emit(ChangeTheme());
  }
}
