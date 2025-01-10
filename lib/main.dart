import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/main_screen/bloc/books_bloc.dart';
import 'package:flutter_application_1/presentation/main_screen/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> BooksBloc(),
      child:  MaterialApp(
        title:"Book Buddy",
        home:MainScreen()
        ),
    );
  }
}
