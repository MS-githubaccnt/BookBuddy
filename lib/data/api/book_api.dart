import 'package:flutter_application_1/data/model/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookApi{
  final String url="https://www.googleapis.com/books/v1/volumes";
  Future<List<Book>?> fetchBooks(int startIndex,{int maxResults=10,String query='the'}) async{
   try{
    final response=await http.get(Uri.parse(
       "${url}"+"?q=$query"+"&maxResults=$maxResults"+"&startIndex=$startIndex"+"&printType=books"
    ));
      final data=json.decode(response.body);
      print(data);
      print("dataa");
      final List<Book> BookList=(data["items"] as List).map(
        (book)=>Book.fromJson(book)
      ).toList();
      print (BookList);
      return BookList;
    
   }catch(e){
    print("Error in api call $e");
    return null;
   }
  }
}
