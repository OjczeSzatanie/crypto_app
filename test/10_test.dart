import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:crypto_app/views/gridPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CachedNetworkImage error', (WidgetTester tester) async {
    CryptoData cryptoData = CryptoData(rank: '1', name: 'Bitcoin', symbol: 'xddsadsa');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GridPage(
            futurecryptos: Future.value([cryptoData]),
            cryptoList: [cryptoData],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
