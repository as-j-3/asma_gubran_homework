import 'package:final_test/share.dart';
import 'package:final_test/single.dart';
import 'package:final_test/textf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarstHome()
    );
  }
}

class FarstHome extends StatefulWidget {
  const FarstHome({super.key});

  @override
  State<FarstHome> createState() => _FarstHomeState();
}

class _FarstHomeState extends State<FarstHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => image()),
                );                },
                  child:Text( 'image')
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Share()),
                );                },
                  child:Text( 'Share')
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileApp()),
                );                },
                  child:Text( 'TextField')
              )
            ],
          ),
        ),
      ),
    );
  }
}

