import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    Timer(Duration(seconds: 1), () {
      Provider.of<AuthProvider>(
        context,
        listen: false,
      )..validateToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(120),
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
