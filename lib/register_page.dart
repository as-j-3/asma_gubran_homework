import 'package:flutter/material.dart';
import 'users_storage.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UsersStorage _storage = UsersStorage();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إنشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'إنشاء حساب جديد',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 18),

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

            SizedBox(height: 12),


            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text.trim();
                final password = _passwordController.text.trim();


                await _storage.saveUser(username, password);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomePage(displayName: username),
                  )
                );


              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(48),
              ),
              child: Text('إنشاء الحساب'),
            ),
          ],
        ),
      ),
    );
  }
}
