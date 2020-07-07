class BookEntity
{
   int id;
   String bookName;
   String price;
   String description;
   String url;

  BookEntity(int id , String name , String price , String descrip , String url)
  {
    this.id = id;
    this.bookName = name;
    this.price = price;
    this.description = descrip;
    this.url = url;
  }



  //book to map
  BookEntity.fromJson(Map json):
  id = json['id'],
  bookName = json['bookName'],
  price = json['price'],
  description = json['description'],
  url = json['imageUrl'];

  Map toJson()
  {
    return {'id':id,'bookName':bookName , 'price':price , 'description':description,'imageUrl':url};
  }

}

class BookEntityAdd
{
   String bookName;
   String price;
   String description;
   String url;

  BookEntityAdd(String name , String price , String descrip , String url)
  {
    this.bookName = name;
    this.price = price;
    this.description = descrip;
    this.url = url;
  }



  //book to map
  BookEntityAdd.fromJson(Map json):
  bookName = json['bookName'],
  price = json['price'],
  description = json['description'],
  url = json['imageUrl'];

  Map toJson()
  {
    return {'bookName':bookName , 'price':price , 'description':description,'imageUrl':url};
  }

}