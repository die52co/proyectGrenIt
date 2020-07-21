import 'package:flutter/material.dart';
import 'package:green_itv2/src/models/servidores_model.dart';
import 'package:green_itv2/src/providers/servidores_providers.dart';
import 'package:green_itv2/src/utils/utils.dart' as utils;

class CloudsPage extends StatefulWidget {


  @override
  _CloudsPageState createState() => _CloudsPageState();
}

class _CloudsPageState extends State<CloudsPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final servidorProvider = ServidoresProvider();
  ServidoresModel servidor = ServidoresModel();
  @override

  bool _guardando = false;

  Widget build(BuildContext context) {

    final ServidoresModel servData = ModalRoute.of(context).settings.arguments;
    if(servData != null){
      servidor = servData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Costos Cloud'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child:Form(
            key:formKey,
            child:Column(
              children:<Widget>[
                _crearProcesador(),
                _crearRam(),
                _crearNroServer(),
                _crearAlmacenamiento(),
                _crearBaseDatos(),
                _crearBoton()
              ]
            )
          )
        ) ,
      ),
      
    );
  }

  Widget _crearProcesador(){

    return TextFormField(
      initialValue: servidor.procesadores.toString(),
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Procesadores'
      ),
      onSaved: (value) => servidor.procesadores = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      },
    );
  }
  Widget _crearRam(){

    return TextFormField(
      initialValue: servidor.memoriaRam.toString(),
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Memoria Ram'
      ),
      onSaved: (value) => servidor.memoriaRam = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearNroServer(){

    return TextFormField(
      initialValue: servidor.nroServi.toString(),
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'nro servidores'
      ),
      onSaved: (value) => servidor.nroServi = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearAlmacenamiento(){

    return TextFormField(
      initialValue: servidor.almacenamiento.toString(),
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Almacenamiento'
      ),
      onSaved: (value) => servidor.almacenamiento = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearBaseDatos(){

    return TextFormField(
      initialValue:servidor.baseDatos,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Tipo de base de datos'
      ),
      onSaved: (value) => servidor.baseDatos = value,
      validator: (value){
        if(value.length < 3){
          return 'Ingrese el nombre del producto';
        }else{
          return null;
        }
      },
    );
  }

Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando)? null : _submit,
    );
  }

  void _submit(){

   if( !formKey.currentState.validate()) return;

      formKey.currentState.save();

    /*   print('todo bien');

      print(producto.titulo);
      print(producto.valor);
      print(producto.disponible);

 */
      //para no apretar dos veces el boton
      

      setState(() {
        _guardando = true;
      });
      

      if(servidor.id == null){
        servidorProvider.crearServidor(servidor);
      }else{
        servidorProvider.editarServidor(servidor);
      }
      /* setState(() {
        _guardando = false;
      }); */
      
      mostrarSnackbar('Registro guardado');

      Navigator.pop(context);

  }

  void mostrarSnackbar(String mensaje ){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

}