import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String dscrbthen;
  final String text;
  final IconData Iconss;
  const Cards({super.key, required this.dscrbthen, required this.text, required this.Iconss, });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xfff3e9dd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xffc7b8a1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                   text,
                    style: TextStyle(
                      color: Color(0xff5a4633), // بني غامق
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    dscrbthen,
                    style: TextStyle(
                      color: Color(0xff806e5a), // بني وسط
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Container(
              width: 100,
              height: 50,
              color: Colors.brown,
              child: Icon(Iconss,color: Colors.white,),
            )

          ],
        ),
      ),
    );
  }
}
