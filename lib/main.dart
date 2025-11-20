import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task3/accountpage.dart';
import 'package:task3/homepage.dart';
import 'package:task3/searchpage.dart';
import 'package:task3/settingpage.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Settingpage(),
    const Searchpage(),
    const Accountpage(),
  ];

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'الصفحة الرئيسية';
      case 1:
        return 'صفحة الإعدادات';
      case 2:
        return 'صفحة البحث';
      case 3:
        return 'صفحة الحساب';
      default:
        return 'تطبيق';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(index)),
          backgroundColor: Colors.brown[700],
        ),
        body: IndexedStack(
          index: index,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.brown,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
