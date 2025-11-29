import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String dscrbthen;
  final String text;
  final IconData Iconss;

  const Cards({
    super.key,
    required this.dscrbthen,
    required this.text,
    required this.Iconss,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xfff3e9dd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // قلت الـ radius كما طلبت
        side: const BorderSide(color: Color(0xffc7b8a1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // النصوص داخل ListTile لكن داخل Expanded حتى لا يكسر الـ Row
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff5a4633),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  dscrbthen,
                  style: const TextStyle(
                    color: Color(0xff806e5a),
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // الصندوق اللي يحمل الايقونة — على اليسار
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(6), // رادياس أقل كما طلبت
              ),
              child: Icon(
                Iconss,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
