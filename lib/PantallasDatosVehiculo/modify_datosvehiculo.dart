import 'package:frontend/modelos/DatosVehiculo.model.dart';
import 'package:frontend/peticiones/DatosVehiculo.peticion.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pantallas/text_box.dart';

class ModifyDatosVehiculo extends StatefulWidget {
  final DatosVehiculo _datosVehiculo;
  ModifyDatosVehiculo(this._datosVehiculo);
  @override
  State<StatefulWidget> createState() => _ModifyDatosVehiculo();
}

class _ModifyDatosVehiculo extends State<ModifyDatosVehiculo> {
  TextEditingController controllermarcadatosvehiculo;
  TextEditingController controllermodelomarcavehiculo;
  TextEditingController controllercolordatosvehiculos;
  TextEditingController controllerplacadatosvehiculo;
  TextEditingController controllerdescripciondatosvehiculo;
  String id;

  @override
  void initState() {
    DatosVehiculo c = widget._datosVehiculo;
    controllermarcadatosvehiculo =
        new TextEditingController(text: c.marcadatosvehiculo);
    controllermodelomarcavehiculo =
        new TextEditingController(text: c.modelomarcavehiculo);
    controllercolordatosvehiculos =
        new TextEditingController(text: c.colordatosvehiculo);
    controllerplacadatosvehiculo =
        new TextEditingController(text: c.placadatosvehiculo);
    controllerdescripciondatosvehiculo =
        new TextEditingController(text: c.descripciondatosvehiculo);
    id = c.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Datos del Vehiculo"),
      ),
      body: ListView(
        children: [
          TextBox(controllermarcadatosvehiculo, "MarcaVehiculo"),
          TextBox(controllermodelomarcavehiculo, "ModeloVehiculo"),
          TextBox(controllercolordatosvehiculos, "ColorVehiculo"),
          TextBox(controllerplacadatosvehiculo, "PlacaVehiculo"),
          TextBox(controllerdescripciondatosvehiculo, "DescripcionVehiculo"),
          ElevatedButton(
              onPressed: () {
                String marcadatosvehiculo = controllermarcadatosvehiculo.text;
                String modelomarcavehiculo = controllermodelomarcavehiculo.text;
                String colordatosvehiculo = controllercolordatosvehiculos.text;
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
                      descripciondatosvehiculo: descripciondatosvehiculo,
                      id: id);

                  modifyDatosVehiculo(c).then((datosvehiculo) {
                    if (datosvehiculo.id != '') {
                      print('Datos del vehiculo modificado...!');
                      Navigator.pop(context, datosvehiculo);
                    }
                  });
                }
              },
              child: Text("Actualizar")),
        ],
      ),
    );
  }
}
/*
 var marcadatosvehiculo;
  var modelomarcavehiculo;
  var colordatosvehiculo;
  var placadatosvehiculo;
  var descripciondatosvehiculo;
  */