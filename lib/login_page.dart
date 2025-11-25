import 'package:flutter/material.dart';
import 'main.dart';
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
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initStorageAndLoad();
  }

  Future<void> _initStorageAndLoad() async {
    await _storage.init();
    final stored = await _storage.readUser();
    setState(() => _loading = false);
  }

  void _showMsg(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _tryLogin() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showMsg('الرجاء تعبئة اسم المستخدم وكلمة المرور');
      return;
    }

    final stored = await _storage.readUser();
    if (stored == null) {
      _showMsg('لا يوجد مستخدم مسجل. أنشئ حساب أولاً.');
      return;
    }

    if (username == stored['username'] && password == stored['password']) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomePage(displayName: username),
        ),
      );
    } else {
      _showMsg('اسم المستخدم أو كلمة المرور غير صحيحة');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text('تسجيل الدخول')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('مرحباً — سجل دخولك',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'اسم المستخدم',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 12),
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
              onPressed: _tryLogin,
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
              child: Text('تسجيل الدخول'),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RegisterPage()));
              },
              child: Text('ليس لديك حساب؟ — إنشاء حساب'),
            ),
          ],
        ),
      ),
    );
  }
}
