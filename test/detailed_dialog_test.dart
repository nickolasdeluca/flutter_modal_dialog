import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_app.dart';

void main() {
  testWidgets(
    'Shows a detailed dialog with a title, message, details of that message'
    ' and a button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Home(),
        ),
      );

      final buttons = find.byType(ElevatedButton);

      final button = find.descendant(
        of: buttons,
        matching: find.text("Detailed message dialog"),
      );

      await tester.tap(button);

      await tester.pump();

      final titleFinder = find.text("This is a short message");
      final messageFinder =
          find.text("This is larger message that explains the title");
      final detailFinder = find.text(
          "This is a detailed message that contains more information about the title and message");
      final buttonTextFinder = find.text("Alright!");

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
      expect(detailFinder, findsNothing);
      expect(buttonTextFinder, findsOneWidget);

      final hiddenMessageContainer = find.byType(AnimatedContainer);

      await tester.tap(hiddenMessageContainer);

      await tester.pump();

      expect(detailFinder, findsOneWidget);

      await tester.tap(hiddenMessageContainer);

      await tester.pump();

      expect(detailFinder, findsNothing);
    },
  );
}
