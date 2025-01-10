import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_bloc.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_event.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_state.dart';
import 'package:flutter_application_1/presentation/main_screen/widgets/book_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
 MainScreen({super.key});
 @override
  _MainScreenState createState()=>_MainScreenState();
 }
 class _MainScreenState extends State<MainScreen>{
 final ScrollController _scrollController=ScrollController();
 bool _isFetching=false;
 @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !_isFetching) {
        _isFetching = true;
        context.read<BooksBloc>().add(Fetch());
      }
    });
  }
   @override
  void dispose() {
    _scrollController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
            _isFetching=false;
            if(state.books.isEmpty){
              context.read<BooksBloc>().add(Fetch());
            }
            
            return ListView.builder(
              controller:_scrollController,
              itemCount: state.books.length,
              itemBuilder: (context,index){
                final books=(state).books;
                return BookTile(book: books[index]);
              }
            );
           }
           else if(state is BookLoading){
            if(state.books.isEmpty){
            return Center(child: CircularProgressIndicator());}
            else{
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                                  controller:_scrollController,
                                  itemCount: state.books.length+1,
                                  itemBuilder: (context,index)
                                  {
                                    final books=(state).books;
                                    if(index<state.books.length) {
                    return BookTile(book: books[index]);
                                    } else {
                    return Center(child: CircularProgressIndicator());
                                    }
                                  }
                                ),
                  ),CircularProgressIndicator()

                ],
              );
            }
           
          }else{
            return CircularProgressIndicator();
          }
          }
          )
        
      )
      );
  }
}
