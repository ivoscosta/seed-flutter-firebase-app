import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AuthStore authStore;

  _AppControllerBase(this.authStore) {
    getCurrentUser();
  }

  getCurrentUser() async {
    await authStore.getCurrentUser();
  }

  setSystemStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // systemNavigationBarColor: colors.wakanda1000, // navigation bar color
        // statusBarColor: colors.wakanda1000, // status bar color
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
