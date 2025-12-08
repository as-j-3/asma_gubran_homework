import 'package:flutter/material.dart';
import 'users_storage.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UsersStorage _storage = UsersStorage();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('log in')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("مرحباً — سجل دخولك",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // USERNAME
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'اسم المستخدم',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 12),

            // PASSWORD
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text.trim();
                final password = _passwordController.text.trim();

                final stored = await _storage.readUser();

                if (username == stored!["username"] &&
                    password == stored["password"]) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> HomePage(displayName: username),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(48),
              ),
              child: Text("تسجيل الدخول"),
            ),


            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()),
                );
              },
              child: Text("ليس لديك حساب؟ — إنشاء حساب"),
            )
          ],
        ),
      ),
    );
  }
}
