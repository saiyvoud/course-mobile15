import 'package:flutter/material.dart';
import 'package:shopgood/home/home.dart';

class BottomNavigatorComponent extends StatefulWidget {
  const BottomNavigatorComponent({super.key});

  @override
  State<BottomNavigatorComponent> createState() =>
      _BottomNavigatorComponentState();
}

class _BottomNavigatorComponentState extends State<BottomNavigatorComponent> {
  List children = [
    Home(),
    Container(
      height: 500,
      decoration: BoxDecoration(color: Colors.red),
    ),
    Container(
      height: 500,
      decoration: BoxDecoration(color: Colors.blue),
    ),
  ];
  int currenWidget = 0;
  onTap(index){
    setState(() {
      currenWidget = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currenWidget],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currenWidget,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: "home",
          ),
        ],
      ),
    );
  }
}
