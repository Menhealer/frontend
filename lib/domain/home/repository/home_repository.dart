import 'package:relog/domain/home/model/monthly.dart';
import 'package:relog/domain/home/model/quarterly.dart';

abstract class HomeRepository {
  Future<Monthly?> getMonthly(int year, int month);
  Future<Quarterly> getQuarterly(int year, int quarter);
}