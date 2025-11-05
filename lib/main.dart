import 'package:flutter/material.dart';

void main()
{
  runApp(App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text( 'CV',style: TextStyle(color: Colors.white54,fontSize: 40,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body:ListView(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: Image.asset('image/a1.jpg').image,
                    ),
                  ),
                  Text('Asma Gubran ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('Devloper',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.black87,
              width: double.infinity,
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('email :',style: TextStyle(fontSize: 20,color: Colors.white),),
                        Text('asmagubran4@gmail.com',style: TextStyle(fontSize: 20,color: Colors.white))

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('phon',style: TextStyle(fontSize: 20,color: Colors.white),),
                        Text('7777',style: TextStyle(fontSize: 20,color: Colors.white))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(8),
              color: Colors.black87,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('skile',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    Divider(),
                    Text('1- Developing mopile app',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('2- Good in Database',style: TextStyle(fontSize: 20,color: Colors.white),)

                  ],
                ),
              ) ,
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(8),
              color: Colors.black87,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Education',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    Divider(),
                    Text('1- Flutter Course – Al-Ifada Institute',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('2- English Diploma – Al-Najah Institute',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('3- Computer Diploma – Al-Najah Institute',style: TextStyle(fontSize: 20,color: Colors.white),)

                  ],
                ),
              ) ,
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(8),
              color: Colors.black87,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Experience (Projects / Practical Work)',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    Divider(),
                    Text('1- Restaurant Management System – C#',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('2- Training Courses Management System',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('3- Employee Management System – C+',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('4- Sweets Shop Website – CSS & HTML',style: TextStyle(fontSize: 20,color: Colors.white),),

                  ],
                ),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
