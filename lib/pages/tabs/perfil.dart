import 'package:flutter/material.dart';

import '../perfil_page.dart';

class PerfilWidget extends StatelessWidget {
  final  Map<String, dynamic>  usuario;

  const PerfilWidget({Key key, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PerfilUsuario(usuario: usuario),
    );
  }
}
