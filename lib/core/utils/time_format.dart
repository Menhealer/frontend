String formatPeriodDate(DateTime date) {
  return '${date.year}. ${date.month}. ${date.day}.';
}

String formatBirthday(DateTime date) {
  return '${date.month}월 ${date.day}일';
}

int getQuarter(DateTime date) {
  return ((date.month - 1) ~/ 3) + 1;
}