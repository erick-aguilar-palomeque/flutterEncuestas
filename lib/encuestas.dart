import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sql_helpers.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
// void main() => runApp(const MyApp());

class Encuestas extends StatelessWidget {
  const Encuestas({Key? key}) : super(key: key);

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
              child: const MyCustomForm(),
            )
          ],
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   const appTitle = 'Realizar encuesta';

  //   return MaterialApp(
  //     title: appTitle,
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text(appTitle),
  //       ),
  //       body: const MyCustomForm(),
  //     ),
  //   );
  // }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    DateTime date = DateTime.now();
    final nombre = TextEditingController();
    final correo = TextEditingController();
    final numHabitantes = TextEditingController();
    final numVacunados = TextEditingController();
    final direccion = TextEditingController();
    final codigoPostal = TextEditingController();
    final fechaRegistro = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nombre,
            decoration: InputDecoration(
                icon: Icon(Icons.account_circle), hintText: "Nombre completo"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Intruduzca un valor';
              }
              return null;
            },
          ),
          TextFormField(
            controller: correo,
            decoration: InputDecoration(
                icon: Icon(Icons.email_rounded), hintText: "Correo"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              String texto = value.toString().trim();
              if (texto.isEmpty) {
                return 'Ingrese un correo';
              }
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);

              if (!regex.hasMatch(texto))
                return 'Ingrese un correo válido';
              else
                return null;
            },
          ),
          TextFormField(
            controller: numHabitantes,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
                icon: Icon(Icons.people_alt), hintText: "Total de habitantes"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Intruduzca un valor';
              }
              return null;
            },
          ),
          TextFormField(
            controller: numVacunados,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
                icon: Icon(Icons.volunteer_activism_rounded),
                hintText: "Personas vacunadas"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Intruduzca un valor';
              }
              return null;
            },
          ),
          TextFormField(
            controller: direccion,
            decoration: InputDecoration(
                icon: Icon(Icons.location_on), hintText: "Dirección"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Intruduzca un valor';
              }
              return null;
            },
          ),
          TextFormField(
            controller: codigoPostal,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
                icon: Icon(Icons.location_history), hintText: "Código postal"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Intruduzca un valor';
              }
              return null;
            },
          ),
          Text("Fecha de registro"),
          Container(
            height: 80,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                print("fecha: " + newDateTime.toString());
                date = newDateTime;
                // Do something
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
                onPrimary: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(double.infinity, 40), //////// HERE
              ),
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                print(await SQLHelper.findAll());
                if (_formKey.currentState!.validate()) {
                  print("nombre: " + nombre.text);
                  print("correo: " + correo.text);
                  print("numHabitantes: " + numHabitantes.text);
                  print("numVacunados: " + numVacunados.text);
                  print("direccion: " + direccion.text);
                  print("codigoPostal: " + codigoPostal.text);
                  print("fecha: " + date.toString());
                  /**INSERTANDO*/
                  int idInsertado = await SQLHelper.insert(
                      nombre.text,
                      correo.text,
                      numHabitantes.text,
                      numVacunados.text,
                      direccion.text,
                      codigoPostal.text,
                      date);
                  print("id insertado: " + idInsertado.toString());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyApp()),
                  // );
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Registro almacenado correctamente')),
                  );
                }
              },
              child: const Text('Realizar registro'),
            ),
          ),
        ],
      ),
    );
  }
}
