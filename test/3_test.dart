
import 'package:crypto_app/views/homePage.dart';
import 'package:crypto_app/views/listPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test button in HomePage', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('CryptoApp'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.back_hand));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsNothing);
  });
}
