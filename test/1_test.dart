import 'package:crypto_app/models/crypto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test CryptoData.fromJson()', () {
    final json = {
      'id': 'bitcoin',
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'marketCap': 1234567890,
    };

    final cryptoData = CryptoData.fromJson(json);

    expect(cryptoData.id, 'bitcoin');
    expect(cryptoData.name, 'Bitcoin');
    expect(cryptoData.symbol, 'BTC');
    expect(cryptoData.marketCapUsd, null);
  });
}