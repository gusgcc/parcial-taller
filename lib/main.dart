import 'package:fisi_army/pages/detailPayment_page.dart';
import 'package:fisi_army/pages/home_page.dart';
import 'package:fisi_army/pages/login_page.dart';
import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
//import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
          '/add': (BuildContext context) => DetailPage(),
          '/login': (BuildContext context) => LoginPage()
        },
      ),
    );
  }
}
