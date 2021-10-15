import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository_interface.dart';

import 'package:seed_flutter_app/core/theme/colors.dart' as colors;
import 'package:seed_flutter_app/core/utils/globals.dart';
import 'package:seed_flutter_app/core/utils/util.dart';
import 'package:seed_flutter_app/core/widgets/custom-alert-one-button.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final IAuthRepository authRepository;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.email',
    ],
  );

  @observable
  bool loading = false;

  _SignInStoreBase(
    this.authRepository,
  );

  @action
  startLoading() {
    loading = true;
  }

  @action
  stopLoading() {
    loading = false;
  }

  signIn(context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (["", null, false, 0].contains(email) ||
        ["", null, false, 0].contains(password)) {
      Util.showSnackbar(
        context,
        FlutterI18n.translate(context, 'fill_all_fields'),
        colors.alert,
      );
      return;
    }
    startLoading();
    authRepository.signIn(email, password).then((value) async {
      User? user = value;
      if (user != null && !user.emailVerified) {
        try {
          await user.sendEmailVerification();
        } catch (e) {}
        showDialogVerifyEmail(context);
        FirebaseAuth.instance.signOut();
        stopLoading();
      } else {
        //user is logged and verified
        getUserProfile(user!, context);
      }
    }).catchError((errorCode, stackTrace) {
      String error;
      stopLoading();
      print(errorCode);
      if (errorCode == 'invalid-email')
        error = 'auth_error_invalid_email';
      else if (errorCode == 'user-disabled')
        error = 'auth_error_user_disabled';
      else if (errorCode == 'user-not-found')
        error = 'auth_error_user_not_found';
      else if (errorCode == 'wrong-password')
        error = 'auth_error_wrong_password';
      else
        error = 'auth_error_internal';
      Util.showSnackbar(context, error, colors.alert);
    });
  }

  showDialogVerifyEmail(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertOneButton(
              title: FlutterI18n.translate(context, 'verify_email'),
              text: FlutterI18n.translate(context, 'sign_up_popup_msg'),
              buttonLabel: FlutterI18n.translate(context, 'back_to_sign_in'),
              imageAsset: 'assets/images/email.png',
              onPressed: () {
                Navigator.pop(context);
              },
            ));
  }

  Future getUserProfile(User user, [context]) async {
    currentUser = await authRepository.getUserProfile(user.uid);
    if (currentUser != null)
      currentUserStreamController.add('USER_SIGN_IN');
    else
      currentUserStreamController.add('USER_WITHOUT_PROFILE');
    if (context != null) {
      Navigator.pop(context);
      stopLoading();
    }
  }

  signInWithGoogle(BuildContext context) async {
    startLoading();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      getUserProfile(userCredential.user!, context);
    } catch (e) {
      stopLoading();
    }
  }
}
