import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    // var databasesPath = await sql.getDatabasesPath();
    // String path = sql.join(databasesPath, 'demo.db');
    await database.execute("""
      CREATE TABLE encuestados(
        folio_encuesta INTEGER primary key,
        nombre_persona text not null,
        correo text not null,
        numero_habitantes INTEGER not null,
        numero_vacunados INTEGER not null,
        direccion text not null,
        codigo_postal text not null,
        fecha_encuesta datetime
    );
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    print("Abriendo db");
    return sql.openDatabase(
      'encuestas.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> insert(
      String nombre,
      String correo,
      String numeroHabitantes,
      String numeroVacunados,
      String direccion,
      String codigoPostal,
      DateTime fecha) async {
    print("Insertando");
    final db = await SQLHelper.db();

    final data = {
      'nombre_persona': nombre,
      'correo': correo,
      'numero_habitantes': numeroHabitantes,
      'numero_vacunados': numeroVacunados,
      'direccion': direccion,
      'codigo_postal': codigoPostal,
      'fecha_encuesta': fecha.toString()
    };
    final id = await db.insert('encuestados', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("Despues de insertar");
    print("inserto: " + id.toString());
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> findAll() async {
    print("Entra buscar la data");
    // try {
    final db = await SQLHelper.db();
    print("Antes de la consulta");
    return await db.query('encuestados', orderBy: "folio_encuesta");
    // } on Exception catch (e) {
    //   print("Algo fallo en la consulta");
    //   print(e);
    //   return [];
    // }
  }
}
