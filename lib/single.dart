import 'package:flutter/material.dart';

class image extends StatelessWidget {
  const image({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'image', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
              SizedBox(height: 5,),
              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
              SizedBox(height: 5,),
              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
              SizedBox(height: 5,),

              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
              SizedBox(height: 5,),
              Carrd(
                title: "iPhone 15 Pro Max",
                subtitle: "Apple",
                dscrbtion: " بطارية قوية وأداء ممتاز.",
                image: "images/iphone15promax.png",
              ),
            ],
          ),
          
        )
      ),
    );
  }
}

class Carrd extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dscrbtion;
  final String image;
  const Carrd({super.key, required this.title, required this.subtitle, required this.dscrbtion, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(child: Image.asset(image,width: 100,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                SizedBox(height: 5,),
                Text(subtitle),
                SizedBox(height: 5,),
                Text(dscrbtion)
              ],
            )
          ],
        ),
      ),
    );
  }
}
