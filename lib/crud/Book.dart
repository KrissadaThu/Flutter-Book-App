import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oop_rest_api/crud/EditeBook.dart';
import 'package:oop_rest_api/crud/addBook.dart';
import 'package:oop_rest_api/restApi/Entity/Book.dart';
import 'package:oop_rest_api/restApi/Repository/API.dart';
import 'package:oop_rest_api/restApi/Repository/detialBook.dart';

class Book extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Book> {
  var book = List<BookEntity>();

  _getData() {
    getApi.getFech().then((response) {
      setState(() {
          
        Iterable listData = json.decode(response.body);
        book = listData.map((model) => BookEntity.fromJson(model)).toList();
          print("refresh");
      });
    });
  }

  _removeItem(int id) {
    getApi.removeBook(id).then((responce) {
      print(responce.body);
    });
  }

 _refreshBookApi() async {
    Completer completer = new Completer();
    completer.complete();
    return  _getData();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // app bar
          Container(
            height: 133,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Color(0xFFFF6051)),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 35,
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
          //
          //title book
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Book Programing Edit",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          //clip
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  spacing: 0.5,
                  runSpacing: 3.0,
                  children: <Widget>[
                    filterChipWidget("Edit", Color(0xFFFF7554), Colors.white),
                    filterChipWidget(
                        "Selected", Color(0xFFFFF2E4), Colors.orangeAccent),
                    filterChipWidget(
                        "Removed", Color(0xFFFCE1F2), Colors.pinkAccent),
                  ],
                ),
              ],
            ),
          ),

          //
          //List Item book detail
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: RefreshIndicator(child: ListView.builder
            (
              scrollDirection: Axis.vertical,
              itemCount: book.length,
              itemBuilder: (context, i) => Container(
                height: 190.0,
                child: Card(
                    elevation: 10,
                    color: Colors.blue,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      children: <Widget>[
                        // image ietm
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              '${book[i].url}',
                              width: double.maxFinite,
                              height: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //

                        //
                        Container(
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  // item name and price
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${book[i].bookName}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 23.0,
                                      ),
                                      Text(
                                        "${book[i].price}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  // content book
                                  Container(
                                    height: 60.0,
                                    child: AutoSizeText(
                                      "${book[i].description}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  //
                                  Expanded(
                                      child: Align(
                                    alignment: FractionalOffset.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 0.0, left: 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          IconButton(
                                              autofocus: true,
                                              icon: Icon(
                                                Icons.library_books,
                                                size: 32.0,
                                                color: Colors.white,
                                              ),
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetialBook(
                                                            itemBook: book[i],
                                                          )))),
                                          IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                size: 32.0,
                                                color: Colors.white,
                                              ),
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditBook(
                                                            itemBook: book[i],
                                                          )))),
                                          IconButton(
                                              icon: Icon(
                                                Icons.remove_circle,
                                                size: 32.0,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _removeItem(int.parse(
                                                      book[i].id.toString()));
                                                });
                                              }),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              size: 32.0,
                                              color: Colors.white,
                                            ),
                                            //
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        addBook())),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )
            , onRefresh: ()=> _refreshBookApi()
            )
            // refresh get api
          ))
        ],
      ),
    );
  }
}

var _isSelected = false;

Padding filterChipWidget(String name, Color color, Color textColor) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ChoiceChip(
      shadowColor: color,
      label: Text(
        "${name}",
        style: TextStyle(color: textColor),
      ),
      selected: _isSelected,
      labelStyle: TextStyle(
        fontSize: 22.0,
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
