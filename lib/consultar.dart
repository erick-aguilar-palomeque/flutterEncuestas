import 'package:flutter/material.dart';

class Consultar extends StatelessWidget {
  const Consultar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Consultar resultados"),
          backgroundColor: Colors.blue[700],
        ),
        backgroundColor: Colors
            .blue[50], //Configurar el color de fondo del cuerpo de contenido

        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[],
          ),
        ));
  }
}
