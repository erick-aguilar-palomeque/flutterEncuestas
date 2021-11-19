import 'package:flutter/material.dart';
import 'sql_helpers.dart';
import 'Encuesta.dart';

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

        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: const TableComponent(),
            )
          ],
        ));
  }
}

class TableComponent extends StatefulWidget {
  const TableComponent({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    print("Llamando al TableState");
    return TableState();
  }
}

class TableState extends State<TableComponent> {
  bool bandera = false;

  List<Map<String, dynamic>> data = [];
  List<DataRow> dataList = [];

  List<DataRow> mapListToList(List<Map<String, dynamic>> data) {
    List<DataRow> rows = [];

    for (Map<String, dynamic> encuestaMap in data) {
      DataRow row = DataRow(
        cells: <DataCell>[
          DataCell(Text(encuestaMap["folio_encuesta"].toString())),
          DataCell(Text(encuestaMap["nombre_persona"])),
          DataCell(Text(encuestaMap["correo"])),
          DataCell(Text(encuestaMap["numero_habitantes"].toString())),
          DataCell(Text(encuestaMap["numero_vacunados"].toString())),
          DataCell(Text(encuestaMap["direccion"])),
          DataCell(Text(encuestaMap["codigo_postal"])),
          DataCell(Text(encuestaMap["fecha_encuesta"])),
        ],
      );
      rows.add(row);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[400],
          onPrimary: Colors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          minimumSize: Size(double.infinity, 40), //////// HERE
        ),
        onPressed: () async {
          /*ACTUALIZAR TABLA*/
          data = await SQLHelper.findAll();
          print(data);
          dataList = mapListToList(data);
          print(dataList);
          setState(() {
            bandera = true;
          });
        },
        child: const Text('Actualizar tabla'),
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Nombre',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Correo',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Habitantes',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Vacunados',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Dirección',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Código postal',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha registro',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: dataList,
          )),
    ]);
  }
}
