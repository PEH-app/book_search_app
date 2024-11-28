import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    //TextEditingController 사용시에는 반드시 dispose 호출해줘야 메모리에서 소거됨!
    textEditingController.dispose(); // 반드시 해줘야 하는데 stateful에서만 가능
    super.dispose();
  }

  void onSearch(String text) {
    // TODO 홈뷰모델의 searchBooks 함수 호출
    ref.read(homeViewModelProvider.notifier).searchBooks(text);
    print("on search 호출됨");
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    // 포커스 나갈때 키보드 내리기
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                onSearch(textEditingController.text);
              },
              // 버튼의 터치영역은 44 디바이스 픽셀 이상으로 해줘야 함! (UX)
              child: Container(
                  width: 50,
                  height: 50,
                  // 컨테이너에 배경색이 없으면 자녀위젯에만 터치 이벤트가 적용됨
                  color: Colors.transparent, // 이코드가 없으면 아이콘에만 터치영역이 생김

                  child: Icon(Icons.search)),
            ),
          ],
          // 1. TextField 구현
          title: TextField(
            maxLines: 1,
            // TextField의 값을 검색 아이콘 터치했을때에도 사용할거라 사용!
            controller: textEditingController,
            onSubmitted: onSearch, // 키보드의 done 눌렀을시 serach 함수 실행
            // 2. TextStyle 꾸미기
            decoration: InputDecoration(
              hintText: '검색어를 입력해 주세요',
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  // MaterialStateOutlineInputBorder.resolveWith를 사용하면
                  // TextField의 값이 바뀔때마다 WidgetState enum 값을 전달해서 이 함수 실행!
                  // print(states);
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                },
              ),
            ),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: homeState.books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4, //가로3 세로4 비율
            crossAxisSpacing: 10, //가로간격
            mainAxisSpacing: 10, //세로간격
          ),
          itemBuilder: (context, index) {
            final book = homeState.books[index];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomSheet(book);
                    });
              },
              //로렘 픽숨
              child: Image.network(
                book.image,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
