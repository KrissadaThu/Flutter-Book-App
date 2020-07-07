import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oop_rest_api/restApi/Entity/Book.dart';
import 'package:oop_rest_api/restApi/Repository/API.dart';

class BookPage extends StatefulWidget {
  @override
  createState() => HomePage();
}

class HomePage extends State<BookPage> {
  // book list data class
  var book = List<BookEntity>();

  ///method get data from url add to class book data
  getData() {
    getApi.getFech().then((response) {
      setState(() {
        Iterable listData = json.decode(response.body);
        book = listData.map((model) => BookEntity.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    // getData();
  }

  @override
  void dispose() {
    super.dispose();
    //getData();
  }

  var item = new List<String>.generate(20, (i) => "Item: ${++i}");
  //
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView
    (
      scrollDirection: Axis.vertical,
      child: Container(
      color: Colors.black87,
      height: MediaQuery.of(context).size.height * 1.0,
      child: Column(
        children: <Widget>[
          //app bar
          SizedBox(
            height: 38.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          // text title
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Books",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                )
              ],
            ),
          ),

          //list fech data from api server
          // SizedBox(
          //   height: 62.0,
          // ),
         Container(
           
              height: mediaQuery.size.height * 0.5,
              width: mediaQuery.size.width * 0.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                           height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            
                            children: <Widget>[
                              //image
                              Container(
                                child: ClipRRect(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22.0),
                                      topRight: Radius.circular(22.0)),
                                  child: Image.network(
                                    "https://cdn.syncfusion.com/content/images/downloads/ebooks/oop-succinctly.png",
                                    height: 220,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              //
                            

                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                  right: 12.0
                                ),
                                child: AutoSizeText(
                                    "Java Book Learn Programing in the basic up to advance Java",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0)),
                              ),
                              //action button

                             
                              //Divider(thickness: 0.5 ,height: 1.0, color: Colors.black,),
                            Expanded(child:  Align(
                               alignment: FractionalOffset.bottomCenter,
                               child: Padding(padding: EdgeInsets.only(bottom: 4.0 , left: 0.0 ) ,child:Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      IconButton(autofocus: true, icon: Icon(Icons.library_books ,size: 32.0,color: Colors.white,), onPressed: null),
                                      IconButton(icon: Icon(Icons.edit ,size: 32.0,color: Colors.white,), onPressed: null),
                                      IconButton(icon: Icon(Icons.remove ,size: 32.0,color: Colors.white,), onPressed: null),
                                      IconButton(icon: Icon(Icons.add ,size: 32.0,color: Colors.white,), onPressed: null)
                                     
                                    ],
                                  ),),
                             ))


                             
                            ],
                          ),
                        ),
                      )
                      )
                      ),
         
        ],
      ),
    ),
    );
  }
}
