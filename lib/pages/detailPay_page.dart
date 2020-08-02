import 'package:fisi_army/models/detallePago_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPayPage extends StatefulWidget {
  final String codigoAlumno;

  const DetailPayPage({Key key, this.codigoAlumno}) : super(key: key);
  @override
  _DetailPayPageState createState() => _DetailPayPageState();
}

class _DetailPayPageState extends State<DetailPayPage> {
  String icono;
  String color;
  List data;
  List usersData;
  List descuentos;
  var numDescuentos;
  Color primary = Colors.indigo[900];
  final secondary = Color(0xfff29a94);
  getUsers() async {
    var ruta =
        'https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/' +
            widget.codigoAlumno;
    http.Response response = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/' +
            widget.codigoAlumno);
    http.Response responseDescuentos = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/beneficio/listar/' +
            widget.codigoAlumno);
    var aux;
    setState(() {
      data = json.decode(response.body);
      usersData = data;
      aux = json.decode(responseDescuentos.body);
      descuentos = aux;
      numDescuentos = descuentos.length;
    });

    debugPrint("gaaaa");
    debugPrint(ruta);
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('DETALLE DE PAGOS PROGRAMA', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: <Widget>[
          Text('Descuentos'),
          descuentos.length == 0
              ? Text('Sin descuentos')
              : Expanded(
                  child: ListView.builder(
                  itemCount: descuentos == null ? 0 : descuentos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("${descuentos[index]['benef_max']}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                    "${descuentos[index]['autorizacion']}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("${descuentos[index]['condicion']}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("${descuentos[index]['fecha']}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                    "${descuentos[index]['resolucion']}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          Text("Matricula EPG"),
          Expanded(
              child: ListView.builder(
                  itemCount: usersData == null ? 0 : usersData.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (usersData[index]['validado']) {
                      return Card(
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                        "${usersData[index]['concepto']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("${usersData[index]['idRec']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text("${usersData[index]['fecha']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                        "${usersData[index]['moneda2']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                        "${usersData[index]['importe']}",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500))),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text("CANCELADO",
                                          style: TextStyle(
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              backgroundColor: Colors.green))),
                                )
                              ])));
                    } else {
                      return Card(
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                        "${usersData[index]['concepto']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("${usersData[index]['idRec']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text("${usersData[index]['fecha']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                        "${usersData[index]['moneda2']}",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500))),
                                Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "${usersData[index]['importe']}",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text("NO CANCELADO",
                                          style: TextStyle(
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              backgroundColor: Colors.red))),
                                )
                              ])));
                    }
                  })),
          Text('Enseñanza UPG')
        ],
      ),
    );
  }
}
