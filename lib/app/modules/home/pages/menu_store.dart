import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/auth_store.dart';
import 'package:seed_flutter_app/core/utils/globals.dart';
import 'package:seed_flutter_app/core/utils/util.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';

part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  final AuthStore authStore;

  _MenuStoreBase(this.authStore);

  logout() {
    authStore.logoutUser();
    currentUserStreamController.add('USER_SIGN_OUT');
  }

  visitSite() {
    Util.launchURL(SITE);
  }

  rateApp() {
    LaunchReview.launch(
      writeReview: false,
    );
  }

  inviteFriends(BuildContext context) {
    Share.share(FlutterI18n.translate(context, 'msg_invite_friends') + SITE);
  }
}
