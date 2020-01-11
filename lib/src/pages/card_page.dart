import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all( 10.0 ),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2()
        ],
      ),
    );
  }

  _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Aqui va la descripcion de la tarjeta para tener una idea de lo que se mostrará'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  _cardType2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage('https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Algun texto aleatorio'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}