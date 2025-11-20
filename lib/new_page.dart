import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String data;
  const NewPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: Center(
        child: Text(
          data.isEmpty ? 'No data provided' : data,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
