import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils_code/flutter_utils_code.dart';

void main() {
  test('adds one to input values', () {
    print(RegexUtils.isMobileExact(18303411203.toString()));
    print(RegexUtils.isMobileExact(21569498414.toString()));
  });
}
