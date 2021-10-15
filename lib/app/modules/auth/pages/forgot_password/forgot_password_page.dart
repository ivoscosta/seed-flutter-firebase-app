import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_flutter_app/app/modules/auth/pages/forgot_password/forgot_password_store.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';
import 'package:seed_flutter_app/core/widgets/app_button_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_widget.dart';
import 'package:seed_flutter_app/core/widgets/global_app_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  const ForgotPasswordPage({Key? key, this.title = 'ForgotPasswordPage'})
      : super(key: key);
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordStore store = Modular.get();

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
                  FlutterI18n.translate(context, "forgot_password"),
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
                AppButton(
                  padding: EdgeInsets.all(16),
                  text: FlutterI18n.translate(context, "recovery_password"),
                  onPressed: () {
                    store.recoveryPassword(context);
                  },
                ),
              ])))),
    );
  }
}
