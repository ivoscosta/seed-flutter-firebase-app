import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:seed_flutter_app/app/modules/auth/repositories/auth_repository_interface.dart';
import 'package:seed_flutter_app/core/utils/util.dart';
import 'package:seed_flutter_app/core/widgets/custom-alert-one-button.dart';
import 'package:seed_flutter_app/core/theme/colors.dart' as colors;

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  final IAuthRepository authRepository;
  TextEditingController emailController = TextEditingController();

  _ForgotPasswordStoreBase(this.authRepository) {
    emailController.text = Modular.args!.data;
  }

  recoveryPassword(BuildContext context) {
    String email = emailController.text.trim();
    if (["", null, false, 0].contains(email)) {
      Util.showSnackbar(
        context,
        FlutterI18n.translate(context, 'fill_all_fields'),
        colors.alert,
      );
      return;
    }
    authRepository.sendPasswordResetEmail(email);
    showDialogVerifyEmail(context);
  }

  showDialogVerifyEmail(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertOneButton(
              title: FlutterI18n.translate(context, 'verify_email'),
              text:
                  FlutterI18n.translate(context, 'recovery_password_popup_msg'),
              buttonLabel: FlutterI18n.translate(context, 'back_to_sign_in'),
              imageAsset: 'assets/images/email.png',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ));
  }
}
