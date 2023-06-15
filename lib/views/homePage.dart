import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/gridPage.dart';
import 'package:crypto_app/views/listPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomeState();
}


class _MyHomeState extends State<HomePage> {

  late Future<List<CryptoData>> futureCryptos;

  @override
  void initState() {
    super.initState();
    futureCryptos = CryptoService().getCrypto();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child:Scaffold(
              backgroundColor: Colors.green,
              appBar: AppBar(
                leading: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.back_hand)),
                title: Text('CryptoApp'),
                bottom: TabBar(tabs: <Widget> [Tab (icon:Icon(Icons.view_list_rounded), ),
                  Tab(icon: Icon(Icons.grid_view_rounded),)]),
              ),

              body: TabBarView(
                  children: [ListPage(futurecryptos: futureCryptos,), GridPage()]),
            ))
    );
  }
}