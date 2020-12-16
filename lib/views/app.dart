import 'package:agendamentos/configurations/get/middle_ware.dart';
import 'package:agendamentos/configurations/get/router.dart' as configurationsGet;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialRoute: "/",
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      navigatorObservers: [
        GetObserver(MiddleWare.observer),
      ],
      onGenerateRoute: configurationsGet.Router.generateRoute,
    );
  }
}