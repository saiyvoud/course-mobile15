
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shopgood/components/productComponent.dart';
import 'package:shopgood/generated/locale_keys.g.dart';
import 'package:shopgood/provider/auth_provider.dart';

import 'package:shopgood/view/home/widget/banner_widget.dart';
import 'package:shopgood/view/home/widget/category_widget.dart';
import 'package:shopgood/view/home/widget/search_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> banner = [
    "assets/images/banner01.jpg",
    "assets/images/banner02.jpg",
    "assets/images/banner03.jpg",
  ];
  int currenIndex = 0;
  onTap(_index) {
    setState(() {
      currenIndex = _index;
    });
  }

  Future<void> changelanguage() async {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('lo', 'LA'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Icon(Icons.menu),
        title: Text(
          LocaleKeys.home.tr(),
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              changelanguage();
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                authProvider.exitApp();
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchButton(),
            BannerWidget(),
            CategoryWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.product.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.category),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("ທັງໝົດ"),
                  ),
                ],
              ),
            ),
            ProductComponent(),
          ],
        ),
      ),
    );
  }
}
