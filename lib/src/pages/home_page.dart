

import 'package:flutter/material.dart';
import 'package:green_itv2/src/pages/clouds_page.dart';
import 'package:green_itv2/src/pages/costos_page.dart';
import 'package:green_itv2/src/pages/tco_page.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://i.pinimg.com/originals/71/01/24/7101244a776d6f7f676352accdb7f972.png'), 
            fit: BoxFit.cover,
            ),         
          )
        ),
        Scaffold(
     
     //backgroundColor: Color.fromRGBO(57, 62, 55, 0),
     /* appBar: AppBar(
       //title: Text('Grenn IT Home Page'),
     backgroundColor: Colors.transparent, 
     brightness: Brightness.light,
     ), 
     */
    
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: const EdgeInsets.all(20.0),
         children: <Widget>[
           _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(context),
          SizedBox(height: 10.0),
          _cardTipo3(context)
         ],
       ),

     ),
     
     
     /* ListView(
       
       
  
       
       padding: EdgeInsets.all(10.0),
       children: <Widget>[
         
      
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(context),
          SizedBox(height: 10.0),
          _cardTipo3(context)
       ], */
     
       floatingActionButton: FloatingActionButton(
       child: Icon(Icons.people),
       onPressed: (){
         _perfil(context);
       },
     ),
   ),






   ],

   );
    
 
  }

   void _tco(BuildContext context){

    final route = MaterialPageRoute(
      builder: (context){
        return TCOPage();
      });
   Navigator.push(context, route);
   }

   void _cloud(BuildContext context){
     final route = MaterialPageRoute(
       builder: (context){
         return CostosPage();

       }
     );
    Navigator.push(context, route);
   }

    void _perfil(BuildContext context){
     final route = MaterialPageRoute(
       builder: (context){
         return CloudsPage();

       }
     );
    Navigator.push(context, route);
   }

 Widget _cardTipo1(BuildContext context){

    return Card(
      
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.settings_system_daydream, color: Colors.green, size: 50.0,),
          title: Text('Calculadora TCO'),
          subtitle: Text('Ingrese la cantidad de componentes que necesite y conozca los valores al llevarlo a cloud '),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //FlatButton(child: Text('Cancelar'),onPressed: (){},),
            FlatButton(child: Text('Entrar'),onPressed: (){
              _tco(context);
            },)
          ],
        )
          
      ],),

    );
  }

  Widget _cardTipo2(){

    //Este es un container que parece card

    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://i.postimg.cc/L8ZqKdMg/idynatron.png'),
            //image: NetworkImage('https://www.zonamovilidad.es/fotos/2/tecnologias-verdes-dia-de-la-tierra_thumb_728.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif') ,
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            
          ),

          /* Image(
            image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg')
          ), */
          //Container(child: Text('Nose xdddd'),)
        ],
      ),
    
    
    
    
    );

    return Container(decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(20.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black26,
        blurRadius: 10.0,
        spreadRadius: 2.0,
        offset: Offset(2.0, 10.0)
        )
      ]
    
    
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child:card ,
    ),
    );
    
  }
  Widget _cardTipo3(BuildContext context){

    return Card(

      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.cloud, color: Colors.deepPurpleAccent, size: 50.0
          ),
          title: Text('Precios Fijos'),
          subtitle: Text('Conocer los precios '),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //FlatButton(child: Text('Cancelar'),onPressed: (){},),
            FlatButton(child: Text('Entrar'),onPressed: (){
              _cloud(context);
            },)
          ],
        )
          
      ],),


    );
  }

  
}