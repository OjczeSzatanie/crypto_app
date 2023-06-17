import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_app/views/gridPage.dart'; // Replace with the actual import path for GridPage


void main() {
  testWidgets('Test AppBar in GridPage', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: GridPage(futurecryptos: Future.value([]), cryptoList: []),
      ),
    );

    final appBarFinder = find.byType(AppBar);

    expect(appBarFinder, findsOneWidget);

    final appBar = tester.widget<AppBar>(appBarFinder);

    expect(find.text('Grid View'), findsOneWidget);
  });
}
