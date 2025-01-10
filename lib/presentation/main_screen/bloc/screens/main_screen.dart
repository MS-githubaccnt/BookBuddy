import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_bloc.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_event.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_state.dart';
import 'package:flutter_application_1/presentation/main_screen/widgets/book_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetching = false;

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Book Buddy",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            if (state is BookError) {
              return Center(child: Text("Error: ${state.errorMessage}"));
            } else if (state is BookFetched || state is BookLoading) {
              final books = (state is BookFetched)?state.books:(state as BookLoading).books;
              _isFetching = false;

              if (books.isEmpty && state is BookFetched) {
                context.read<BooksBloc>().add(Fetch());
              }

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_scrollController.hasClients) {
                  _scrollController.jumpTo(_scrollController.position.pixels);
                }
              });
              if(books.isEmpty){
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: state is BookLoading ? books.length + 1 : books.length,
                itemBuilder: (context, index) {
                  if (index < books.length) {
                    return BookTile(book: books[index]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}