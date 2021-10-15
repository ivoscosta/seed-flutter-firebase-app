import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/sing_in/sign_in_store.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';
import 'package:seed_flutter_app/core/utils/routers.dart';
import 'package:seed_flutter_app/core/widgets/app_button_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_progress_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_password_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_widget.dart';
import 'package:seed_flutter_app/core/widgets/global_app_bar.dart';

import 'package:seed_flutter_app/core/theme/colors.dart' as colors;

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key? key, this.title = 'SigninPage'}) : super(key: key);
  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SignInPage> {
  SignInStore store = Modular.get();

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
                  FlutterI18n.translate(context, "title_login"),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: marginSide),
                AppTextField(
                  titleText: FlutterI18n.translate(context, "email"),
                  controller: store.emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  hintText: FlutterI18n.translate(context, "hint_email"),
                ),
                SizedBox(height: marginSide),
                AppTextFieldPassword(
                  titleText: FlutterI18n.translate(context, "password"),
                  controller: store.passwordController,
                  textInputAction: TextInputAction.next,
                  hintText: FlutterI18n.translate(context, "hint_password"),
                  onChanged: (text) => null,
                ),
                SizedBox(height: 8),
                AppButton(
                  style: AppButtonStyle.text,
                  textColor: colors.green,
                  onPressed: () {
                    Routers.goToForgotPassword(
                        context, store.emailController.text.trim());
                  },
                  text: FlutterI18n.translate(context, "forgot_password"),
                ),
                SizedBox(height: 8),
                Observer(builder: (_) {
                  return store.loading
                      ? AppProgress()
                      : Column(
                          children: [
                            AppButton(
                              padding: EdgeInsets.all(16),
                              text: FlutterI18n.translate(context, "sign_in"),
                              onPressed: () => store.signIn(context),
                            ),
                            SizedBox(height: 12),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 48.0,
                                child: OutlinedButton(
                                  onPressed: () =>
                                      store.signInWithGoogle(context),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            'assets/images/google_logo.png',
                                            height: 20,
                                          )),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            FlutterI18n.translate(
                                                context, "sigin_with_google"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: colors.gray,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: colors.gray)),
                                  ),
                                )),
                          ],
                        );
                }),
                SizedBox(height: marginSection),
                Divider(),
                Wrap(children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        FlutterI18n.translate(context, 'new_on_app'),
                        style: Theme.of(context).textTheme.subtitle1,
                      )),
                  AppButton(
                    style: AppButtonStyle.text,
                    textColor: colors.green,
                    onPressed: () {
                      Routers.goToSignUp(context);
                    },
                    text: FlutterI18n.translate(context, "sign_up"),
                  ),
                ]),
              ])))),
    );
  }
}
