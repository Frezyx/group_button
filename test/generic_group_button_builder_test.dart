import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_button/group_button.dart';

void main() {
  group('Button tap tests', () {
    testWidgets(
      'Build custom button for generic base',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: GroupButton<DateTime>(
              buttons: [DateTime(2000, 12, 12)],
              buttonBuilder: (selected, val, context) => Text(
                '$selected ${val.year}:${val.month}:${val.day}',
              ),
            ),
          ),
        );

        final text = find.text('false 2000:12:12');
        expect(text, findsOneWidget);
      },
    );

    testWidgets(
      'Build custom buttons for generic base',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: GroupButton<DateTime>(
              buttons: [DateTime(2000, 12, 12), DateTime(2000, 12, 12)],
              buttonBuilder: (selected, val, context) => Text(
                '$selected ${val.year}:${val.month}:${val.day}',
              ),
            ),
          ),
        );

        final text = find.text('false 2000:12:12');
        expect(text, findsWidgets);
      },
    );
  });
}
