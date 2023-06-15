import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/provider/apicall.dart';
import 'package:crypto_app/views/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome()
    );
  }
}
class MyHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            // child: ElevatedButton(
            //   child: const Text('Open route'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) { return HomePage(); }),
            //     );
            //   },
            // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                        TweenAnimationBuilder(
                           duration: Duration(milliseconds: 3000),
                           curve: Curves.bounceOut,
                           tween: Tween(begin: 1.0, end: 0.0),
                           builder: (context, value, child){
              // horizontal disposition of the widget.
                               return Transform.translate(
                                  offset:  Offset(
                                  value * 500,
                                    0.0
                                  ),
                               child: child,);
                           },
                           child: Image.asset('images/crypto.png')
                            ),
                    const SizedBox(height: 20,),
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceOut,
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child){
                        return Transform.translate(
                          offset:  Offset(
                              value * 60,
                              0.0
                          ),
                          child: child,
                        );
                      },
                      child: const Text("Welcome!",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.bounceOut,
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(
                            0.0,
                            value * 300
                        ),
                        child: child,
                      );
                    },
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.redAccent; //<-- SEE HERE
                            return Colors.red;
                          },
                        ),
                      ),
                      child: const Text('Check cryptos'),
                    onPressed: () {
                              Navigator.push(
                              context,MaterialPageRoute(builder: (context)
                                        { return const HomePage(); }),);},)
                    )
          ]
        )
        ),
        )
    );
  }
}