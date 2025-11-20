import 'package:flutter/material.dart';

import 'new_page.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController=TextEditingController();
    return  Scaffold(

      appBar: AppBar(
        title: Text('Textfild'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'images/e.jpg',
                  ), // تأكد من وجود الصورة في المسار الصحيح
                ),
              ),
            ),
            Text('Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  hintText: 'Enter your name ',
                  label: Icon(Icons.person),
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  filled: true
              ),

            ),
            SizedBox(height: 20,),
            Text('Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  hintText: 'Enter your name ',
                  label: Icon(Icons.person),
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  filled: true
              ),

            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => NewPage(data: _textEditingController.text),));
                },
                child: Text(
                  'Enter Her',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 2
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
