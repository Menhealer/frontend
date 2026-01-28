class NumberFormatUtil {
  NumberFormatUtil._();

  static String comma(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
  }
}