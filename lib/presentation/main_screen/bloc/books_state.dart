 import 'package:flutter_application_1/data/model/book.dart';

abstract class BooksState {
}
class BookLoading extends BooksState{
  final List<Book> books;
  BookLoading(this.books);

}
class BookFetched extends BooksState{
  final List<Book> books;
  BookFetched(this.books);
}
class BookError extends BooksState{
  final String errorMessage;
  BookError(this.errorMessage);
}
