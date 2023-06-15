import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final CryptoData cryptoData;

  const DetailsPage({super.key, required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('${cryptoData.name} ${cryptoData.priceUsd}'),
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
                  child: Text(('Rank: ${cryptoData.rank} ${cryptoData.name}'),
                    style: const TextStyle(
                      fontSize: 46.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Rank: ${cryptoData.rank} ${cryptoData.name}'),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Rank: ${cryptoData.rank} ${cryptoData.name}')
              ],
            ),
        ));
  }
}