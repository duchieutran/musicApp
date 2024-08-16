import 'package:mobx/mobx.dart';
part 'navigator_store.g.dart';

class NavigatorStore = NavigatorBase with _$NavigatorStore;

abstract class NavigatorBase with Store {
  @observable
  int indexCurrent = 0;

  @action
  void setIndex(int value) {
    indexCurrent = value;
  }
}
