import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AuthStore authStore;

  _HomeStoreBase(this.authStore);
}
