import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils_code/flutter_utils_code.dart';

void main() {
  group('DoubleExt & Num Tests', () {
    test('toMyStringAsFixed', () {
      expect(0.toMyStringAsFixed(2), '0');
      expect(1.2345.toMyStringAsFixed(2), '1.23');
    });

    test('toMyDouble', () {
      expect(1.0.toMyDouble(2), '1');
      expect(1.2.toMyDouble(2), '1.20');
      expect(1.234.toMyDouble(1), '1.2');
    });
  });

  group('ListExt Tests', () {
    test('isNullOrEmpty & isNotNullOrEmpty', () {
      const List<int>? nullList = null;
      final List<int> emptyList = [];
      final List<int> normalList = [1, 2, 3];

      expect(nullList.isNullOrEmpty, true);
      expect(emptyList.isNullOrEmpty, true);
      expect(normalList.isNullOrEmpty, false);

      expect(nullList.isNotNullOrEmpty, false);
      expect(emptyList.isNotNullOrEmpty, false);
      expect(normalList.isNotNullOrEmpty, true);
    });

    test('toCommaStr', () {
      const List<String>? nullList = null;
      final List<String> list = ['a', 'b', 'c'];
      expect(nullList.toCommaStr(), '');
      expect(list.toCommaStr(), 'a,b,c');
    });
  });

  group('StringExt Tests', () {
    test('toDouble', () {
      const String? nullStr = null;
      expect(nullStr.toDouble(defaultValue: 1.0), 1.0);
      expect('1.23'.toDouble(), 1.23);
      expect('abc'.toDouble(defaultValue: 0.0), 0.0);
    });

    test('toInt', () {
      const String? nullStr = null;
      expect(nullStr.toInt(defaultValue: 5), 5);
      expect('123'.toInt(), 123);
      expect('abc'.toInt(defaultValue: 0), 0);
    });

    test('capitalizeFirst', () {
      const String? nullStr = null;
      expect(nullStr.capitalizeFirst(), '');
      expect(''.capitalizeFirst(), '');
      expect('hello'.capitalizeFirst(), 'Hello');
    });

    test('isChinaMobile', () {
      expect('13812345678'.isChinaMobile(), true);
      expect('23812345678'.isChinaMobile(), false);
      expect('1381234567'.isChinaMobile(), false);
    });

    test('isEmptyOrNull', () {
      const String? nullStr = null;
      expect(nullStr.isEmptyOrNull(), true);
      expect('   '.isEmptyOrNull(), true);
      expect('abc'.isEmptyOrNull(), false);
    });

    test('fromCommaToList', () {
      expect('a,b,c'.fromCommaToList(), ['a', 'b', 'c']);
      expect(''.fromCommaToList(), <String>[]);
    });

    test('trimAll', () {
      expect(' a b  c '.trimAll(), 'abc');
    });
  });

  group('DurationExt & NumDurationExt Tests', () {
    test('toStringNoMicroseconds', () {
      expect(const Duration(hours: 1, minutes: 10, seconds: 5).toStringNoMicroseconds(), '1:10:05');
      expect(const Duration(minutes: 5, seconds: 30).toStringNoMicroseconds(), '05:30');
    });

    test('NumDurationExt syntax', () {
      expect(500.milliseconds, const Duration(milliseconds: 500));
      expect(2.seconds, const Duration(seconds: 2));
      expect(1.5.minutes, const Duration(minutes: 1, seconds: 30));
      expect(1.hours, const Duration(hours: 1));
      expect(1.days, const Duration(days: 1));
    });
  });

  group('DateTimeExt Tests', () {
    test('isToday / isYesterday / isTomorrow', () {
      final today = DateTime.now();
      expect(today.isToday, true);
      expect(today.subtract(const Duration(days: 1)).isYesterday, true);
      expect(today.add(const Duration(days: 1)).isTomorrow, true);
    });

    test('startOfDay / endOfDay', () {
      final date = DateTime(2026, 5, 30, 15, 30, 20);
      expect(date.startOfDay, DateTime(2026, 5, 30, 0, 0, 0, 0));
      expect(date.endOfDay, DateTime(2026, 5, 30, 23, 59, 59, 999));
    });

    test('isLeapYear', () {
      expect(DateTime(2024, 1, 1).isLeapYear, true);
      expect(DateTime(2026, 1, 1).isLeapYear, false);
      expect(DateTime(2100, 1, 1).isLeapYear, false);
      expect(DateTime(2000, 1, 1).isLeapYear, true);
    });

    test('daysInMonth', () {
      expect(DateTime(2026, 1, 1).daysInMonth, 31);
      expect(DateTime(2026, 2, 1).daysInMonth, 28);
      expect(DateTime(2024, 2, 1).daysInMonth, 29); // leap year
    });

    test('addDays / subtractDays', () {
      final date = DateTime(2026, 5, 30);
      expect(date.addDays(5), DateTime(2026, 6, 4));
      expect(date.subtractDays(10), DateTime(2026, 5, 20));
    });
  });

  group('ColorExt Tests', () {
    test('fromHex parsing', () {
      expect(ColorExt.fromHex('#FFF'), const Color(0xFFFFFFFF));
      expect(ColorExt.fromHex('FFF'), const Color(0xFFFFFFFF));
      expect(ColorExt.fromHex('#FF5733'), const Color(0xFFFF5733));
      expect(ColorExt.fromHex('FF5733'), const Color(0xFFFF5733));
      expect(ColorExt.fromHex('#80FF5733'), const Color(0x80FF5733));
    });

    test('toHex formatting', () {
      const color = Color(0xFFFF5733);
      expect(color.toHex(), '#FF5733');
      expect(color.toHex(includeHash: false), 'FF5733');
      expect(color.toHex(includeAlpha: true), '#FFFF5733');
    });

    test('darken / lighten', () {
      const color = Color(0xFF808080);
      final dark = color.darken(0.2);
      final light = color.lighten(0.2);

      expect(dark.r < color.r, true);
      expect(light.r > color.r, true);
    });
  });

  group('MapExt Tests', () {
    test('getOrDefault', () {
      final map = {'a': 1, 'b': null};
      expect(map.getOrDefault('a', 10), 1);
      expect(map.getOrDefault('b', 10), 10);
      expect(map.getOrDefault('c', 10), 10);
    });

    test('removeNullValues & removeNullValuesInPlace', () {
      final map = {'a': 1, 'b': null, 'c': 3};
      final filtered = map.removeNullValues();
      expect(filtered.containsKey('b'), false);
      expect(map.containsKey('b'), true); // non-destructive

      map.removeNullValuesInPlace();
      expect(map.containsKey('b'), false); // in-place
    });
  });

  group('PlatformUtils Tests', () {
    test('PlatformUtils runs without crash', () {
      expect(PlatformUtils.isWeb, false);
      expect(PlatformUtils.isMobile || PlatformUtils.isDesktop, true);
    });
  });

  group('FileUtils Tests', () {
    test('renderSize', () {
      expect(FileUtils.renderSize(null), '0 B');
      expect(FileUtils.renderSize(-10.0), '0 B');
      expect(FileUtils.renderSize(500), '500.00 B');
      expect(FileUtils.renderSize(2048), '2.00 KB');
      expect(FileUtils.renderSize(1024 * 1024 * 3.5), '3.50 MB');
    });

    test('getNameFromFilePath', () {
      expect(FileUtils.getNameFromFilePath(null), '');
      expect(FileUtils.getNameFromFilePath('/path/to/file.txt'), 'file.txt');
      expect(FileUtils.getNameFromFilePath('C:\\Users\\Desktop\\image.png'), 'image.png');
      expect(FileUtils.getNameFromFilePath('plain_filename.zip'), 'plain_filename.zip');
    });
  });

  group('RegexUtils Tests', () {
    test('isEmail', () {
      expect(RegexUtils.isEmail('test@gmail.com'), true);
      expect(RegexUtils.isEmail('invalid-email'), false);
    });

    test('isMobileSimple', () {
      expect(RegexUtils.isMobileSimple('13812345678'), true);
      expect(RegexUtils.isMobileSimple('23812345678'), false);
    });
  });

  group('Gap Widget Tests', () {
    testWidgets('Gap resolves default direction to vertical inside vertical contexts', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('A'),
                Gap(20),
                Text('B'),
              ],
            ),
          ),
        ),
      );

      final gapFinder = find.byType(Gap);
      expect(gapFinder, findsOneWidget);

      final SizedBox sizedBox = tester.widget(find.descendant(of: gapFinder, matching: find.byType(SizedBox)));
      expect(sizedBox.height, 20.0);
      expect(sizedBox.width, 0.0);
    });

    testWidgets('Gap resolves direction to horizontal inside Row', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Text('A'),
                Gap(15),
                Text('B'),
              ],
            ),
          ),
        ),
      );

      final gapFinder = find.byType(Gap);
      expect(gapFinder, findsOneWidget);

      final SizedBox sizedBox = tester.widget(find.descendant(of: gapFinder, matching: find.byType(SizedBox)));
      expect(sizedBox.width, 15.0);
      expect(sizedBox.height, 0.0);
    });
  });
}
