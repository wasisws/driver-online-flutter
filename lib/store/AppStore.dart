import 'package:mobx/mobx.dart';

// Include generated file
part 'AppStore.g.dart';

// This is the class used by rest of your codebase
class AppStore = _AppStore with _$AppStore;

// The store-class
abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  Future<void> setLoggedIn(bool val) async {
    isLoading = val;
  }

  @action
  Future<void> setLoading(bool val) async {
    isLoading = val;
  }
}
