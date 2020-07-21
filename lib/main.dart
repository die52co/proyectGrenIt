import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_itv2/src/bloc/provider.dart';
import 'package:green_itv2/src/pages/clouds_page.dart';
import 'package:green_itv2/src/pages/costos_page.dart';
import 'package:green_itv2/src/pages/home_page.dart';
import 'package:green_itv2/src/pages/login_page.dart';
import 'package:green_itv2/src/pages/registro_page.dart';
import 'package:green_itv2/src/pages/resultados_page.dart';
import 'package:green_itv2/src/preferencias_clouds/preferencias_cloud.dart';
import 'package:green_itv2/src/preferencias_usuarios/preferencias_usuario.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  final prefs2 = PreferenciasCloud();
  await prefs2.initPrefs();
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    

    return Provider(
   child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login'    : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'home'     : (BuildContext context) => HomePage(),
        'costos'   : (BuildContext context) => CostosPage(),
        'clouds'   : (BuildContext context) => CloudsPage(),
        'resultados':(BuildContext context) => ResultadosPage()
      },

      /* theme: ThemeData(
        primaryColor: Colors.greenAccent
      ) */
      theme: ThemeData.dark(),
      //darkTheme: ThemeData.dark()
      
    )
      
      
      
    );
  }
}