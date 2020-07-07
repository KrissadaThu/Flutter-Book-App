import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_rest_api/restApi/Entity/Book.dart';
import 'package:oop_rest_api/restApi/Repository/API.dart';

class addBook extends StatefulWidget {
  @override
  _addBook createState() => _addBook();
}

class _addBook extends State<addBook> {

  final txt_name = TextEditingController();
  final txt_descrip = TextEditingController();
  final txt_price = TextEditingController();
  final txt_url = TextEditingController();

// method post API to DB
  addItem()
  {
    var book = BookEntityAdd(txt_name.text, txt_price.text, txt_descrip.text, txt_url.text);
    getApi.addItem(book).then((res)=>{
      //show message successful post api
      print(res.body)
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home: Scaffold
      (
        body: Container(
        child: Row(
      children: <Widget>[
        //row clip card show detial
        Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              color: Color(0xFF231C1F),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60.0),
                  bottomRight: Radius.circular(50.0))),
          width: MediaQuery.of(context).size.width * 0.23,
          child: SingleChildScrollView
          (
            scrollDirection: Axis.vertical,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //back screen
              SizedBox(height: 38.0,),
              IconButton(icon: Icon(Icons.arrow_back , color: Colors.white,),
              onPressed: ()=> Navigator.pop(context),),
              //Item clip card show detail
              filterChipWidget("ID", Color(0xFFFFF2E4), Colors.orangeAccent),
              filterChipWidget("Book", Color(0xFFBCFFCD), Colors.green),
              filterChipWidget("descr", Color(0xFFFCE1F2), Colors.pinkAccent),
              filterChipWidget("Price", Color(0xFFF2DDFF), Colors.purple),
              filterChipWidget("URL", Color(0xFFFCD7AD), Color(0xFFA57548))
            ],
          ),
          )
        ),
        //
        SizedBox(
          width: 4.1,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 0.760,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(140.0),
              )),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: //
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //
                  SizedBox(height: 66.0,),
                  Container
                  (
                    height: 85.0,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration
                    (
                      color: Color(0xFFBCFFCD),
                      borderRadius: BorderRadius.only
                      (
                        topLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: AutoSizeText("Add new your Book to App",style: TextStyle
                      (
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.green
                      ),)),
                    ),
                  ),
                   SizedBox(height: 67.0,),
                  //conatiner text view
                  Container(
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: 300.0,
                    child: Card(
                      elevation: 22.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only
                          (
                            topLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0)
                          )
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //
                          //name
                          Container(
                            width: 260.0,
                            height: 50.0,
                            child: TextField(
                              controller: txt_name,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  contentPadding: EdgeInsets.all(2.0),
                                  icon: Icon(
                                    Icons.book,
                                    color: Colors.black,
                                  )),
                              cursorWidth: 1.0,
                              showCursor: true,
                            ),
                          ),
                          //
                          //description
                          Container(
                            width: 260.0,
                            height: 50.0,
                            child: TextField(
                              controller: txt_descrip,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  contentPadding: EdgeInsets.all(2.0),
                                  icon: Icon(
                                    Icons.description,
                                    color: Colors.black,
                                  )),
                              cursorWidth: 1.0,
                              showCursor: true,
                            ),
                          ),
                          //
                          //price
                          Container(
                            width: 260.0,
                            height: 50.0,
                            child: TextField(
                              controller: txt_price,
                              decoration: InputDecoration(
                                  hintText: "Price",
                                  contentPadding: EdgeInsets.all(2.0),
                                  icon: Icon(
                                    Icons.memory,
                                    color: Colors.black,
                                  )),
                              cursorWidth: 1.0,
                              showCursor: true,
                            ),
                          ),
                          //
                          //image url
                          Container(
                            width: 260.0,
                            height: 50.0,
                            child: TextField(
                              controller: txt_url,
                              decoration: InputDecoration(
                                  hintText: "URl",
                                  contentPadding: EdgeInsets.all(2.0),
                                  icon: Icon(
                                    Icons.broken_image,
                                    color: Colors.black,
                                  )),
                              cursorWidth: 1.0,
                              showCursor: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  SizedBox(height: 60.0,),
                  //container bottom action
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      alignment: Alignment.bottomCenter,
                      height: 220.0,
                     child: Stack
                     (
                       children: <Widget>[
                         //
                         Positioned(
                           child: Container
                           (
                             height: MediaQuery.of(context).size.height * 0.13,
                             width: MediaQuery.of(context).size.width * 0.8,
                             decoration: BoxDecoration
                             (
                               color: Colors.white,
                               borderRadius: BorderRadius.only
                               (
                                 topLeft: Radius.circular(55.0)
                               )
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row
                               (
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: <Widget>[
                                   AutoSizeText("  Save State New Book",
                                   style: TextStyle
                                   (
                                     fontSize: 20.0,
                                     color: Colors.black54,
                                     fontWeight: FontWeight.w700
                                   ),),
                                   FloatingActionButton(
                                 child: Icon(Icons.add , color: Colors.white,),
                                 onPressed: ()=> addItem(),
                               ),
                                 ],
                               )
                             )
                           ),
                         ),
                         //
                         //content action button
                         
                       ],
                     ),
                    ),
                  )
                  //
                ],
              )),
        ),
        //
      ],
    )),
      ),
    );
  }
}

var _isSelected = false;

Padding filterChipWidget(String name, Color color, Color textColor) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: ChoiceChip(
      shadowColor: color,
      label: Text(
        "${name}",
        style: TextStyle(color: textColor),
      ),
      selected: _isSelected,
      labelStyle: TextStyle(
        fontSize: 14.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      focusNode: FocusNode(),
      backgroundColor: color,
      onSelected: (isSelected) {
        _isSelected = isSelected;
      },
      selectedColor: Colors.lightBlueAccent,
    ),
  );
}
