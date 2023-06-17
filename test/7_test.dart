import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:crypto_app/views/gridPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCryptoService extends Mock implements CryptoService {}

void main() {
  group('GridPage', () {
    late MockCryptoService mockCryptoService;

    setUp(() {
      mockCryptoService = MockCryptoService();
    });

    testWidgets('Test body of GridPage with snapshot has data', (WidgetTester tester) async {
      final cryptoDataList = [
        CryptoData(rank: '1', name: 'Bitcoin', symbol: 'BTC'),
        CryptoData(rank: '2', name: 'Ethereum', symbol: 'ETH'),
      ];

      await tester.pumpWidget(MaterialApp(
        home: GridPage(
          futurecryptos: Future.value(cryptoDataList),
          cryptoList: cryptoDataList,
        ),
      ));

      expect(find.text('Grid View'), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      expect(find.byType(ListTile), findsNWidgets(cryptoDataList.length));

      for (var cryptoData in cryptoDataList) {
        expect(find.text('Rank: ${cryptoData.rank} ${cryptoData.name}'), findsOneWidget);
      }
    });
  });
}
