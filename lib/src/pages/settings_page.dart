import 'package:flutter/material.dart';
import '../widgets/menu_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName ='setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario= true;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController ;

  @override
  void initState() async {
    super.initState();

    cargarPref();

    _textController = new TextEditingController(text: _nombre);
  }

  cargarPref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }

  _setSelectedRadio(int valor)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', valor);

    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ), 
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color seccundario'),
            onChanged: (value){
              _colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono'
              ),
              onChanged: (value){
                
              },
            )  ,
          )
        ],
      )
    );
  }
}