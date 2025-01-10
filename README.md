#BOOK BUDDY
Book Buddy is an application for Bibliophiles. It is built in flutter and utilises BLoC architecture for creating a maintainable and scalable codebase along with efficient state management. Further, Pagination reduces overhead for fetching data. Users may discover new books, learn more about them through their Description Pages or search for their favourites.<br>

##Architecture
The app has been divided into 2 layers:<br>
###1.Presentaion Layer:
Contains Widgets and UI components, along with a sublayer of BLoC which handles any changes to the state of the UI.<br>
###2.Data Layer: 
Contains all the logic for interaction with external service such as a public api or to your backend to fetch, send and process data.<br>
```
.
├── data
│   ├── api
│   │   └── book_api.dart
│   └── model
│       └── book.dart
├── main.dart
└── presentation
    ├── bloc
    │   ├── books_bloc.dart
    │   ├── books_event.dart
    │   └── books_state.dart
    ├── screens
    │   ├── description.dart
    │   └── main_screen.dart
    └── widgets
        └── book_tile.dart

```
