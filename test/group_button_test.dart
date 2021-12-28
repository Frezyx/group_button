import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'test_config.dart';

void main() {
  group('Button tap tests', () {
    testWidgets(
      'Tap group button test',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: GroupButtonTestWidget()),
        );
        final button = find.text('12:00');

        await tester.tap(button);
        await tester.pump();

        final text = find.text('12:00');
        expect(text, findsNothing);
      },
    );
  });
}
