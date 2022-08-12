import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'app_model.dart';


GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppModel>(AppModel(), signalsReady: true);

  runApp(const App());
}