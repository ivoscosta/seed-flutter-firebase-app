import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app/modules/home/pages/menu_store.dart';
import 'package:seed_flutter_app/core/utils/globals.dart';
import 'package:seed_flutter_app/core/utils/routers.dart';
import 'package:unicons/unicons.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'MenuPage'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 90.0,
              child: DrawerHeader(
                child: Text(
                  FlutterI18n.translate(context, 'menu'),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )),
          ListTile(
            leading: Icon(UniconsLine.user),
            title: Text(FlutterI18n.translate(
              context,
              currentUser != null ? 'edit_profile' : 'sign_in',
            )),
            onTap: () {
              if (currentUser != null)
                Routers.goToEditProfile(context);
              else
                Routers.goToSignIn(context);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(UniconsLine.users_alt),
            title: Text(FlutterI18n.translate(context, 'invite_friends')),
            onTap: () => {
              store.inviteFriends(context),
              Navigator.of(context).pop(),
            },
          ),
          ListTile(
            leading: Icon(UniconsLine.star),
            title: Text(FlutterI18n.translate(context, 'rate_app')),
            onTap: () => {
              store.rateApp(),
              Navigator.of(context).pop(),
            },
          ),
          ListTile(
            leading: Icon(UniconsLine.globe),
            title: Text(FlutterI18n.translate(context, 'visit_site')),
            onTap: () => {
              store.visitSite(),
              Navigator.of(context).pop(),
            },
          ),
          currentUser != null
              ? ListTile(
                  leading: Icon(UniconsLine.exit),
                  title: Text(FlutterI18n.translate(context, 'sign_out')),
                  onTap: () => {
                        store.logout(),
                        Navigator.of(context).pop(),
                      })
              : SizedBox(),
        ],
      ),
    );
  }
}
