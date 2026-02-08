import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/gifts/gifts_state.dart';
import 'package:relog/presentation/gifts/gifts_view_model.dart';
import 'package:relog/presentation/gifts/write/gift_write_state.dart';
import 'package:relog/presentation/gifts/write/gift_write_view_model.dart';

final giftsViewModelProvider = NotifierProvider.autoDispose<GiftsViewModel, GiftsState>(
  GiftsViewModel.new,
);

final giftWriteViewModelProvider = NotifierProvider.autoDispose<GiftWriteViewModel, GiftWriteState>(
  GiftWriteViewModel.new,
);