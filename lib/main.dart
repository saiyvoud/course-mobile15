import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/components/hive_database.dart';
import 'package:shopgood/components/messageHepler.dart';
import 'package:shopgood/provider/auth_provider.dart';
import 'package:shopgood/provider/banner_provider.dart';
import 'package:shopgood/provider/cart_provider.dart';
import 'package:shopgood/provider/product_provider.dart';
import 'package:shopgood/router/route.dart';
import 'package:shopgood/view/auth/login.dart';
import 'package:shopgood/provider/category_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopgood/view/auth/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await HiveDatabase().hiveDatabase();
  await EasyLocalization.ensureInitialized();
  await Hive.openBox<Map>('cart');
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('lo', 'LA'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    saveLocale: true,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider()..getProfile(),
        ),
        ChangeNotifierProvider(
          create: (_) => CateogryProvider()..getCategory(),
        ),
        ChangeNotifierProvider(
          create: (_) => BannerProvider()..getAllBanner(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..getProductAll(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MyApp(),
    ),
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
    );
  }
}
