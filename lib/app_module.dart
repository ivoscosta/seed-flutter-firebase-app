import 'package:seed_flutter_app/app/modules/auth/auth_module.dart';
import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_in/sign_in_store.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app/modules/home/home_module.dart';
import 'package:seed_flutter_app/app/modules/home/pages/menu_store.dart';
import 'package:seed_flutter_app/app/modules/profile/profile_module.dart';
import 'package:seed_flutter_app/app/modules/search/search_module.dart';
import 'package:seed_flutter_app/app_controller.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.factory((i) => SignInStore(i())),
    Bind.factory((i) => AuthStore(i())),
    Bind.factory((i) => MenuStore(i())),
    $AppController,
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/home',
      module: HomeModule(),
    ),
    ModuleRoute(
      '/auth',
      module: AuthModule(),
    ),
    ModuleRoute(
      '/profile',
      module: ProfileModule(),
    ),
    ModuleRoute(
      '/search',
      module: SearchModule(),
    ),
  ];
}
