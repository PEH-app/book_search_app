import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //
  test(
    'HomeViewModel test',
    () async {
//앱 내에서는 ProviderScope 안에서 뷰모델을 관리
// 테스트 환경에서 widget을 생성하지 않고 테스트 할 수 있게 PorviderContainer 제공
      final providerContainer = ProviderContainer();
      // 테스트가 끝나면 container를 폐기(dispose)
      addTearDown(providerContainer.dispose);
      //뷰모델 관리자에게 뷰모델 달라고 요청
      final homeVm = providerContainer.read(homeViewModelProvider.notifier);
      // 처음 HomeViewModel의 상태 => 빈 리스트 인걸 테스트
      final firstState = providerContainer.read(homeViewModelProvider);
      expect(firstState.books.isEmpty, true);

      // HomeViewModel에서 searchBooks 함수 호출 후 상태가 변경이 정상적으로 되는지 테스트
      await homeVm.searchBooks('harry');
      final afterState = providerContainer.read(homeViewModelProvider);
      expect(afterState.books.isEmpty, false);

      afterState.books.forEach((element) {
        print(element.toJson());
      });
    },
  );
}
