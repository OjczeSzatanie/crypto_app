import 'dart:convert';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  Future<List<CryptoData>> getCrypto() async {
    final response = await http
        .get(Uri.parse("hfirsrttps://api.coincap.io/v2/assets"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<CryptoData> list = [];

      for (var i = 0; i < data["data"].length; i++) {
        final entry = data["data"][i];
        list.add(CryptoData.fromJson(entry));
      }
      return list;
  }else{
      throw Exception("Failed");
    }
  }
}
