import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/components/hive_database.dart';
import 'package:shopgood/components/messageHepler.dart';
import 'package:shopgood/provider/auth_provider.dart';
import 'package:shopgood/provider/banner_provider.dart';
import 'package:shopgood/router/route.dart';
import 'package:shopgood/view/auth/login.dart';
import 'package:shopgood/provider/category_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopgood/view/auth/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveDatabase().hiveDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CateogryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BannerProvider()..getAllBanner(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "NotoSansLao"),
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteAPI.generateRoutes,
      scaffoldMessengerKey: MessageHepler.key,
      home: SplashScreen(),
    );
  }
}
