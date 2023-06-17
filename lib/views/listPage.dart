import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
   ListPage({super.key, required this.futurecryptos, required List<CryptoData> cryptoList});

   Future<List<CryptoData>> futurecryptos;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange[300],
          title: const Text('List View'),
        ),
        body: RefreshIndicator(
            color: Colors.blueAccent,
            child: Center(
              child: FutureBuilder<List<CryptoData>>(
                future: widget.futurecryptos,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black26,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        CryptoData cryptoData = snapshot.data?[index];
                        return Card(
                          child:  ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: 'https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@1a63530be6e374711a8554f31b17e4cb92c25fa5/128/color/'+ '${cryptoData.symbol.toString().toLowerCase()}' '.png',
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),),
                          title: Text('${cryptoData.name}'),
                          subtitle: Text('Rank: ${cryptoData.rank}'),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: (() => {openPage(context, cryptoData)}),
                          ));
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            onRefresh: () async {
              var cryptos = await CryptoService().getCrypto();
              setState(() {
                widget.futurecryptos = Future.value(cryptos);
              });
            }));
  }

  openPage(context, CryptoData cryptoData) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
              cryptoData: cryptoData,
            )));
  }
}