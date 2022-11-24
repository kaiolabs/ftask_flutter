extension DateTimeExtensions on DateTime {
  String toCloud() {
    return toString().replaceAll(' ', 'T');
  }
}
