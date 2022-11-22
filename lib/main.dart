import 'package:applovin_ads_demo/home.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

bool isInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map? sdkConfiguration = await AppLovinMAX.initialize("SDK key");
  // if (sdkConfiguration != null) {
  //   isInitialized = true;
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
