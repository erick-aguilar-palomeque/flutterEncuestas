class Encuesta {
  Encuesta({
    this.folioEncuesta = 0,
    this.nombrePersona = "",
    this.correo = "",
    this.numeroHabitantes = 0,
    this.numeroVacunados = 0,
    this.direccion = "",
    this.codigoPostal = "",
    this.fechaEncuesta = "",
  });
  int folioEncuesta;
  String nombrePersona;
  String correo;
  int numeroHabitantes;
  int numeroVacunados;
  String direccion;
  String codigoPostal;
  String fechaEncuesta;

  // factory Encuesta.fromJson(Map<String, dynamic> json) => Encuesta(
  // 	id: json["id"],
  // 	correo: json["correo"],
  // 	totalHabitantes : json["total_habitantes"],
  // 	vacunadas : json["vacunadas"],
  // 	direccion : json["direccion"],
  // 	codigoPostal : json["codigoPostal"],
  // 	fecha : json["fecha"],
  // );

  // Map<String, dynamic> toJson() =>{
  // 	"id": id,
  // 	"correo": correo,
  // 	"total" :
  // };

}
