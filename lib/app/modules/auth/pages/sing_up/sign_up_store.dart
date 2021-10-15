import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository_interface.dart';
import 'package:seed_flutter_app/core/utils/util.dart';
import 'package:seed_flutter_app/core/widgets/custom-alert-one-button.dart';
import 'package:seed_flutter_app/core/theme/colors.dart' as colors;

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final IAuthRepository authRepository;

  @observable
  bool loading = false;

  _SignUpStoreBase(this.authRepository);

  @action
  startLoading() {
    loading = true;
  }

  @action
  stopLoading() {
    loading = false;
  }

  createAccount(context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String repeatPassword = repeatPasswordController.text.trim();
    if (["", null, false, 0].contains(email) ||
        ["", null, false, 0].contains(password) ||
        ["", null, false, 0].contains(repeatPassword)) {
      Util.showSnackbar(
        context,
        FlutterI18n.translate(context, 'fill_all_fields'),
        colors.alert,
      );
      return;
    }
    if (password != repeatPassword) {
      Util.showSnackbar(
        context,
        FlutterI18n.translate(context, 'msg_different_passwords'),
        colors.alert,
      );
      return;
    }
    startLoading();
    authRepository
        .createUserWithEmailAndPassword(email, password)
        .then((value) {
      UserCredential authResult = value;
      authResult.user?.sendEmailVerification();
      Navigator.pop(context);
      showDialogVerifyEmail(context);
      FirebaseAuth.instance.signOut();
    }).catchError((errorCode, stackTrace) {
      String error;
      stopLoading();
      print(errorCode);
      if (errorCode == 'invalid-email')
        error = 'auth_error_invalid_email';
      else if (errorCode == 'weak-password')
        error = 'auth_error_weak_password';
      else if (errorCode == 'email-already-in-use')
        error = 'auth_error_email_already_in_used';
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
}
