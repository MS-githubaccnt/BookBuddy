import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          backgroundColor:Colors.blue,
          title:Text("Book Buddy",
          style: TextStyle(
            color:Colors.white
          ),),
          centerTitle: true,
          //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          ),
          body:Center(
          child:Text("Hi")
        )
        
      )
      );
  }
}
