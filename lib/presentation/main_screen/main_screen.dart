import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_bloc.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_event.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_state.dart';
import 'package:flutter_application_1/presentation/main_screen/widgets/book_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
 MainScreen({super.key});
 final ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener((){
      if(_scrollController.position.pixels>=_scrollController.position.maxScrollExtent){
        context.read<BooksBloc>().add(Fetch());
      }
    });
    return  MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          backgroundColor:Colors.blue,
          title:Text("Book Buddy",
          style: TextStyle(
            color:Colors.white
          ),),
          centerTitle: true,
          //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          ),
          body:BlocBuilder<BooksBloc,BooksState>(builder: (context,state){
           if( state is BookError){
            return Text("error");

           } else if(state is BookFetched){
            if(state.books.isEmpty){
              context.read<BooksBloc>().add(Fetch());
            }
            return ListView.builder(
              controller:_scrollController,
              itemBuilder: (context,index){
                final books=(state).books;
                return BookTile(book: books[index]);
              }
            );
           }
           else{
            return CircularProgressIndicator();
           }
          })
        
      )
      );
  }
}
