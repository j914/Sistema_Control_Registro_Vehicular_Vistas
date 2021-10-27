class DatosVehiculo {
  var id;
  var marcadatosvehiculo;
  var modelomarcavehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var descripciondatosvehiculo;

  DatosVehiculo(
      {this.id,
      this.marcadatosvehiculo,
      this.modelomarcavehiculo,
      this.colordatosvehiculo,
      this.placadatosvehiculo,
      this.descripciondatosvehiculo});

  factory DatosVehiculo.fromJson(Map<String, dynamic> json) {
    return DatosVehiculo(
        id: json['_id'],
        marcadatosvehiculo: json['Marca_DatosVehiculo'],
        modelomarcavehiculo: json['Modelo_MarcaVehiculo'],
        colordatosvehiculo: json['Color_DatosVehiculo'],
        placadatosvehiculo: json['Placa_DatosVehiculo'],
        descripciondatosvehiculo: json['Descripcion_DatosVehiculo']);
  }
}


/*Marca_DatosVehiculo: String, 
    Modelo_MarcaVehiculo: String, 
    Color_DatosVehiculo: String,
    Placa_DatosVehiculo: String,
    Descripcion_DatosVehiculo*/