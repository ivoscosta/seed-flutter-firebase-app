import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:seed_flutter_app/app/modules/home/pages/menu_page.dart';
import 'package:seed_flutter_app/core/utils/globals.dart';
import 'package:seed_flutter_app/core/utils/routers.dart';
import 'package:seed_flutter_app/core/widgets/app_network_image_widget.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements Disposable {
  final HomeStore store = Modular.get();
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    streamSubscription = currentUserStreamController.stream.listen((value) {
      if (value == 'USER_WITHOUT_PROFILE')
        Navigator.pushNamedAndRemoveUntil(
            context, '/profile/edit', (route) => false);
      else
        setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Routers.goToSearch(context);
            },
            icon: Icon(UniconsLine.search),
          ),
          currentUser != null
              ? InkWell(
                  onTap: () {
                    Routers.goToEditProfile(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: AppNetworkImage(
                        imageUrl: currentUser!.avatarUrl,
                        width: 25,
                        isUserPhoto: true,
                        borderRadius: BorderRadius.circular(12),
                      )))
              : SizedBox(),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    print("deu dispose!!!");
    super.dispose();
  }
}
