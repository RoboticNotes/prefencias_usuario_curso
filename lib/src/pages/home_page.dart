import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import '../widgets/menu_widget.dart';

class Homepage extends StatelessWidget {

  static final String routeName ='home';

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();


    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario'),
          Divider(),
        ],
      ),
    );
  }




}