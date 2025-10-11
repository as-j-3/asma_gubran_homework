import 'package:first_exercise/part2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> counters = [0, 0, 0, 0, 0];

  void incrementCounter(int index) {
    setState(() {
      if (counters[index] < 100) {
        counters[index]++;
      }
    });
  }

  void resetAllCounters() {
    setState(() {
      counters = List.filled(counters.length, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('مسبحة'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Part2(counters[0], 'سبحان الله', () => incrementCounter(0)),
              Part2(counters[1], 'الحمد لله', () => incrementCounter(1)),
              Part2(counters[2], 'الله أكبر', () => incrementCounter(2)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: resetAllCounters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'تصفير جميع العدادات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}