import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/profile/repositories/profile_repository_interface.dart';
import 'package:seed_flutter_app/core/models/user_profile.dart';
import 'package:seed_flutter_app/core/utils/globals.dart';
import 'package:seed_flutter_app/core/utils/util.dart';
import 'package:seed_flutter_app/core/theme/colors.dart' as colors;

part 'edit_profile_store.g.dart';

class EditProfileStore = _EditProfileStoreBase with _$EditProfileStore;

abstract class _EditProfileStoreBase with Store {
  TextEditingController nameController = TextEditingController();
  IProfileRepository profileRepository;

  @observable
  bool loading = false;

  _EditProfileStoreBase(this.profileRepository) {
    if (currentUser != null) populateFields();
  }

  @action
  startLoading() {
    loading = true;
  }

  @action
  stopLoading() {
    loading = false;
  }

  @action
  populateFields() {
    nameController.text = currentUser?.name ?? '';
  }

  void save(BuildContext context) async {
    String name = nameController.text.trim();
    if (["", null, false, 0].contains(name)) {
      Util.showSnackbar(
        context,
        FlutterI18n.translate(context, 'fill_all_fields'),
        colors.alert,
      );
      return;
    }
    startLoading();
    var userProfile =
        UserProfile(id: FirebaseAuth.instance.currentUser!.uid, name: name);
    await profileRepository.saveUserProfile(userProfile);
    currentUser = userProfile;
    currentUserStreamController.add('USER_SIGN_IN');
    stopLoading();
    Navigator.of(context).pop();
  }
}
