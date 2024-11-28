// 1. 상태 클래스 만들기
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState(this.books);
  List<Book> books;
}

// 2. 뷰모델 만들기 - Notfier 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchBooks(String query) async {
    final bookRepository = BookRepository();
    final books = await bookRepository.searchBooks(query);
    state = HomeState(books);
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
// provider == 관리자
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() => HomeViewModel());
