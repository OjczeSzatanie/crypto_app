import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_app/views/listPage.dart'; // Replace with the actual import path for ListPage


void main() {
  testWidgets('Test Scaffold in ListPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ListPage(futurecryptos: Future.value([]), cryptoList: []),
      ),
    );

    final scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);
  });
}
