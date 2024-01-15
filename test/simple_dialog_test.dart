import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_app.dart';

void main() {
  testWidgets(
    'Shows a simple dialog with a message and a button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Home(),
        ),
      );

      final buttons = find.byType(ElevatedButton);

      final button = find.descendant(
        of: buttons,
        matching: find.text("Confirmation dialog"),
      );

      await tester.tap(button);

      await tester.pump();

      final titleFinder = find.text("This is a short message");
      final buttonTextFinder = find.text("Alright!");

      expect(titleFinder, findsOneWidget);
      expect(buttonTextFinder, findsOneWidget);
    },
  );
}
