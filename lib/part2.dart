import 'package:flutter/material.dart';

class Part2 extends StatelessWidget {
  final int counter;
  final String titel;
  final VoidCallback onPressed;

  Part2(this.counter, this.titel, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            titel,
            style: TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            color: Colors.deepPurpleAccent,
            width: 100,
            height: 50,
            child: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: 200,
            child: MaterialButton(
              onPressed: onPressed,
              color: Colors.deepPurpleAccent,
              child: Text(
                'اضغط هنا',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}