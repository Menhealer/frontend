import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/home/home_state.dart';
import 'package:relog/presentation/home/home_view_model.dart';

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);