import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  HomeBottomSheet(this.book);

  // 1. 홈페이지에서 전달해줄 수 있게 추가
  Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 50,
      ),
      child: Row(
        children: [
          Image.network(
            book.image,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 20),
          // row 안에서 또 위젯 사용할때 expanded 또는 SizedBox 로 크기 정해주기
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  book.author,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  book.description,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // 자세히 보기 터치했을 때 DetailPage로 가게 미리 구현
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(book);
                      },
                    ));
                  },
                  // 터치영역 잡아주기 위해
                  child: Container(
                    width: double.infinity,
                    height: 50, // UX 고려한 높이
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text(
                      '자세히 보기',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
