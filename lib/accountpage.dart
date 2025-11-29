import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Cards(dscrbthen: 'معلومات الملف ', text: 'الملف الشخصي ', Iconss:Icons.person_outline)

        ],
      ),
    );
  }
}
