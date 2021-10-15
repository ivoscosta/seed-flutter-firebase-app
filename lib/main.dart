import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app_module.dart';
import 'package:seed_flutter_app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'pt',
      basePath: 'assets/i18n',
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await flutterI18nDelegate.load(Locale("en"));
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(flutterI18nDelegate),
  ));
}
