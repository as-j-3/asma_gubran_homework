import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings_outlined,size: 30,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('settings',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.blue),)
        ],
      ),
    );
  }
}
