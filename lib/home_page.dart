import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String displayName;

  const HomePage({Key? key, required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الرئيسية'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 44,
              child: Text(
                displayName[0].toUpperCase(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 18),
            Text('مرحباً،', style: TextStyle(fontSize: 20)),
            SizedBox(height: 6),

            Text(
              displayName,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => LoginPage()),

                );
              },
              child: Text('تسجيل الخروج'),
            ),
          ],
        ),
      ),
    );
  }
}
