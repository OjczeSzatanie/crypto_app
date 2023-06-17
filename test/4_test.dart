import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test roundedCap method correctly rounds market cap value', () {

    final cryptoData = CryptoData(
      marketCapUsd: '123456789',
      maxSupply: '9876543210',
    );

    final detailsPage = DetailsPage(cryptoData: cryptoData);


    final result1 = detailsPage.roundedCap(detailsPage.num);
    final result2 = detailsPage.roundedCap(detailsPage.num2);

    expect(result1, '123.5 M');
    expect(result2, '9.9 B');
  });
}
