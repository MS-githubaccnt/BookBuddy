import "package:bloc/bloc.dart";
import "../../../data/model/book.dart";
import "../../../data/api/book_api.dart";
import "books_event.dart";
import "books_state.dart";

class BooksBloc extends Bloc<BookEvent,BooksState> {
    final List<Book> _bookList=[];
    int currentPage =1;
    late int limit;
    final _bookApi=BookApi();
    //super state recheck
     BooksBloc():super(BookFetched([])){
      on<Fetch>(_onFetch);
     }
     _onFetch(event,emit)async{
      int startingIndex=(currentPage-1)*10;
      try{
        emit(BookLoading(_bookList));
        final fetchedBooks=await _bookApi.fetchBooks(startingIndex)??[];
        _bookList.addAll(fetchedBooks);
        emit(BookFetched(_bookList));
        currentPage++;
      }catch(e){
        emit(BookError(e.toString()));
      }
     }

}