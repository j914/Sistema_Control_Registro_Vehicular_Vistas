import 'package:frontend/PantallasDatosVehiculo/modify_datosvehiculo.dart';
import 'package:frontend/PantallasDatosVehiculo/register_datosvehiculo.dart';
import 'package:frontend/modelos/DatosVehiculo.model.dart';
import 'package:frontend/pantallas/message_response.dart';
import 'package:frontend/peticiones/DatosVehiculo.peticion.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: getDatosVehiculo(context, listDatosVehiculo()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegisterDatosVehiculo()))
              .then((newdatosvehiculo) {
            setState(() {
              messageResponse(
                  context, newdatosvehiculo.name + " a sido guardado...!");
            });
          });
        },
        tooltip: "Agregar Datos del vehiculo",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getDatosVehiculo(
      BuildContext context, Future<List<DatosVehiculo>> futureDatosVehiculo) {
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

  Widget datosList(List<DatosVehiculo> datosvehiculo) {
    return ListView.builder(
      itemCount: datosvehiculo.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ModifyDatosVehiculo(datosvehiculo[index])))
                .then((newdatosvehiculo) {
              setState(() {
                messageResponse(
                    context,
                    newdatosvehiculo.marcadatosvehiculo +
                        " a sido modificado...!");
              });
            });
          },
          onLongPress: () {
            removeDatosVehiculo(context, datosvehiculo[index]);
          },
          title: Text("Placa " +
                  datosvehiculo[index]
                      .placadatosvehiculo /* +
                  "Modelo:   " +
                  datosvehiculo[index]
                      .modelomarcavehiculo +
              "Placa:  " +
              datosvehiculo[index].placadatosvehiculo*/
              ),
          //+
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

  removeDatosVehiculo(BuildContext context, DatosVehiculo datosvehiculo) {
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
                      deleteDatosVehiculo(datosvehiculo.id)
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
