
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:green_itv2/src/models/servidores_model.dart';
import 'package:green_itv2/src/preferencias_usuarios/preferencias_usuario.dart';

class ServidoresProvider{

  final String _url = 'https://greenit-48a8e.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearServidor(ServidoresModel servidor) async {

    final url = '$_url/costosclouds.json?auth=${ _prefs.token}';

    final resp = await http.post(url, body: servidoresModelToJson(servidor) );

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
    
  }

  Future<bool> editarServidor(ServidoresModel servidor) async {

    final url = '$_url/costosclouds/${ servidor.id}.json?auth=${ _prefs.token}';

    final resp = await http.put(url, body: servidoresModelToJson(servidor) );

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
    
  }

  Future<List<ServidoresModel>> cargarServidor() async{

    final url = '$_url/costosclouds.json?auth=${_prefs.token}';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ServidoresModel> servidores = new List ();

    if (decodedData == null) return [];

    decodedData.forEach((id, serv) {

    final servTemp = ServidoresModel.fromJson(serv);

    servTemp.id = id;

    servidores.add(servTemp);

     });

     return servidores;

  }

  Future<int> borrarServidores(String id) async{

    final url = '$_url/costosclouds/$id.json?auth=${_prefs.token}';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;


  }





}