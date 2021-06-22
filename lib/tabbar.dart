import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label:"Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label:"Account"),
      ],
    );
  }
}