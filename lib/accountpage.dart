import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.portrait_sharp,size: 30,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('portrait',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.blue),)
        ],
      ),
    );
  }
}
