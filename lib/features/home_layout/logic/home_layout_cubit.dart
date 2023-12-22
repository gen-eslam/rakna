import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';
import 'package:rakna/features/location/ui/location_view.dart';
import 'package:rakna/features/setting/view/setting_view.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  final HomeLayoutRepo homeLayoutRepo;
  HomeLayoutCubit({required this.homeLayoutRepo}) : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) =>
      BlocProvider.of<HomeLayoutCubit>(context);
  PageController pageController = PageController(
    keepPage: true,
    initialPage: 0,
  );

  List<String> appBarTitles = [
    StringManager.location,
    StringManager.qrCode,
    StringManager.settings,
  ];
  List screens = [
    const LocationView(),
    const LocationView(),
    const SettingView(),
  ];
  int currentIndex = 0;

  void changePage({required int index}) {
    currentIndex = homeLayoutRepo.changePage(index: index);
    emit(HomeLayoutChangePage());
  }

  void changePageOnTab({required int index}) async {
    changePage(index: index);
    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
