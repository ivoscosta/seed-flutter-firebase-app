import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository.dart';
import 'package:seed_flutter_app/app/modules/home/home_page.dart';
import 'package:seed_flutter_app/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i())),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => AuthStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
