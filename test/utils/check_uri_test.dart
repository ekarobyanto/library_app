import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/src/utils/check_uri.dart';

void main() {
  group('isStringAUrl', () {
    test('returns true for valid http URL', () {
      expect(isStringAUrl('http://example.com'), isTrue);
    });

    test('returns true for valid https URL', () {
      expect(isStringAUrl('https://example.com'), isTrue);
    });

    test('returns false for invalid URL', () {
      expect(isStringAUrl('not_a_url'), isFalse);
    });

    test('returns false for empty string', () {
      expect(isStringAUrl(''), isFalse);
    });

    test('returns false for string without scheme', () {
      expect(isStringAUrl('www.example.com'), isFalse);
    });
  });
}
