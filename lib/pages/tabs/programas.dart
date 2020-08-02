import 'package:fisi_army/pages/detailPayment_page.dart';
import 'package:flutter/material.dart';

class ProgramasWidget extends StatelessWidget {
  final String dni;

  const ProgramasWidget({Key key, this.dni}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DetailPage(dni: dni,),
    );
  }
}