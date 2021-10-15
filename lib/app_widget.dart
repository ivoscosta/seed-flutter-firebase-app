import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seed_flutter_app/app_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seed_flutter_app/core/theme/app_theme.dart';

class AppWidget extends StatefulWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  AppWidget(this.flutterI18nDelegate);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppController controller = Modular.get();

  @override
  void initState() {
    super.initState();

    controller.setSystemStyle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        widget.flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: AppTheme.defaultTheme(),
    ).modular();
  }
}
