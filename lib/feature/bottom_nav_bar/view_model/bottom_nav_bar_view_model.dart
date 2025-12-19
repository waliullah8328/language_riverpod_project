// lib/bottom_nav/view_model/bottom_nav_view_model.dart

import 'package:flutter_riverpod/legacy.dart';

final bottomNavProvider =
StateNotifierProvider<BottomNavNotifier, int>((ref) => BottomNavNotifier());

class BottomNavNotifier extends StateNotifier<int> {
  BottomNavNotifier() : super(0);

  void setIndex(int index) => state = index;
}
