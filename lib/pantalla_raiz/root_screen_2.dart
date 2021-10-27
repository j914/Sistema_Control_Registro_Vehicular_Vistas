import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:frontend/menu_lateral_abajo/navigation_center.dart';
import 'package:frontend/menu_lateral_abajo/side_menu_holder.dart';
import 'package:frontend/PantallaIngresoDatosVehiculo/ModuloControlRegistro.dart';

class RootScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Update current text (a "context" of root screen) to perform a navigation like real drawer
    NavigationCenter.shared.currentContext = context;
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        leading: FlatButton(
          onPressed: () {
            SideMenuHolder.shared.onOpenMenu();
          },
          child: Icon(Icons.menu_open, color: Colors.white),
        ),
        title: Text('Modulo Control Registro'),
      ),
      body: Center(
        // ignore: deprecated_member_use

        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        IngresoVehiculos("Vehiculos Ingresados a Jutiapa")));

            //   SideMenuHolder.shared.onOpenMenu();
          },
          child: Icon(
            Icons.format_list_bulleted_sharp,
            color: Colors.orange,
            size: 100,
          ),
        ),
      ),
    );
  }
}
