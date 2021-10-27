import 'package:frontend/modelos/DatosIngresoVehiculo.model.dart';
import 'package:frontend/pantallas/text_box.dart';
import 'package:frontend/peticiones/DatosIngresoVehiculos.peticiones.dart';
import 'package:flutter/material.dart';

class RegisterDatosIngresoVehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterDatosIngresoVehiculo();
}

/*
 var marcadatosvehiculo;
  var modelomarcavehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var descripciondatosvehiculo;
  */

class _RegisterDatosIngresoVehiculo
    extends State<RegisterDatosIngresoVehiculo> {
  TextEditingController controllermarcadatosvehiculo;
  TextEditingController controllermodelodatosvehiculo;
  TextEditingController controlleraniodatosvehiculo;
  TextEditingController controllercolordatosvehiculo;
  TextEditingController controllerplacasdatosvehiculo;
  TextEditingController controllerfechaentradatosvehiculo;
  TextEditingController controllerdescripciondatosvehiculo;

  @override
  void initState() {
    controllermarcadatosvehiculo = new TextEditingController();
    controllermodelodatosvehiculo = new TextEditingController();
    controlleraniodatosvehiculo = new TextEditingController();
    controllercolordatosvehiculo = new TextEditingController();
    controllerplacasdatosvehiculo = new TextEditingController();
    controllerfechaentradatosvehiculo = new TextEditingController();
    controllerdescripciondatosvehiculo = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ingreso de datos del vehiculo"),
        ),
        body: ListView(
          children: [
            TextBox(controllermarcadatosvehiculo, "Marca del Vehiculo"),
            TextBox(controllermodelodatosvehiculo, "Modelo del Vehiculo"),
            TextBox(controlleraniodatosvehiculo, "Año del Vehiculo"),
            TextBox(controllercolordatosvehiculo, "Color del Vehiculo"),
            TextBox(controllerplacasdatosvehiculo, "Placas del vehiculo"),
            TextBox(controllerfechaentradatosvehiculo, "Fecha"),
            TextBox(
                controllerdescripciondatosvehiculo, "Descripcion Del Escaner "),
            ElevatedButton(
                onPressed: () {
                  String marcadatosvehiculo = controllermarcadatosvehiculo.text;

                  String modelodatosvehiculo =
                      controllermodelodatosvehiculo.text;

                  String aniodatosvehiculo = controlleraniodatosvehiculo.text;

                  String colordatosvehiculo = controllercolordatosvehiculo.text;
                  String placasdatosvehiculo =
                      controllerplacasdatosvehiculo.text;
                  String fechaentradadatosvehiculo =
                      controllerfechaentradatosvehiculo.text;
                  String descripciondatosvehiculo =
                      controllerdescripciondatosvehiculo.text;

                  if (marcadatosvehiculo.isNotEmpty &&
                      modelodatosvehiculo.isNotEmpty &&
                      aniodatosvehiculo.isNotEmpty &&
                      colordatosvehiculo.isNotEmpty &&
                      placasdatosvehiculo.isNotEmpty &&
                      fechaentradadatosvehiculo.isNotEmpty &&
                      descripciondatosvehiculo.isNotEmpty) {
                    DatosIngresoVehiculos c = new DatosIngresoVehiculos(
                        marcadatosvehiculo: marcadatosvehiculo,
                        modelodatosvehiculo: modelodatosvehiculo,
                        aniodatosvehiculo: aniodatosvehiculo,
                        colordatosvehiculo: colordatosvehiculo,
                        placadatosvehiculo: placasdatosvehiculo,
                        fechaentradadatosvehiculo: fechaentradadatosvehiculo,
                        descripciondatosvehiculo: descripciondatosvehiculo);

                    addDatosIngresoVehiculo(c).then((datosingresovehiculo) {
                      if (datosingresovehiculo.id != '') {
                        print('Datos del vehiculo registrado...!');
                        Navigator.pop(context, datosingresovehiculo);
                      }
                    });
                  }
                },
                child: Text("Guardar Datos del Vehiculo")),
          ],
        ));
  }
}
