import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/gifts/gifts_state.dart';
import 'package:relog/presentation/gifts/gifts_view_model.dart';

final giftsViewModelProvider = NotifierProvider.autoDispose<GiftsViewModel, GiftsState>(
  GiftsViewModel.new,
);