class Formatters {
  String replaceComma(String? value) {
    if (value != null) {
      return value.replaceAll(',', '.');
    }
    return '';
  }
}
