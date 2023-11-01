import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeClientNavBar extends StatelessWidget {

  final StatefulNavigationShell navigationShell;
  final Function(int) onTap;

  HomeClientNavBar({required this.navigationShell, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Store'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (int index) => onTap(index),
    );
  }
}
