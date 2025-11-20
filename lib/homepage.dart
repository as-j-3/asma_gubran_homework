import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home,size: 30,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.blue),)
        ],
      ),
    );
  }
}
