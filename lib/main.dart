import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_rest_api/restApi/BookPage.dart';
import 'package:oop_rest_api/crud/Book.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      theme: ThemeData(
        brightness: Brightness.light
        //
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: Scaffold(
        //5654FF
        body: Book(),
        //bottomNavigationBar: _makeNavigation(context),
      ),
    );
  }
}



Container _makeNavigation(BuildContext context)
{
  return Container(
  height: 55.0,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0)
    )
  ),
  child: Row
  (
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      IconButton(icon: Icon(Icons.home , color: Colors.amberAccent),
      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Book()))
      ),
      Icon(Icons.dashboard , color: Colors.amberAccent),
      Icon(Icons.history , color: Colors.amberAccent),
     
       
    ],
  ),
);
}