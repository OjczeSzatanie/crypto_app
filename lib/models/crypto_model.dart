class CryptoData {
  final String? id;
  final String? rank;
  final String? symbol;
  final String? name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  CryptoData({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    return CryptoData(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      name: json['name'],
      supply: json['supply'],
      maxSupply: json['maxSupply'],
      marketCapUsd: json['marketCapUsd'],
      volumeUsd24Hr: json['volumeUsd24Hr'],
      priceUsd: json['priceUsd'],
      changePercent24Hr: json['changePercent24Hr'],
      vwap24Hr: json['vwap24Hr'],
      explorer: json['explorer'],
    );
  }
}
