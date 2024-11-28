import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_book_search_app/data/model/book.dart';

void main() {
  test('book model test', () {
    String dummyData = """
 {
       "title": "Harry Potter (Welcome to Hogwarts Planner Notebook Collection (Set of 3): (Harry Potter School Planner School, Harry Potter Gift, Harry Potter Station)",
      "link": "https://search.shopping.naver.com/book/catalog/43805245634",
      "image": "https://shopping-phinf.pstatic.net/main_4380524/43805245634.20240616071135.jpg",
      "author": "Insight Editions",
      "discount": "18500",
      "publisher": "Insight Editions",
      "pubdate": "20230606",
      "isbn": "9798886631418",
      "description": ""
  }
""";
    // 1. Map 으로 변환
    Map<String, dynamic> map = jsonDecode(dummyData);

    // 2. 객체로 변환
    Book book = Book.fromJson(map);

    expect(book.discount, '18500');
    print(book.toJson());
  });
}
