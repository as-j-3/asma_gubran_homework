import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textEditingController=TextEditingController();
  TextEditingController textEditingController2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Text(' مرحبا بك في الواجب الاخير ',style: TextStyle(
               color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 20
             ),),
            const SizedBox(height: 20,),
            TextFormField(
              textAlign: TextAlign.right,
              controller: textEditingController,
              cursorColor: Colors.brown,
              decoration: InputDecoration(

                hintText: 'ادخل النص المراد تكراره',
                hintStyle: TextStyle(fontSize: 15, color: Color(0xff8391A1)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                filled: true,
                fillColor: Color(0xffF7F8F9),
                suffixIcon: Icon(Icons.precision_manufacturing),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              textAlign: TextAlign.right,
              controller: textEditingController2,
              cursorColor: Colors.brown,
              decoration: InputDecoration(
                hintText: 'سوف يعرض النص المكرر انها فقط اضغط الزر ',
                hintStyle: TextStyle(fontSize: 15, color: Color(0xff8391A1)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                filled: true,
                fillColor: Color(0xffF7F8F9),
                suffixIcon: Icon(Icons.precision_manufacturing),
              ),
            ),
        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: ()
          {
            setState(() {

            });
            textEditingController2=textEditingController;
          },

          child: Text('اضغط هنا',
            style: TextStyle(
              color:  Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(331,  56),
            backgroundColor:Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )

          ],
        ),
      ),
    );
  }
}
