 import 'package:http/http.dart' as http;
import 'package:oop_rest_api/restApi/Entity/Book.dart';
import 'dart:convert';

const baseUrl = "http://ip:8080";
 class getApi
 {
   //http get rest api from localhost spring backEnd...

  static Future getFech() async
  {
    //final url = "http://192.168.99.1:8080/findAll";
   var url = baseUrl + "/findAll";
    return await http.get(url);
  }

  static Future editBook(BookEntity book) async
  {
    var url = baseUrl+"/update";
    return await http.put(Uri.encodeFull(url),body: json.encode(book), headers:  {"Content-Type": "application/json"});
  }
  static Future removeBook(int id) async
  {
    var url = baseUrl+"/remove/$id";
    return await http.delete(url,headers: { "Accept" : "application/json"});
  }
  static Future addItem(BookEntityAdd book) async
  {
     var url = baseUrl+"/save";
     return await http.post(Uri.encodeFull(url), body: json.encode(book),headers: {"Content-Type":"application/json"});
  }
 }
