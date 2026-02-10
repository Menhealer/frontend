import 'package:relog/domain/home/model/quarterly.dart';
import 'package:relog/domain/home/repository/home_repository.dart';

class GetQuarterlyUseCase {
  final HomeRepository _homeRepository;
  GetQuarterlyUseCase(this._homeRepository);

  Future<Quarterly> execute(int year, int quarter) async {
    return await _homeRepository.getQuarterly(year, quarter);
  }
}