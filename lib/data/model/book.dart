class Book{
  final String? title;
  final String? author;
  final String? description;
  final String? selfLink;
  final String? thumbnail;
  final String? publisher;
  final String? publishedDate;
  Book(
    {
      required this.title,
      required this.author,
      required this.description,
      required this.selfLink,
      required this.thumbnail,
      required this.publisher,
      required this.publishedDate,
    }

  );
  factory Book.fromJson(Map<String,dynamic> Combinedjson){
    final bookData=Combinedjson['volumeInfo']??{};
    return Book(
      title: bookData['title']??"Title not found",
      author: (bookData['authors'] != null && bookData['authors'].isNotEmpty)
        ? bookData['authors'][0]
        : "Author Not Found",
      description: bookData['description']??"Description Not Found",
      selfLink:Combinedjson["selfLink"]??" ",
      thumbnail:(bookData['imageLinks'] != null && bookData['imageLinks'].isNotEmpty)
        ? bookData['imageLinks']["thumbnail"]
        :'',
      publisher:bookData["publisher"]??"Unknown Publisher",
      publishedDate:bookData["publishedDate"]??" "
    );
  }
  Map<String,dynamic>toJSon()=>{
    "title":title,
    "author":author,
    'description':description,
    "selfLink":selfLink,
    'thumbnail':thumbnail,
    "publisher":publisher,
    "publishedDate":publishedDate,
  };
}