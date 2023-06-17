import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Scaffold in DetailsPage', (WidgetTester tester) async {
    final cryptoData = CryptoData(
      name: 'Bitcoin',
      symbol: 'BTC',
      marketCapUsd: '1000000000',
      maxSupply: '21000000',
      priceUsd: '35000',
      changePercent24Hr: '2.5',
    );

    await tester.pumpWidget(MaterialApp(home: DetailsPage(cryptoData: cryptoData)));

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.text('Bitcoin BTC'), findsOneWidget);

    expect(find.byType(CachedNetworkImage), findsOneWidget);

    expect(find.text('Bitcoin'), findsOneWidget);

    expect(find.text('Price: \$35000.00000'), findsOneWidget);

    expect(find.text('Available supply for trading: 21.0 M'), findsOneWidget);

    expect(find.text('Martet cap:  \$1.0 B'), findsOneWidget);

    expect(find.text('Direction and value change in the last 24 hours: 2.5000000000%'), findsOneWidget);
  });
}
