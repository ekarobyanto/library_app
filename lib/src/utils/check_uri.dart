bool isStringAUrl(String inputString) {
  final uri = Uri.tryParse(inputString);
  return uri != null && uri.hasScheme;
}
