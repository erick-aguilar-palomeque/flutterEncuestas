CREATE TABLE encuestados(
    folio_encuesta int AUTOINCREMENT primary key,
    nombre_persona text not null,
    correo text not null,
    numero_habitantes int not null,
    numero_vacunados int not null,
    direccion text not null,
    codigo_postal text not null,
    fecha_encuesta date
);
