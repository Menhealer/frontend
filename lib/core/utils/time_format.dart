String formatPeriodDate(String day) {
  final date = DateTime.tryParse(day);
  if (date == null) return '';

  return '${date.year}. ${date.month}. ${date.day}.';
}

String formatBirthday(String birthday) {
  final date = DateTime.tryParse(birthday);
  if (date == null) return '';

  return '${date.month}월 ${date.day}일';
}

int getQuarter(DateTime date) {
  return ((date.month - 1) ~/ 3) + 1;
}

String ymdHyphen(DateTime d) =>
  '${d.year.toString().padLeft(4, '0')}-'
  '${d.month.toString().padLeft(2, '0')}-'
  '${d.day.toString().padLeft(2, '0')}';

String formatIntBirthday(int y, int m, int d) {
  final date = DateTime(y, m, d);
  final mm = date.month.toString().padLeft(2, '0');
  final dd = date.day.toString().padLeft(2, '0');
  return '${date.year}-$mm-$dd';
}

String monthlyVersion(int year, int month) =>
    '$year-${month.toString().padLeft(2, '0')}-01';

int quarterStartMonth(int quarter) => (quarter - 1) * 3 + 1;

String quarterlyVersion(int year, int quarter) =>
    '$year-${quarterStartMonth(quarter).toString().padLeft(2, '0')}-01';
