import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasCloud{

  static final PreferenciasCloud _instancia = new PreferenciasCloud._internal();

  factory PreferenciasCloud(){

    return _instancia;
  }

  PreferenciasCloud._internal();

  SharedPreferences _prefs2;

  initPrefs() async{
    this._prefs2 = await SharedPreferences.getInstance();
  }

  //Ninguna de estas propiedades se usa

  /* bool   _colorSecundario;
  int    _genero;
  String _nombre; */

  //GET Y SET DEL GENERO

  get procesador{

    return _prefs2.getDouble('procesador') ?? 1.0;
  }

  set procesador(double value){
    _prefs2.setDouble('procesador', value);
  }

  get ram{
    
    return _prefs2.getDouble('ram' ?? 1.0);
  }

  set ram(double value){
    _prefs2.setDouble('ram', value);
  }

  get nroServ{
    return _prefs2.getDouble('nroServ' ?? 1.0);

  }

  set nroServ(double value){

    _prefs2.setDouble('nroServ', value);

  }

  get almacenamiento{
    return _prefs2.getDouble('almacenamiento' ?? 100.0);

  }

  set almacenamiento(double value){

    _prefs2.setDouble('almacenamiento', value);
  }





  //GET Y SET DEL color secundario

  /* get colorSecundario{

    return _prefs2.getBool('colorSecundario') ?? false;
  } */

 /*  set colorSecundario(bool value){
    _prefs2.setBool('colorSecundario', value);
  } */

  //GET Y SET DEL NOMBRE

  /* get nombreUsuario{

    return _prefs2.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value){
    _prefs2.setString('nombreUsuario', value);
  } */

  //GET Y SET DEL NOMBRE

/*   get ultimaPagina{

    return _prefs2.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value){
    _prefs2.setString('ultimaPagina', value);
  } */


}