import 'package:flutter/material.dart';

import '../../forgot_pass/page/forgot_pass_page.dart';
import '../../home/page/home_page.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 4;

  final _pages = const [
    ForgotPassPage(),
    ForgotPassPage(),
    ForgotPassPage(),
    ForgotPassPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.menu,size: 35),
            label: 'Danh mục',
          ),
          NavigationDestination(
            icon: Icon(Icons.date_range_rounded,size: 35),
            label: 'Bảng công',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined,size: 35),
            label: 'Tạo mới',
          ),
          NavigationDestination(
            icon: Icon(Icons.paid_outlined,size: 35),
            label: 'Bảng lương',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline,size: 35),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
