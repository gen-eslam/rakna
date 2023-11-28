abstract class HomeLayoutRepo {
  int changePage({required int index});
}


class HomeLayoutRepoImpl extends HomeLayoutRepo {
  @override
  int changePage({required int index}) {
    return index;
  }
}