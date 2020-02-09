import 'package:flutter/material.dart';
import '../share_prefs/preferencias_usuario.dart';
import '../widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName ='setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Es bueno inicializarlo por los errores que pueden tener
  bool _colorSecundario=false;
  int _genero=1;

  TextEditingController _textController ;
  final prefs = new PreferenciasUsuario();

  @override
  void initState(){
    super.initState();  

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = SettingsPage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
        backgroundColor: (prefs.colorSecundario)?Colors.teal: Colors.blue,
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
              prefs.colorSecundario = value;
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
                prefs.nombreUsuario = value;
              },
            )  ,
          )
        ],
      )
    );
  }
}