import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded,size: 30,color: Colors.blue,),
          SizedBox(height: 20,),
          Text('search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.blue),)
        ],
      ),
    );
  }
}
