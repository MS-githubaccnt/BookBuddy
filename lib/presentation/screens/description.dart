import 'package:flutter/material.dart';
import '../../data/model/book.dart';

class bookDescription extends StatelessWidget{
  final Book book;
  const bookDescription({super.key,required this.book});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Description",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              book.thumbnail != null && book.thumbnail!.isNotEmpty
                  ? Center(
                    child: Image.network(
                        book.thumbnail!,
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                  )
                  : Center(
                    child: Container(
                        color: Colors.grey[300],
                        height: 250,
                        child: Icon(
                          Icons.book,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                  ),
              SizedBox(height: 20),
              Text(
                book.title ?? "Title not available",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              
                  Text(
                    "By: ${book.author ?? 'Unknown Author'}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Published on: ${book.publishedDate ?? 'Unknown Date'}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
  

              Text(
                "Publisher: ${book.publisher ?? 'Unknown Publisher'}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              Text("Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
              ),),
              Divider(
                color:Colors.grey,
                thickness: 1,
                indent:2,
                endIndent: 10,
              ),
              Text(
                book.description ?? "Description not available.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}