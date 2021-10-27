import 'package:flutter/material.dart';
import 'package:frontend/menu_lateral_abajo/navigation_center.dart';
import 'package:frontend/menu_lateral_abajo/side_menu_holder.dart';
import 'package:frontend/EscanerVehicular/home.dart';

class RootScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Update current text (a "context" of root screen) to perform a navigation like real drawer
    NavigationCenter.shared.currentContext = context;
    return Scaffold(
      appBar: AppBar(
        leading:
            // You can make this button become a Customized Button for Appbar
            // ignore: deprecated_member_use
            FlatButton(
          onPressed: () {
            SideMenuHolder.shared.onOpenMenu();
          },
          child: Icon(
            Icons.menu_open,
            color: Colors.white,
          ),
        ),
        title: Text('Click en el boton Escaner'),
        titleSpacing: 0,
      ),

      // ignore: deprecated_member_use
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => MainPage()));

            //   SideMenuHolder.shared.onOpenMenu();
          },
          child: Icon(
            Icons.document_scanner,
            color: Colors.orange,
            size: 100,
          ),
        ),
      ),
    );
  }
}

class SubScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        leading: FlatButton(
          onPressed: () {
            NavigationCenter.shared.back();
          },
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
        title: Text('Escanear Vehiculo'),
      ),
      body: Center(
        child: Text('Escanear Vehiculo'),
      ),
    );
  }
}
