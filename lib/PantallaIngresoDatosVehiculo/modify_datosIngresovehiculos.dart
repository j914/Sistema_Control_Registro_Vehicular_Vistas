import 'package:frontend/modelos/DatosIngresoVehiculo.model.dart';
import 'package:frontend/peticiones/DatosIngresoVehiculos.peticiones.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pantallas/text_box.dart';

class ModifyDatosIngresoVehiculo extends StatefulWidget {
  final DatosIngresoVehiculos _datosIngresoVehiculo;
  ModifyDatosIngresoVehiculo(this._datosIngresoVehiculo);
  @override
  State<StatefulWidget> createState() => _ModifyDatosIngresoVehiculo();
}

class _ModifyDatosIngresoVehiculo extends State<ModifyDatosIngresoVehiculo> {
  TextEditingController controllermarcadatosvehiculo;
  TextEditingController controllermodelodatosvehiculo;
  TextEditingController controlleraniodatosvehiculo;
  TextEditingController controllercolordatosvehiculo;
  TextEditingController controllerplacasdatosvehiculo;
  TextEditingController controllerfechaentradatosvehiculo;
  TextEditingController controllerdescripciondatosvehiculo;

  String id;

  @override
  void initState() {
    DatosIngresoVehiculos c = widget._datosIngresoVehiculo;

    controllermarcadatosvehiculo =
        new TextEditingController(text: c.marcadatosvehiculo);

    controllermodelodatosvehiculo =
        new TextEditingController(text: c.modelodatosvehiculo);

    controlleraniodatosvehiculo =
        new TextEditingController(text: c.aniodatosvehiculo);

    controllercolordatosvehiculo =
        new TextEditingController(text: c.colordatosvehiculo);

    controllerplacasdatosvehiculo =
        new TextEditingController(text: c.placadatosvehiculo);
    controllerfechaentradatosvehiculo =
        new TextEditingController(text: c.fechaentradadatosvehiculo);
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
          TextBox(controllermodelodatosvehiculo, "ModeloVehiculo"),
          TextBox(controlleraniodatosvehiculo, "AñoVehiculo"),
          TextBox(controllercolordatosvehiculo, "ColorVehiculo"),
          TextBox(controllerplacasdatosvehiculo, "Placas Vehiculo"),
          TextBox(controllerfechaentradatosvehiculo, "Fecha EntradaVehiculo"),
          TextBox(controllerdescripciondatosvehiculo, "DescripcionVehiculo"),
          ElevatedButton(
              onPressed: () {
                String marcadatosvehiculo = controllermarcadatosvehiculo.text;
                String modelodatosvehiculo = controllermodelodatosvehiculo.text;
                String aniodatosvehiculo = controlleraniodatosvehiculo.text;
                String colordatosvehiculo = controllercolordatosvehiculo.text;
                String placadatosvehiculo = controllerplacasdatosvehiculo.text;
                String fechaentradadatosvehiculo =
                    controllerfechaentradatosvehiculo.text;
                String descripciondatosvehiculo =
                    controllerdescripciondatosvehiculo.text;

                if (marcadatosvehiculo.isNotEmpty &&
                    modelodatosvehiculo.isNotEmpty &&
                    aniodatosvehiculo.isNotEmpty &&
                    colordatosvehiculo.isNotEmpty &&
                    placadatosvehiculo.isNotEmpty &&
                    fechaentradadatosvehiculo.isNotEmpty &&
                    descripciondatosvehiculo.isNotEmpty) {
                  DatosIngresoVehiculos c = new DatosIngresoVehiculos(
                      marcadatosvehiculo: marcadatosvehiculo,
                      modelodatosvehiculo: modelodatosvehiculo,
                      aniodatosvehiculo: aniodatosvehiculo,
                      colordatosvehiculo: colordatosvehiculo,
                      placadatosvehiculo: placadatosvehiculo,
                      fechaentradadatosvehiculo: fechaentradadatosvehiculo,
                      descripciondatosvehiculo: descripciondatosvehiculo,
                      id: id);

                  modifyDatosIngresoVehiculo(c).then((ingresodatosvehiculo) {
                    if (ingresodatosvehiculo.id != '') {
                      print('Datos del vehiculo modificado...!');
                      Navigator.pop(context, ingresodatosvehiculo);
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
