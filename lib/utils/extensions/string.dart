extension StringExtensions on String? {
  String orEmpty() {
    return this ?? '';
  }
}