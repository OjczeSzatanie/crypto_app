import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final CryptoData cryptoData;

  DetailsPage({super.key, required this.cryptoData});

  late double num = double.parse(cryptoData.marketCapUsd!);

  late double num2 = double.parse(cryptoData.maxSupply ?? "0") ;


  String roundedCap(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    }else{
      return 'null' ;
    }
  }

  late String number = roundedCap(num);
  late String number2 = roundedCap(num2);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('${cryptoData.name} ${cryptoData.symbol}'),
        ),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                CachedNetworkImage(
                  imageUrl: 'https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@1a63530be6e374711a8554f31b17e4cb92c25fa5/128/color/'+ '${cryptoData.symbol.toString().toLowerCase()}' '.png',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(('${cryptoData.name}'),
                    style: const TextStyle(
                      fontSize: 46.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Price: \$${double.parse(cryptoData.priceUsd!).toStringAsFixed(5)}'),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Available supply for trading: ${number2.toString()}'),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Martet cap:  \$${number.toString()}'),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Direction and value change in the last 24 hours: ${double.parse(cryptoData.changePercent24Hr!).toStringAsFixed(10)}%'),
              ],
            ),
        ));
  }
}