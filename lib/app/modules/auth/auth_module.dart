import 'package:seed_flutter_app/app/modules/auth/pages/forgot_password/forgot_password_page.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/forgot_password/forgot_password_store.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_in/sign_in_page.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_in/sign_in_store.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_up/sign_up_page.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_up/sign_up_store.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository.dart';
import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ForgotPasswordStore(i())),
    Bind.factory((i) => SignUpStore(i())),
    Bind.factory((i) => SignInStore(i())),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => AuthStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      transition: TransitionType.fadeIn,
      child: (_, args) => SignInPage(),
    ),
    ChildRoute('/signup', child: (_, args) => SignUpPage()),
    ChildRoute('/forgot_password', child: (_, args) => ForgotPasswordPage()),
  ];
}
