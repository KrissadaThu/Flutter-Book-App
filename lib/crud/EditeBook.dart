import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_rest_api/restApi/Entity/Book.dart';
import 'package:oop_rest_api/restApi/Repository/API.dart';

class EditBook extends StatefulWidget {
  final BookEntity itemBook;
  const EditBook({Key key, this.itemBook}) : super(key: key);

  @override
  _editBook createState() => _editBook();
}

class _editBook extends State<EditBook> {
  @override

  final txt_id = TextEditingController();
  final txt_name = TextEditingController();
  final txt_descrip = TextEditingController();
  final txt_price = TextEditingController();
  final txt_url = TextEditingController();

  updateBook(){
    BookEntity book = BookEntity(int.parse(txt_id.text.toString()), txt_name.text.toString(), txt_price.text.toString(), txt_descrip.text.toString(), txt_url.text.toString());
    getApi.editBook(book).then((responce){
      setState(() {
       print(responce.body);
       Navigator.pop(context);
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container
        (
        //
          child: SingleChildScrollView
          (
            scrollDirection: Axis.vertical,
            child: Stack
            (
              children: <Widget>[

                //container edit item book
                Positioned(child: Container
                (
                  height: MediaQuery.of(context).size.height * 1.1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration
                  (
                    color: Color(0xFF1A0911)
                  ),
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 300.0,),
                      //text id
                     Container(
                       width: MediaQuery.of(context).size.width * 0.7,
                       height: 50.0,
                       child: TextFormField
                       (
                         controller: txt_id,
                         cursorColor: Colors.grey,
                         focusNode: FocusNode(),
                         decoration: InputDecoration
                         (
                           labelText: "ID:${widget.itemBook.id}",
                           fillColor: Colors.white,
                           border: OutlineInputBorder
                           (
                             borderRadius: BorderRadius.circular(16.0),
                             borderSide: BorderSide()
                           )
                         ),
                       ),
                     ),
                     SizedBox(height: 10.0,),
                      //text name
                     Container(
                       width: MediaQuery.of(context).size.width * 0.7,
                       height: 50.0,
                       child: TextFormField
                       (
                         controller: txt_name,
                         cursorColor: Colors.grey,
                         focusNode: FocusNode(),
                         decoration: InputDecoration
                         (
                           labelText: "Name:${widget.itemBook.bookName}",
                           fillColor: Colors.white,
                           border: OutlineInputBorder
                           (
                             borderRadius: BorderRadius.circular(16.0),
                             borderSide: BorderSide()
                           )
                         ),
                       ),
                     ),
                     //
                      SizedBox(height: 10.0,),
                      //text descrip
                     Container(
                       width: MediaQuery.of(context).size.width * 0.7,
                       height: 50.0,
                       //
                       child: TextFormField
                       (
                         controller: txt_descrip,
                         cursorColor: Colors.grey,
                         focusNode: FocusNode(),
                         decoration: InputDecoration
                         (
                           labelText: "description:${widget.itemBook.description}",
                           fillColor: Colors.white,
                           border: OutlineInputBorder
                           (
                             borderRadius: BorderRadius.circular(16.0),
                             borderSide: BorderSide()
                           )
                         ),
                       ),
                     ),
                     //
                      SizedBox(height: 10.0,),
                      //text price
                     Container(
                       width: MediaQuery.of(context).size.width * 0.7,
                       height: 50.0,
                       child: TextFormField
                       (
                         controller: txt_price,
                         cursorColor: Colors.grey,
                         focusNode: FocusNode(),
                         decoration: InputDecoration
                         (
                           labelText: "price:${widget.itemBook.price}",
                           fillColor: Colors.white,
                           border: OutlineInputBorder
                           (
                             borderRadius: BorderRadius.circular(16.0),
                             borderSide: BorderSide()
                           )
                         ),
                       ),
                     ),
                     SizedBox(height: 12.0,),
                     //
                     //images view
                     Padding(
                       padding: const EdgeInsets.only(
                         top: 12.0,
                         left: 21.0,
                         right: 21.0
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Container
                           (
                             height: 150.0,
                             width: 150.0,
                             decoration: BoxDecoration
                             (
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(25.0))
                             ),
                             child: ClipRRect
                             (
                               borderRadius: BorderRadius.circular(25.0),
                               child: Image.network("${widget.itemBook.url}",width: double.maxFinite ,height: double.maxFinite , fit: BoxFit.cover,),
                             ),
                           ),
                           //
                           SizedBox(width: 3.0,),
                           Container(
                         width: 140.0,
                         height: 41.0,
                         child: TextFormField
                         (
                           controller: txt_url,
                           cursorColor: Colors.grey,
                           focusNode: FocusNode(),
                           decoration: InputDecoration
                           (
                             labelText: "url:${widget.itemBook.url}",
                             fillColor: Colors.white,
                             border: OutlineInputBorder
                             (
                               borderRadius: BorderRadius.circular(16.0),
                               borderSide: BorderSide()
                             )
                           ),
                         ),
                       ),
                         ],
                       ),
                     ),
                     //button
                    Align
                    (
                      alignment: Alignment.bottomRight,
                      child:  FloatingActionButton(
                        backgroundColor: Colors.white,
                       child: Icon(Icons.edit),
                       onPressed: (){
                         setState(() {
                           updateBook();
                         });
                       },
                     ),
                    )
                    ],
                  ),
                )),
                // layout position 2
                //title content
                Positioned(child: Container
                (
                  height: 140.0 * 2,
                  decoration: BoxDecoration
                  (
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF8CEEC) ,Color(0xFFA88BEB)]
                  ),
                    borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(80.0)
                    )
                  ),
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 100.0,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center
                        (
                          child: AutoSizeText
                          ("You Updating Books Product in Order List Not want update back",
                          style: TextStyle(fontSize: 22.0  ,color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                )),
                //
                //app bar title
                Positioned(child: Container
                (
                  height: 140,
                  decoration: BoxDecoration
                  (
                    color: Colors.white,
                    borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(80.0)
                    )
                  ),
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          left: 16.0,
                          right: 16.0
                        ),
                        child: Row
                    (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                           IconButton(
                             icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black38,
                        size: 35,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                           ),
                    Icon(
                        Icons.fiber_manual_record,
                        color: Colors.greenAccent,
                        size: 35,
                    )
                        ],
                    ),
                      ),
                 //
                      //text title form
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Edit Books",style: TextStyle(fontSize: 22.0 , fontWeight: FontWeight.w700 ,color: Colors.black),),
                      )
                    ],
                  )
                ))
                //
              ],
            ),
          ),
        )
    )
    );
  }
}
