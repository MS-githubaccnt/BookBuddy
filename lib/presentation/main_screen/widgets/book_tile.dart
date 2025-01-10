import 'package:flutter/material.dart';
import '../../../data/model/book.dart';

class BookTile extends StatelessWidget{
  final Book book;
  const BookTile({required this.book,super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation:10,
      margin:const EdgeInsets.all(4),
      child:Center(
        child:Text(book.title!),
      ),
    );
    
  }
}