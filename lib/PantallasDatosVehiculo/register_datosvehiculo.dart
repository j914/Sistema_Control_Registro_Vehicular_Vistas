import 'package:frontend/modelos/DatosVehiculo.model.dart';
import 'package:frontend/pantallas/text_box.dart';
import 'package:frontend/peticiones/DatosVehiculo.peticion.dart';
import 'package:flutter/material.dart';

class RegisterDatosVehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterDatosVehiculo();
}

/*
 var marcadatosvehiculo;
  var modelomarcavehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var descripciondatosvehiculo;
  */

class _RegisterDatosVehiculo extends State<RegisterDatosVehiculo> {
  TextEditingController controllermarcadatosvehiculo;
  TextEditingController controllermodelomarcavehiculo;
  TextEditingController controllercolordatosvehiculos;
  TextEditingController controllerplacadatosvehiculo;
  TextEditingController controllerdescripciondatosvehiculo;

  @override
  void initState() {
    controllermarcadatosvehiculo = new TextEditingController();
    controllermodelomarcavehiculo = new TextEditingController();
    controllercolordatosvehiculos = new TextEditingController();
    controllerplacadatosvehiculo = new TextEditingController();
    controllerdescripciondatosvehiculo = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registre los Datos del vehiculo Con Reporte de Robo"),
        ),
        body: ListView(
          children: [
            TextBox(controllermarcadatosvehiculo, "Marca del Vehiculo"),
            TextBox(controllermodelomarcavehiculo, "Modelo del Vehiculo"),
            TextBox(controllercolordatosvehiculos, "Color del vehiculo"),
            TextBox(
                controllerplacadatosvehiculo, "Numero de placa del vehiculo"),
            TextBox(controllerdescripciondatosvehiculo, "Descripcion Extra "),
            ElevatedButton(
                onPressed: () {
                  String marcadatosvehiculo = controllermarcadatosvehiculo.text;
                  String modelomarcavehiculo =
                      controllermodelomarcavehiculo.text;
                  String colordatosvehiculo =
                      controllercolordatosvehiculos.text;
                  String placadatosvehiculo = controllerplacadatosvehiculo.text;
                  String descripciondatosvehiculo =
                      controllerdescripciondatosvehiculo.text;

                  if (marcadatosvehiculo.isNotEmpty &&
                      modelomarcavehiculo.isNotEmpty &&
                      colordatosvehiculo.isNotEmpty &&
                      placadatosvehiculo.isNotEmpty &&
                      descripciondatosvehiculo.isNotEmpty) {
                    DatosVehiculo c = new DatosVehiculo(
                        marcadatosvehiculo: marcadatosvehiculo,
                        modelomarcavehiculo: modelomarcavehiculo,
                        colordatosvehiculo: colordatosvehiculo,
                        placadatosvehiculo: placadatosvehiculo,
                        descripciondatosvehiculo: descripciondatosvehiculo);

                    addDatosVehiculo(c).then((datosvehiculo) {
                      if (datosvehiculo.id != '') {
                        print('Datos del vehiculo registrado...!');
                        Navigator.pop(context, datosvehiculo);
                      }
                    });
                  }
                },
                child: Text("Guardar Datos del Vehiculo")),
          ],
        ));
  }
}

/*
 var marcadatosvehiculo;
  var modelomarcavehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var descripciondatosvehiculo;
  */