import 'package:flutter/material.dart';
import 'package:oop_rest_api/restApi/Entity/Book.dart';

class DetialBook extends StatefulWidget
{
  final BookEntity itemBook;
  const DetialBook({Key key , this.itemBook}):super(key:key);

  @override
  _detialBook createState()=> _detialBook();
}

class _detialBook extends State<DetialBook>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home: Scaffold
      (
        body: Container(),
      ),
    );
  }
}