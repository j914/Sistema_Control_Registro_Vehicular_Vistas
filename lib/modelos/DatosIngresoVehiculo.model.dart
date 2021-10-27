class DatosIngresoVehiculos {
  var id;
  var marcadatosvehiculo;
  var modelodatosvehiculo;
  var aniodatosvehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var fechaentradadatosvehiculo;
  var descripciondatosvehiculo;

  DatosIngresoVehiculos(
      {this.id,
      this.marcadatosvehiculo,
      this.modelodatosvehiculo,
      this.aniodatosvehiculo,
      this.colordatosvehiculo,
      this.placadatosvehiculo,
      this.fechaentradadatosvehiculo,
      this.descripciondatosvehiculo});

  factory DatosIngresoVehiculos.fromJson(Map<String, dynamic> json) {
    return DatosIngresoVehiculos(
        id: json['_id'],
        marcadatosvehiculo: json['Marca_DatosVehiculo'],
        modelodatosvehiculo: json['Modelo_DatosVehiculo'],
        aniodatosvehiculo: json['Año_DatosVehiculo'],
        colordatosvehiculo: json['Color_DatosVehiculo'],
        placadatosvehiculo: json['Placa_DatosVehiculo'],
        fechaentradadatosvehiculo: json['FechaEntrada_DatosVehiculo'],
        descripciondatosvehiculo: json['Descripcion_DatosVehiculo']);
  }
}
