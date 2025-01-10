import "package:bloc/bloc.dart";
import "../../data/model/book.dart";
import "../../data/api/book_api.dart";
import "books_event.dart";
import "books_state.dart";

class BooksBloc extends Bloc<BookEvent,BooksState> {
    final List<Book> _bookList=[];
    int currentPage =1;
    late int limit;
    final _bookApi=BookApi();
    String currentQuery="";
     BooksBloc():super(BookFetched([])){
      on<Fetch>(_onFetch);
      on<Search>(_onSearch);
     }
     _onFetch(event,emit)async{
      int startingIndex=(currentPage-1)*10;
      try{
        emit(BookLoading(_bookList));
        var fetchedBooks;
        if (currentQuery==""){
         fetchedBooks=await _bookApi.fetchBooks(startingIndex)??[];}
        else{
           fetchedBooks=await _bookApi.fetchBooks(startingIndex ,query:currentQuery)??[];
        }

        _bookList.addAll(fetchedBooks);
        emit(BookFetched(_bookList));
        print(_bookList);
        currentPage++;
      }catch(e){
        emit(BookError(e.toString()));
      }
     }
     _onSearch(event,emit)async{
      currentPage=1;
      currentQuery= event.query;
      _bookList.clear();
      try{
        emit(BookLoading(_bookList));
        final fetchedBooks=await _bookApi.fetchBooks(0,query:currentQuery)??[];
        _bookList.addAll(fetchedBooks);
        emit(BookFetched(_bookList));
        print(_bookList);
        currentPage++;
      }catch(e){
        emit(BookError(e.toString()));
      }

     }
}