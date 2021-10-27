import 'package:frontend/PantallaIngresoDatosVehiculo/modify_datosIngresovehiculos.dart';
import 'package:frontend/PantallaIngresoDatosVehiculo/register_datosingreso_datosvehiculo.dart';
import 'package:frontend/modelos/DatosIngresoVehiculo.model.dart';
//import 'package:frontend/EscanerVehicular/home.dart';
import 'package:frontend/pantallas/message_response.dart';
import 'package:frontend/peticiones/DatosIngresoVehiculos.peticiones.dart';
import 'package:flutter/material.dart';

class IngresoVehiculos extends StatefulWidget {
  final String _title;
  IngresoVehiculos(this._title);
  @override
  State<StatefulWidget> createState() => _IngresoVehiculos();
}

class _IngresoVehiculos extends State<IngresoVehiculos> {
  // @override
  // void initState() {
  //   listClient().then((clientes) {
  //     for (var item in clientes) {
  //       print(item.id);
  //       print(item.name);
  //       print(item.surname);
  //       print(item.phone);
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: getDatosIngresoVehiculo(context, listDatosIngresoVehiculo()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RegisterDatosIngresoVehiculo()));
        },
        tooltip: "Agregar Datos del vehiculo",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getDatosIngresoVehiculo(BuildContext context,
      Future<List<DatosIngresoVehiculos>> futureDatosVehiculo) {
    return FutureBuilder(
      future: futureDatosVehiculo,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el cargando...
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasError)
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            // print(snapshot.data);
            return snapshot.data != null
                ? datosList(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text('Sin Datos'),
                    ),
                  );
          default:
            return Text('Recarga la pantalla....!');
        }
      },
    );
  }

  Widget datosList(List<DatosIngresoVehiculos> datosvehiculo) {
    return ListView.builder(
      itemCount: datosvehiculo.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ModifyDatosIngresoVehiculo(datosvehiculo[index])))
                .then((newdatosvehiculo) {
              setState(() {
                messageResponse(
                    context, newdatosvehiculo.name + " a sido modificado...!");
              });
            });
          },
          onLongPress: () {
            removeDatosIngresoVehiculo(context, datosvehiculo[index]);
          },
          title: Text("Placa: " + datosvehiculo[index].placadatosvehiculo),
          //  " " +
          // datosvehiculo[index].modelomarcavehiculo),
          subtitle: Text("DescripcionEscaner: " +
              datosvehiculo[index].descripciondatosvehiculo),
          // leading: CircleAvatar(
          // child:
          //   Text(datosvehiculo[index].placadatosvehiculo.substring(0, 1)),
          // ),
          trailing: Icon(
            Icons.edit,
            color: Colors.orange,
          ),
        );
      },
    );
  }

  removeDatosIngresoVehiculo(
      BuildContext context, DatosIngresoVehiculos datosvehiculo) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar  Datos Vehiculo"),
              content: Text("Esta seguro de eliminar a " +
                  datosvehiculo.marcadatosvehiculo +
                  "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      deleteDatosIngresoVehiculo(datosvehiculo.id)
                          .then((datosvehiculo) {
                        if (datosvehiculo.id != '') {
                          setState(() {});
                        }
                      });
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.orange),
                  ),
                )
              ],
            ));
  }
}
