import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yousafe/app/app.dart';

//Raze - Rapido antizone emergency
//Flee - Fast local emergency
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const YouSafeApp());
}
