import 'package:mobx/mobx.dart';

part 'page_view_controller.g.dart';

class PageViewController = _PageViewControllerBase with _$PageViewController;

abstract class _PageViewControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  updateIndex(int state) {
    return "${state = currentIndex + 1}/4";
  }
}
