import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/features/home_layout/data/home_layout_repo.dart';
import 'package:rakna/features/location/location_view/ui/location_view.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  final HomeLayoutRepo homeLayoutRepo;
  HomeLayoutCubit({required this.homeLayoutRepo}) : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) =>
      BlocProvider.of<HomeLayoutCubit>(context);
  PageController pageController = PageController(viewportFraction: 1);

  List screens = [
    const LocationView(),
    const LocationView(),
    const LocationView(),
  ];
  int currentIndex = 0;

  void changePage({required int index}) async {
    currentIndex = homeLayoutRepo.changePage(index: index);
    emit(HomeLayoutChangePage());
  }

  Future<void> changePageOnTab({required int index}) async {
    changePage(index: index);
    await pageController.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
