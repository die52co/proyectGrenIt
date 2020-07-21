
import 'package:flutter/material.dart';
import 'package:green_itv2/src/models/servidores_model.dart';
import 'package:green_itv2/src/pages/tco_page.dart';
import 'package:green_itv2/src/preferencias_clouds/preferencias_cloud.dart';
import 'package:green_itv2/src/providers/servidores_providers.dart';
//import 'package:green_itv2/src/pages/tco_page.dart';

class CostosPage extends StatelessWidget {
  
  final servidoresProvider = ServidoresProvider();
 
  final prefs2 = PreferenciasCloud();
  @override
  Widget build(BuildContext context) {
    //final costo = CostosPage();
  
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Costos'),
      ),
      body: _crearListado(),

    );
  }

  Widget _crearListado(){

    return FutureBuilder(
        future: servidoresProvider.cargarServidor(),
        builder: (BuildContext context, AsyncSnapshot<List<ServidoresModel>>snapshot){
          if(snapshot.hasData){
            final servidores = snapshot.data;

            return ListView.builder(
              itemCount: servidores.length,
              itemBuilder: (context, i) => _crearItem1(context, servidores[i]), 
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },


    );
  }

  

  

  /* Widget _crearTitulo(BuildContext context){
    return ListTile(
        leading: FlutterLogo(),
        title: Text('Costos '),
        trailing: Icon(Icons.more_vert),
      );
  } */

  Widget _crearItem1(BuildContext context, ServidoresModel servidor){

    
    

   // double costproce = servidor.procesadores ;
    return ListTile(
          title: Text('Procesadores: ${ servidor.procesadores}'),
          subtitle: Text('Ram:  ${ servidor.memoriaRam} - ${ prefs2.ram}'),
          leading: Icon(Icons.data_usage),
          trailing: Icon(Icons.delete)
          );

  }

 
}