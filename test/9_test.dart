import 'dart:io';

import 'package:crypto_app/main.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test TweenAnimationBuilder in MyHome', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: MyHome(),
      ),
    );

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Welcome!'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));

  });
}
