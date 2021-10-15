import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_up/sign_up_store.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';
import 'package:seed_flutter_app/core/widgets/app_button_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_progress_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_password_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_widget.dart';
import 'package:seed_flutter_app/core/widgets/global_app_bar.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key? key, this.title = 'SignUpPage'}) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  SignUpStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: marginSide),
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                SizedBox(height: marginSection),
                SvgPicture.asset(
                  'assets/svg/logo.svg',
                  height: 60,
                ),
                SizedBox(height: marginSection),
                Text(
                  FlutterI18n.translate(context, "create_account_on_app"),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: marginSide),
                AppTextField(
                  titleText: FlutterI18n.translate(context, "email") + ' *',
                  controller: store.emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  hintText: FlutterI18n.translate(context, "hint_email"),
                ),
                SizedBox(height: marginSide),
                AppTextFieldPassword(
                  titleText: FlutterI18n.translate(context, "password") + ' *',
                  controller: store.passwordController,
                  textInputAction: TextInputAction.next,
                  hintText: FlutterI18n.translate(context, "hint_password"),
                  onChanged: (text) => null,
                ),
                SizedBox(height: marginSide),
                AppTextFieldPassword(
                  titleText:
                      FlutterI18n.translate(context, "repeat_password") + ' *',
                  controller: store.repeatPasswordController,
                  textInputAction: TextInputAction.next,
                  hintText: FlutterI18n.translate(context, "hint_password"),
                  onChanged: (text) => null,
                ),
                SizedBox(height: marginSide),
                Observer(builder: (_) {
                  return store.loading
                      ? AppProgress()
                      : AppButton(
                          padding: EdgeInsets.all(16),
                          text:
                              FlutterI18n.translate(context, "create_account"),
                          onPressed: () => store.createAccount(context));
                }),
              ])))),
    );
  }
}
