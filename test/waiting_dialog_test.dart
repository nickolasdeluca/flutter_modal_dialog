import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_app.dart';

void main() {
  testWidgets(
    'Shows a waiting dialog with a title, a message and a button that will'
    ' dissapear after 5 seconds',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Home(),
        ),
      );

      final buttons = find.byType(ElevatedButton);

      final button = find.descendant(
        of: buttons,
        matching: find.text("Waiting dialog"),
      );

      await tester.tap(button);

      await tester.pump();

      final titleFinder = find.text("Processing");
      final messageFinder =
          find.text("Please wait while we process your request");

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);

      Duration delay = const Duration(seconds: 5);

      await tester.pump(delay);

      expect(titleFinder, findsNothing);
      expect(messageFinder, findsNothing);
    },
  );
}
