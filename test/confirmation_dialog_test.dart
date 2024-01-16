import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_app.dart';

void main() {
  testWidgets(
    'Shows a confirmation dialog with a message and a button',
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

      final titleFinder = find.text("Please confirm");
      final messageFinder = find.text("It's a simple Yes/No question");
      final yesButtonTextFinder = find.text("true");
      final noButtonTextFinder = find.text("No");

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
      expect(yesButtonTextFinder, findsOneWidget);
      expect(noButtonTextFinder, findsOneWidget);
    },
  );
}
