import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/my_page/my_page_state.dart';
import 'package:relog/presentation/my_page/my_page_view_model.dart';

final myPageViewModelProvider = NotifierProvider<MyPageViewModel, MyPageState>(
  MyPageViewModel.new,
);