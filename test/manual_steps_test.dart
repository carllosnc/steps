import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:steps/steps.dart';

void main() {
  testWidgets("Check initial render", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ManualSteps(
            screens: [
              ManualScreen(
                content: Center(child: Text("First Screen")),
              ),
              ManualScreen(
                content: Center(child: Text("Second Screen")),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byKey(const Key("manual-steps-stack")), findsOneWidget);
    expect(find.byKey(const Key("manual-steps-items")), findsOneWidget);
    expect(find.byKey(const Key("manual-steps-controls")), findsOneWidget);
    expect(find.byKey(const Key("manual-steps-dot-0")), findsOneWidget);
    expect(find.byKey(const Key("manual-steps-dot-1")), findsOneWidget);
  });

  testWidgets("Check exception when has less than 2 screens", (tester) async {
    //have no screens
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ManualSteps(
            screens: [],
          ),
        ),
      ),
    );
    expect(tester.takeException(), isInstanceOf<Exception>());

    //have only one screen
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ManualSteps(
            screens: [
              ManualScreen(
                content: Center(child: Text("Second Screen")),
              ),
            ],
          ),
        ),
      ),
    );

    expect(tester.takeException(), isInstanceOf<Exception>());
  });
}
