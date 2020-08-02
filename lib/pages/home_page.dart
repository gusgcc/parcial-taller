import 'package:fisi_army/pages/detailPayment_page.dart';
import 'package:fisi_army/pages/tabs/ajustes.dart';
import 'package:fisi_army/pages/tabs/perfil.dart';
import 'package:fisi_army/pages/tabs/programas.dart';
import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fisi_army/pages/login_page.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> usuario;

  const HomePage({Key key, this.usuario}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    DetailPage();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.usuario);
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logounmsm.png',
            height: 45.0,
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  try {
                    //Provider.of<LoginState>(context).logout();
                  } catch (e) {}

                  debugPrint("click logout");
                  showAlertDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.exit_to_app),
                ))
          ],
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            welcome()

            /*NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 2.0, 
                    pinned: true, 
                    bottom: getTabBar()
                  )
                ];
              },
              body: getTabBarView(),
            )*/

            /*Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120.0),
                child: Image.asset(
                  'assets/logounmsm.png',
                  height: 100,
                ),
              ),
            ),
            Container(
              child: Text("Hola Jorge, soy tu usuario"),
              height: 40,
            )*/
            ,
            Container(
              padding: EdgeInsets.all(15),
              child: getTabBar(),
            ),
            Expanded(
              child: getTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget welcome() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120.0),
            child: Image.asset(
              'assets/usuario.png',
              height: 100,
            ),
          ),
        ),
        Container(
          child: Text("HOLA " + widget.usuario['nomAlumno'],
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
          height: 40,
        )
      ],
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(icon: Icon(Icons.person_pin)),
        Tab(icon: Icon(Icons.payment)),
        Tab(icon: Icon(Icons.settings)),
      ],
      controller: _controller,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      controller: _controller,
      children: <Widget>[
        PerfilWidget(usuario: widget.usuario),
        DetailPage(dni: widget.usuario['dniM']),
        AjustesWidget()
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget cancelButton = FlatButton(
      child: Text(
        "Seguir aqui",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      color: Colors.green,
    );
    Widget okButton = FlatButton(
      child: Text(
        "Cerrar Sesion",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => {
        Navigator.pop(context),
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        )
      },
      color: Colors.redAccent,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cerrar Sesion"),
      content: Text("Esta Seguro que desea cerrar sesion?"),
      actions: [okButton, cancelButton],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
