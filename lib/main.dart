import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/views/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.initInjection();
  runApp(App());
}

