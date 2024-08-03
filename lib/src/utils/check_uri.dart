bool isStringAUrl(String inputString) {
  try {
    final uri = Uri.tryParse(inputString);
    return uri != null && uri.hasScheme;
  } catch (_) {
    return false;
  }
}
