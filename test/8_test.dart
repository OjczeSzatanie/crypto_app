import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/views/gridPage.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('Test FutureBuilder in GridPage', (WidgetTester tester) async {
    List<CryptoData> mockCryptoDataList = [
      CryptoData(rank: '1', name: 'Bitcoin', symbol: 'BTC'),
      CryptoData(rank: '2', name: 'Ethereum', symbol: 'ETH'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: GridPage(
          futurecryptos: Future.value(mockCryptoDataList),
          cryptoList: mockCryptoDataList,
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.text('Grid View'), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump();

    expect(find.byType(Card), findsNWidgets(mockCryptoDataList.length));

    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    expect(find.byType(DetailsPage), findsOneWidget);
  });
}
