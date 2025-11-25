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
  final TextEditingController _confirmController = TextEditingController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initStorage();
  }

  Future<void> _initStorage() async {
    await _storage.init();
    setState(() => _loading = false);
  }

  void _showMsg(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _register() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirm = _confirmController.text.trim();

    if (username.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showMsg('يرجى تعبئة جميع الحقول');
      return;
    }
    if (password != confirm) {
      _showMsg('كلمتا المرور غير متطابقتين');
      return;
    }

    await _storage.saveUser(username, password);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomePage(displayName: username)),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text('إنشاء حساب')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('إنشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('إنشاء حساب جديد',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 18),

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

            SizedBox(height: 12),
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'تأكيد كلمة المرور',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 18),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
              child: Text('إنشاء الحساب'),
            ),
          ],
        ),
      ),
    );
  }
}
