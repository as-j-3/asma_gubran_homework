import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task3/card.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اعضاء مشروع التخرج',style: TextStyle(color: Colors.brown,fontSize: 20),),
            SizedBox(height: 5),
            Text('(قروب خليها على الله)',style: TextStyle(color: Colors.brown[400],fontSize: 15),),
            SizedBox(height: 20),
            Cards(dscrbthen: 'تخصص تقنية معلومات مستوى رابع ', text: 'اسماء جبران',Iconss: Icons.account_box_sharp,),
            SizedBox(height: 20),
            Cards(dscrbthen: 'تخصص تقنية معلومات مستوى رابع ', text: 'هدى باعباد',Iconss: Icons.account_box_sharp,),
            SizedBox(height: 20),
            Cards(dscrbthen: 'تخصص تقنية معلومات مستوى رابع ', text: 'خلود بن مدشل ',Iconss: Icons.account_box_sharp),
            SizedBox(height: 20),
            Cards(dscrbthen: 'تخصص تقنية معلومات مستوى رابع ', text: 'اية التميمي',Iconss: Icons.account_box_sharp,),
            SizedBox(height: 20),
        
        
          ],
        ),
      ),
    );
  }
}
