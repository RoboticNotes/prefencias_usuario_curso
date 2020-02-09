import 'package:flutter/material.dart';
import 'src/share_prefs/preferencias_usuario.dart';
import 'src/pages/home_page.dart';
import 'src/pages/settings_page.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: 'home',
      routes: {
        Homepage.routeName: (BuildContext context)=>Homepage(),
        SettingsPage.routeName: (BuildContext context)=>SettingsPage(),
      },
    );
  }
}