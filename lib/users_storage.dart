import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class UsersStorage {

  Future<void> saveUser(String username, String password) async {
    final Directory appDocumentsDir = await getTemporaryDirectory();
    File file = File('${appDocumentsDir.path}/users.txt');

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final String line = '$username,$password';
    await file.writeAsString(line);
  }


  Future<Map<String, String>?> readUser() async {
    final Directory appDocumentsDir = await getTemporaryDirectory();
    File file = File('${appDocumentsDir.path}/users.txt');

    final List<String> lines = await file.readAsLines();
    List<String>? parts;

    for (var line in lines) {
      line = line.trim();
      parts = line.split(",");
    }

    return {
      "username": parts![0].trim(),
      "password": parts![1].trim(),
    };

  }
}
