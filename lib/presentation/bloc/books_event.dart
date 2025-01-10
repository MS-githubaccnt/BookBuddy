abstract class BookEvent{

}
class Fetch extends BookEvent{

}
class Search extends BookEvent{
    final String query;
    Search({required this.query});
}