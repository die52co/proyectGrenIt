import 'dart:convert';
import 'package:green_itv2/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyD7OrOsR6bOP2reO85s1eSufAoTXV-jnls';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password)async{

     final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
       body: json.encode(authData)
      
    );
  Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);


    if(decodedResp.containsKey('idToken')){

      _prefs.token = decodedResp['idToken'];
      // Salvar el token en el storage
      return{'ok':true, 'token': decodedResp['idToken']};
    }else{

      //saltar una alerta pa que se vea mas bonito
      return{'ok':false, 'mensaje': decodedResp['error']['message']};
    }
  }
  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{

    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
       body: json.encode(authData)
      
    );
  Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);


    if(decodedResp.containsKey('idToken')){

      _prefs.token = decodedResp['idToken'];
      // Salvar el token en el storage
      return{'ok':true, 'token': decodedResp['idToken']};
    }else{

      //saltar una alerta pa que se vea mas bonito
      return{'ok':false, 'mensaje': decodedResp['error']['message']};
    }

    
  }
}