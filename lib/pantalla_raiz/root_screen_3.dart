import 'package:flutter/material.dart';
import 'package:frontend/EscanerVehicular/InicioVehiculorReporteRobo.dart';
import 'package:frontend/menu_lateral_abajo/navigation_center.dart';
import 'package:frontend/menu_lateral_abajo/side_menu_holder.dart';
//import 'package:frontend/PantallasDatosVehiculo/my_home_pagesDV.dart';
//import 'package:frontend/EscanerVehicular/home.dart';
//import 'package:frontend/EscanerVehicular/inicioVehiculorReporteRobo.dart';

class RootScreen3 extends StatelessWidget {
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
          child: Icon(
            Icons.menu_open,
            color: Colors.orange,
          ),
        ),

        title: Text('Modulo Reporte Robo'),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => MainPages()));

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
/*


 Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MyHomePage("smclsmdsmd")));*/