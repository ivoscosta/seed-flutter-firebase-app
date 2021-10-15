import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app/modules/profile/pages/edit_profile/edit_profile_store.dart';
import 'package:seed_flutter_app/core/theme/dimensions.dart';
import 'package:seed_flutter_app/core/widgets/app_button_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_progress_widget.dart';
import 'package:seed_flutter_app/core/widgets/app_text_field_widget.dart';
import 'package:seed_flutter_app/core/widgets/global_app_bar.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  const EditProfilePage({Key? key, this.title = 'EditProfilePage'})
      : super(key: key);
  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  EditProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: FlutterI18n.translate(context, "edit_profile"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: marginSide),
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                SizedBox(height: marginSide),
                AppTextField(
                  titleText: FlutterI18n.translate(context, "name"),
                  controller: store.nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  hintText: FlutterI18n.translate(context, "hint_name"),
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 8),
                Observer(builder: (_) {
                  return store.loading
                      ? AppProgress()
                      : Column(
                          children: [
                            AppButton(
                              padding: EdgeInsets.all(16),
                              text: FlutterI18n.translate(context, "save"),
                              onPressed: () => store.save(context),
                            )
                          ],
                        );
                }),
                SizedBox(height: marginSection),
              ])))),
    );
  }
}
