import 'package:mobx/mobx.dart';

import 'package:trabalho_final_dgpr/features/register/pageview/page_view.dart';

part 'page_view_controller.g.dart';

class PageViewController = _PageViewControllerBase with _$PageViewController;

abstract class _PageViewControllerBase with Store {
  @observable
  RegisterPageView state = RegisterPageView();

  @action
  updateIndex(int page) {
    return page = page + 1;
  }
}
