import 'package:flutter/material.dart';
import 'package:flutter_demo_app/services/localisation/app_translations.dart';
import 'package:flutter_demo_app/services/localisation/app_translations_delegate.dart';
import 'package:flutter_demo_app/services/ui/login/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppTranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('hi', ''),
        const Locale('ja', '')
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(title: 'Flutter Demo Home Page'),
    );
  }
}
