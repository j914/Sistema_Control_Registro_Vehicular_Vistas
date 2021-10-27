import 'dart:convert';
import 'package:frontend/modelos/DatosIngresoVehiculo.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<DatosIngresoVehiculos>> listDatosIngresoVehiculo() async {
  final response = await http
      .get(Uri.parse('http://192.168.101.6:8000/api/DatosIngresoVehiculo'));
  print(response.body);

  return compute(goToList, response.body);
}

List<DatosIngresoVehiculos> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['DatosIngresoVehiculos']
      .map<DatosIngresoVehiculos>(
          (json) => DatosIngresoVehiculos.fromJson(json))
      .toList();
}

mapClient(DatosIngresoVehiculos datosingresovehiculo, bool mapId) {
  Map data;
  if (mapId) {
    data = {
      '_id': '${datosingresovehiculo.id}',
      'Marca_DatosVehiculo': '${datosingresovehiculo.marcadatosvehiculo}',
      'Modelo_DatosVehiculo': '${datosingresovehiculo.modelodatosvehiculo}',
      'Año_DatosVehiculo': '${datosingresovehiculo.aniodatosvehiculo}',
      'Color_DatosVehiculo': '${datosingresovehiculo.colordatosvehiculo}',
      'Placa_DatosVehiculo': '${datosingresovehiculo.placadatosvehiculo}',
      'FechaEntrada_DatosVehiculo':
          '${datosingresovehiculo.fechaentradadatosvehiculo}',
      'Descripcion_DatosVehiculo':
          '${datosingresovehiculo.descripciondatosvehiculo}'
    };
  } else {
    data = {
      'Marca_DatosVehiculo': '${datosingresovehiculo.marcadatosvehiculo}',
      'Modelo_DatosVehiculo': '${datosingresovehiculo.modelodatosvehiculo}',
      'Año_DatosVehiculo': '${datosingresovehiculo.aniodatosvehiculo}',
      'Color_DatosVehiculo': '${datosingresovehiculo.colordatosvehiculo}',
      'Placa_DatosVehiculo': '${datosingresovehiculo.placadatosvehiculo}',
      'FechaEntrada_DatosVehiculo':
          '${datosingresovehiculo.fechaentradadatosvehiculo}',
      'Descripcion_DatosVehiculo':
          '${datosingresovehiculo.descripciondatosvehiculo}'
    };
  }

  return data;
}

Future<DatosIngresoVehiculos> addDatosIngresoVehiculo(
    DatosIngresoVehiculos datosingresovehiculo) async {
  var url =
      Uri.parse('http://192.168.101.6:8000/api/DatosIngresoVehiculo/registro');

  var body = json.encode(mapClient(datosingresovehiculo, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return DatosIngresoVehiculos.fromJson(
        jsonDecode(response.body)['DatosIngresoVehiculos']);
  } else {
    throw Exception('Error al ingresar los datos DatosVehiculo');
  }
}

Future<DatosIngresoVehiculos> deleteDatosIngresoVehiculo(
    String datosIngresovehiculoId) async {
  print(datosIngresovehiculoId);
  final http.Response response = await http.delete(
    Uri.parse(
        'http://192.168.101.6:8000/api/DatosIngresoVehiculo/eliminar/$datosIngresovehiculoId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return DatosIngresoVehiculos.fromJson(
        jsonDecode(response.body)['DatosIngresoVehiculos']);
  } else {
    print(response.statusCode);
    throw Exception('Error al eliminar datos de Datosvehiculo');
  }
}

Future<DatosIngresoVehiculos> modifyDatosIngresoVehiculo(
    DatosIngresoVehiculos datosingresovehiculo) async {
  var url =
      Uri.parse('http://192.168.101.6:8000/api/DatosIngresoVehiculo/modificar');

  var body = json.encode(mapClient(datosingresovehiculo, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return DatosIngresoVehiculos.fromJson(
        jsonDecode(response.body)['DatosIngresoVehiculos']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify DatosVehiculo');
  }
}
