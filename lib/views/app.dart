import 'package:agendamentos/configurations/get/middle_ware.dart';
import 'package:agendamentos/configurations/get/router.dart';
import 'package:flutter/material.dart';
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
      navigatorObservers: [
        GetObserver(MiddleWare.observer),
      ],
      onGenerateRoute: Router.generateRoute,
    );
  }
}