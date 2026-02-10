import 'package:relog/domain/home/model/monthly.dart';
import 'package:relog/domain/home/repository/home_repository.dart';

class GetMonthlyUseCase {
  final HomeRepository _homeRepository;
  GetMonthlyUseCase(this._homeRepository);

  Future<Monthly?> execute(int year, int month) async {
    return await _homeRepository.getMonthly(year, month);
  }
}