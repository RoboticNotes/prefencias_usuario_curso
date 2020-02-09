import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import '../widgets/menu_widget.dart';

class Homepage extends StatelessWidget {

  static final String routeName ='home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = Homepage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        centerTitle: true,
        backgroundColor: (prefs.colorSecundario)?Colors.teal: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }




}