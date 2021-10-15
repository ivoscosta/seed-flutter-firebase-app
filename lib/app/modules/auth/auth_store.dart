import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_in/sign_in_store.dart';
import 'package:seed_flutter_app/core/utils/globals.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final SignInStore signInStore;

  _AuthStoreBase(this.signInStore);

  Future getCurrentUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await signInStore.getUserProfile(FirebaseAuth.instance.currentUser!);
    }
    return;
  }

  logoutUser() {
    FirebaseAuth.instance.signOut();
    currentUser = null;
  }
}
