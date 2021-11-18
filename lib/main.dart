import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:proyecto_final/encuestas.dart';
import 'package:proyecto_final/consultar.dart';
// import 'package:fluttericon_example/src/icon_lists/all_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encuestas COVID-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Encuestas COVID-19'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: Colors.blue[700],
        ),
        backgroundColor: Colors
            .blue[50], //Configurar el color de fondo del cuerpo de contenido

        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Botones(
                title1: "Realizar encuesta",
                icon1: Icons.book,
                bc1: Colors.blue,
              ),
              Botones(
                title1: "Consultar resultados",
                icon1: Icons.search,
                bc1: Colors.blue,
              ),
            ],
          ),
        ));
  }
}

class Botones extends StatelessWidget {
  final String title1;
  final IconData? icon1;
  final MaterialColor? bc1;
  Botones({this.title1 = "", this.icon1, this.bc1});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          switch (title1) {
            case "Realizar encuesta":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Encuestas()),
              );
              break;
            case "Consultar resultados":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Consultar()),
              );
              break;
          }
        }, //accion del evento Onclick del widget Card
        splashColor: Colors.grey[10],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon1, size: 70.0, color: bc1),
              Text(title1, style: new TextStyle(fontSize: 12.0))
            ],
          ),
        ),
      ),
    );
  }
}
