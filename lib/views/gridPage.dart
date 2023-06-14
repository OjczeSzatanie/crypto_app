import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/detailsPage.dart';
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late Future<List<CryptoData>> futureCryptos;

  @override
  void initState() {
    super.initState();
    futureCryptos = CryptoService().getCrypto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Grid View'),
        ),
        body: RefreshIndicator(
            color: Colors.blueAccent,
            child: Center(
              child: FutureBuilder<List<CryptoData>>(
                future: futureCryptos,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        CryptoData cryptoData = snapshot.data?[index];
                        return Card(
                          child: ListTile(
                          subtitle: Center(child:
                          Image.network('https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@1a63530be6e374711a8554f31b17e4cb92c25fa5/128/color/'+ '${cryptoData.symbol.toString().toLowerCase()}' '.png'),),
                            title: Text('Rank: ${cryptoData.rank} ${cryptoData.name}'),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: (() => {openPage(context, cryptoData)}),
                        )
                        );
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
                futureCryptos = Future.value(cryptos);
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