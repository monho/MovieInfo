import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = Provider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel {
  // 향후 API 연동, 상태 관리 등 구현 가능
}
