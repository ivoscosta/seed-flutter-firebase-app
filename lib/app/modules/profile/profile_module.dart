import 'package:seed_flutter_app/app//modules/profile/repositories/profile_repository.dart';
import 'package:seed_flutter_app/app/modules/profile/pages/edit_profile/edit_profile_page.dart';
import 'package:seed_flutter_app/app/modules/profile/pages/edit_profile/edit_profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileRepository()),
    Bind.lazySingleton((i) => EditProfileStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/edit', child: (_, args) => EditProfilePage()),
  ];
}
