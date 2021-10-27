import 'dart:convert';
import 'package:frontend/modelos/DatosVehiculo.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<DatosVehiculo>> listDatosVehiculo() async {
  final response =
      await http.get(Uri.parse('http://192.168.101.6:8000/api/DatosVehiculo'));
  print(response.body);

  return compute(goToList, response.body);
}

List<DatosVehiculo> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['DatosVehiculo']
      .map<DatosVehiculo>((json) => DatosVehiculo.fromJson(json))
      .toList();
}

mapClient(DatosVehiculo datosvehiculo, bool mapId) {
  Map data;
  if (mapId) {
    data = {
      '_id': '${datosvehiculo.id}',
      'Marca_DatosVehiculo': '${datosvehiculo.marcadatosvehiculo}',
      'Modelo_MarcaVehiculo:': '${datosvehiculo.modelomarcavehiculo}',
      'Color_DatosVehiculo': '${datosvehiculo.colordatosvehiculo}',
      'Placa_DatosVehiculo': '${datosvehiculo.placadatosvehiculo}',
      'Descripcion_DatosVehiculo': '${datosvehiculo.descripciondatosvehiculo}'
    };
  } else {
    data = {
      'Marca_DatosVehiculo': '${datosvehiculo.marcadatosvehiculo}',
      'Modelo_MarcaVehiculo': '${datosvehiculo.modelomarcavehiculo}',
      'Color_DatosVehiculo': '${datosvehiculo.colordatosvehiculo}',
      'Placa_DatosVehiculo': '${datosvehiculo.placadatosvehiculo}',
      'Descripcion_DatosVehiculo': '${datosvehiculo.descripciondatosvehiculo}',
    };
  }

  return data;
}

Future<DatosVehiculo> addDatosVehiculo(DatosVehiculo datosvehiculo) async {
  var url = Uri.parse('http://192.168.101.6:8000/api/DatosVehiculo/registro');

  var body = json.encode(mapClient(datosvehiculo, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return DatosVehiculo.fromJson(jsonDecode(response.body)['DatosVehiculo']);
  } else {
    throw Exception('Error al cargar DatosVehiculo');
  }
}

Future<DatosVehiculo> deleteDatosVehiculo(String datosvehiculoId) async {
  print(datosvehiculoId);
  final http.Response response = await http.delete(
    Uri.parse(
        'http://192.168.101.6:8000/api/DatosVehiculo/eliminar/$datosvehiculoId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return DatosVehiculo.fromJson(jsonDecode(response.body)['DatosVehiculo']);
  } else {
    print(response.statusCode);
    throw Exception('Error al eliminar datos de Datosvehiculo');
  }
}

Future<DatosVehiculo> modifyDatosVehiculo(DatosVehiculo datosVehiculo) async {
  var url = Uri.parse('http://192.168.101.6:8000/api/DatosVehiculo/modificar');

  var body = json.encode(mapClient(datosVehiculo, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return DatosVehiculo.fromJson(jsonDecode(response.body)['DatosVehiculo']);
  } else {
    print(response.statusCode);
    throw Exception('Error al modificar datos de  DatosVehiculo');
  }
}
