import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_edit_request.dart';
import 'package:relog/domain/gifts/model/gift_write_request.dart';
import 'package:relog/domain/gifts/use_case/gift_edit_use_case.dart';
import 'package:relog/domain/gifts/use_case/gift_write_use_case.dart';
import 'package:relog/domain/gifts/use_case/providers/gift_use_case_providers.dart';
import 'gift_write_state.dart';

class GiftWriteViewModel extends Notifier<GiftWriteState> {
  late final GiftWriteUseCase _giftWriteUseCase;
  late final GiftEditUseCase _giftEditUseCase;

  @override
  GiftWriteState build() {
    _giftWriteUseCase = ref.read(giftWriteUseCaseProvider);
    _giftEditUseCase = ref.read(giftEditUseCaseProvider);

    return const GiftWriteState(
      isLoading: false,
      isEdit: false,
      friendName: '',
      description: '',
    );
  }

  void initialize({
    required bool isEdit,
    GiftDetail? gift,
    Friend? friend,
  }) {
    if (!isEdit || gift == null) {
      state = GiftWriteState(
        isLoading: false,
        isEdit: false,
        friendId: friend?.id,
        friendName: friend?.name ?? '',
        description: '',
      );
      return;
    }

    if (state.isEdit && state.giftId == gift.id) return;

    final date = DateTime.parse(gift.giftDate);

    state = state.copyWith(
      isEdit: true,
      giftId: gift.id,
      friendId: gift.friendId,
      friendName: gift.friendName,
      giftType: gift.giftType,
      direction: gift.direction,
      year: date.year,
      month: date.month,
      day: date.day,
      price: gift.price,
      description: gift.description ?? '',
      originalFriendId: gift.friendId,
      originalGiftType: gift.giftType,
      originalDirection: gift.direction,
      originalDate: gift.giftDate,
      originalPrice: gift.price,
      originalDescription: gift.description,
    );
  }

  void onFriendSelected(int id, String name) =>
      state = state.copyWith(friendId: id, friendName: name);

  void onGiftTypeSelected(GiftType t) =>
      state = state.copyWith(giftType: t);

  void onDirectionSelected(Direction d) =>
      state = state.copyWith(direction: d);

  void onDatePicked(DatePicker d) {
    state = state.copyWith(
      year: d.year, month: d.month, day: d.day,
    );
  }

  void onPriceChanged(int? p) =>
      state = state.copyWith(price: p);

  void onDescriptionChanged(String v) =>
      state = state.copyWith(description: v);

  Future<GiftDetail?> submit() async {
    if (!state.canSubmit || state.isLoading) return null;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      if (state.isEdit) {
        final friendIdChanged = state.friendId != state.originalFriendId;
        final giftTypeChanged = state.giftType != state.originalGiftType;
        final directionChanged = state.direction != state.originalDirection;
        final dateChanged = state.giftDateYmd != state.originalDate;
        final priceChanged = state.price != state.originalPrice;
        final descChanged = state.description.trim() != (state.originalDescription ?? '').trim();

        final req = GiftEditRequest(
          friendId: friendIdChanged ? state.friendId : null,
          giftType: giftTypeChanged ? state.giftType : null,
          direction: directionChanged ? state.direction : null,
          giftDate: dateChanged ? state.giftDateYmd : null,
          price: priceChanged ? state.price : null,
          description: descChanged
              ? (state.description.trim().isEmpty ? '' : state.description.trim())
              : null,
        );

        final result = await _giftEditUseCase.execute(req, state.giftId!);
        state = state.copyWith(isLoading: false);
        return result;
      } else {
        final req = GiftWriteRequest(
          price: state.price!,
          giftDate: state.giftDateYmd!,
          giftType: state.giftType!,
          direction: state.direction!,
          description: state.description.trim().isEmpty
              ? null
              : state.description.trim(),
          friendId: state.friendId!,
        );

        final result = await _giftWriteUseCase.execute(req);
        state = state.copyWith(isLoading: false);
        return result;
      }
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return null;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '선물 등록 중\n알 수 없는 오류가 발생했습니다.',
      );
      return null;
    }
  }
}