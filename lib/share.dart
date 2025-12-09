import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Share extends StatefulWidget {
  const Share({super.key});

  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {
  TextEditingController textEditingController1=TextEditingController();
  TextEditingController textEditingController2=TextEditingController();

  Future save() async {
    final p = await SharedPreferences.getInstance();
    await p.setString('txt1', textEditingController1.text.trim());
    textEditingController1.clear();
  }
  Future get() async {
    final p = await SharedPreferences.getInstance();
    final txt1 = await p.getString('txt1');
    textEditingController2.text = txt1!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'share prefercnec', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController1,
                decoration: InputDecoration(
                    labelText: 'الحقل الاول',

                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: () {
               save();
              }, child: Text('تخزين')),
              SizedBox(height: 20,),
              TextField(
                enabled: false,
                controller: textEditingController2,
                decoration: InputDecoration(
                    labelText: 'الحقل الثاني ',
                    )
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                get();
              }, child: Text('جلب'))
            ],
          ),
        ),
    );
  }
}
