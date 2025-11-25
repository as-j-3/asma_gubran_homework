import 'package:path_provider/path_provider.dart';
import 'dart:io';

class UsersStorage {
  File? _usersFile;

  Future<void> init() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    _usersFile = File('${appDocumentsDir.path}/users.txt');
    if (!await _usersFile!.exists()) {
      await _usersFile!.create();
    }
  }

  Future<void> saveUser(String username, String password) async {
    if (_usersFile == null) await init();
    final String line = '$username,$password';
    await _usersFile!.writeAsString(line);
  }

  Future<Map<String, String>?> readUser() async {
    if (_usersFile == null) await init();
    final String content = await _usersFile!.readAsString();
    if (content.trim().isEmpty) return null;

    final List<String> parts = content.split(',');
    if (parts.length < 2) return null;

    return {
      'username': parts[0].trim(),
      'password': parts[1].trim(),
    };
  }
  
}
