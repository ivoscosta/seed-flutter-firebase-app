import 'package:seed_flutter_app/app//modules/search/search_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app/modules/search/search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      transition: TransitionType.fadeIn,
      child: (_, args) => SearchPage(),
    ),
  ];
}
