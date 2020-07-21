import 'package:flutter/material.dart';
import 'package:green_itv2/src/preferencias_clouds/preferencias_cloud.dart';
//import 'package:green_itv2/src/pages/costos_page.dart';
export 'package:green_itv2/src/pages/tco_page.dart';
//import 'package:green_itv2/src/utils/utils.dart' as utils;


class TCOPage extends StatefulWidget {


  

  @override
  TCOPageState createState() => TCOPageState();
}

class TCOPageState extends State<TCOPage> {

  

  /* String procesador = "";
  String ram = '';
  String cantidad = '';
  String almacenamiento = ''; */

  double _procesador = 1.0;
  double _ram = 1.0;
  double _cantidad = 1.0;
  double _almacenamiento = 100.0;

  final prefs2 = PreferenciasCloud();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _procesador= prefs2.procesador;
    _ram = prefs2.ram;
    _cantidad = prefs2.nroServ;
    _almacenamiento = prefs2.almacenamiento;
  }

  
  
  /* String opcionSeleccionada = 'Sin DB';
  List<String> baseDatos = ['Sin DB', 'MongoDB', 'SQL']; */

  //get data => procesador;

  

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/fondo.jpg'), 
            fit: BoxFit.cover,
            ),         
          ),
          
        ),
        Scaffold(
      //backgroundColor: Color.fromRGBO(57, 62, 55, 0),
       appBar: AppBar(
         title: Text('Calculadora TCO'),
         //backgroundColor: Colors.transparent,
       ),
       body: ListView(
         padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
         children: <Widget>[
           _crearProcesador(),
           Divider(),
           _crearRam(),
           Divider(),
           _crearCantidad(),
           Divider(),
           _crearAlmacenamiento(),
           Divider(),
           /* ListTile(
          
           title: Text('Seleccionar Base de datos'),
           subtitle: Text('Escoga una opcion para su base de datos'),

           ), */
           //_crearDropdown(),
           //Divider(),
          Center(
    
            child: RaisedButton(
            child: Text('Ingresar Datos'),
            color: Colors.lightBlue,
            onPressed: () => _crearBoton(context),
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),   
          )

           



         ],
       ),
      ),
    ],
  );
    
}
  
Widget _crearProcesador() {

  return TextFormField(

      //autofocus: true,
      //initialValue: procesador.toString(),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
         // counter: Text('Letras ${ _nombre.length }'),
          hintText: 'Cores Procesador',
          labelText: 'Cores Procesador',
          helperText: 'Ingrese cantidad de cores del procesador',
          suffixIcon: Icon(Icons.cloud_circle),
          icon: Icon(Icons.cloud)

      ),
      /* onSaved: (valor) => double.parse(valor),
      validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      }, */

      onChanged: (valor){

      prefs2.procesador = double.parse(valor);
    
    //print(_nombre);

    /* setState(() {
       procesador = valor;
    }); */
  
  },
/*   validator: (value){
        if (utils.isNumeric(value)){
            return null;
        }else{
          return 'Solo numeros';
        }
      }, */

  );

}
Widget _crearRam() {

  return TextField(

      //autofocus: true,

      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
         // counter: Text('Letras ${ _nombre.length }'),
          hintText: 'RAM',
          labelText: 'Memoria RAM',
          helperText: 'Ingrese memoria RAM',
          suffixIcon: Icon(Icons.memory),
          icon: Icon(Icons.laptop_chromebook)

      ),
  onChanged: (valor){

      prefs2.ram = double.parse(valor);
    //print(_nombre);

    setState(() {
       prefs2.ram = double.parse(valor);
    });
  },

  );

}

Widget _crearCantidad() {

  return TextField(

      //autofocus: true,

      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
         // counter: Text('Letras ${ _nombre.length }'),
          hintText: 'n° servidores',
          labelText: 'N° de Servidores',
          helperText: 'Ingrese cantidad de servidores',
          suffixIcon: Icon(Icons.devices_other),
          icon: Icon(Icons.devices)

      ),
  onChanged: (valor){

      prefs2.nroServ = double.parse(valor);
    //print(_nombre);

    /* setState(() {
       cantidad = valor;
    }); */
  },

  );

}

Widget _crearAlmacenamiento() {

  return TextField(

      //autofocus: true,

      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
         // counter: Text('Letras ${ _nombre.length }'),
          hintText: 'Almacenamiento',
          labelText: 'Almacenamiento de Servidor',
          helperText: 'Ingrese la memoria de almacenamiento',
          suffixIcon: Icon(Icons.sd_storage),
          icon: Icon(Icons.storage)

      ),
  onChanged: (valor){

      prefs2.almacenamiento = double.parse(valor);
   
    //print(_nombre);

   /*  setState(() {
       almacenamiento = valor;
    }); */
  },

  );

}

/* List<DropdownMenuItem<String>> getOpcionesDropdown(){

  List<DropdownMenuItem<String>> lista = new List();

  baseDatos.forEach((poder) { 
    lista.add(DropdownMenuItem(
      child: Text(poder),
      value: poder,

    ));
  });

  return lista;
} */

/* Widget _crearDropdown(){

  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),
      
      DropdownButton(
        
        value: opcionSeleccionada,
        items: getOpcionesDropdown(),
        
        onChanged: (opt){
          
          setState(() {
            opcionSeleccionada = opt;
          });
        },
      ),
      
    ],
  );
  
  
} */






  void _crearBoton(BuildContext context){

  showDialog(
        
        context: context,
        barrierDismissible: false,
        builder: (context){

      if(_procesador == 0   || _ram == 0 || _cantidad== 0 || _almacenamiento== 0){

            return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Error al ingresar datos'),
            //content: Text('Contenido'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Por favor completar todos los campos'),
                //FlutterLogo(size: 100.0)


              ],
            ),
            
            actions: <Widget>[
              FlatButton(
                child: Text('Volver'),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
                FlatButton(
                child: Text('Continuar'),
                onPressed: (){
                 // Navigator.pushReplacementNamed(context, 'costos');
                 //Navigator.push(context, MaterialPageRoute(builder: (context)=>CostosPage(data: data)));
                },
              )
            ],
            
          );
      }else{
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Datos Ingresador correctamente'),
            //content: Text('Contenido'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Calculo realizado'),
                FlutterLogo(size: 100.0)


              ],
            ),
            
            actions: <Widget>[
              FlatButton(
                child: Text('Volver'),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
                FlatButton(
                child: Text('Continuar'),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, 'costos');
                },
              )
            ],
            
          );
      }
          
          
      }
        
      );

}



}




