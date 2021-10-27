import 'package:flutter/material.dart';
import 'package:frontend/menu_lateral_abajo/navigation_center.dart';
import 'package:frontend/menu_lateral_abajo/side_menu_holder.dart';
import 'package:frontend/pantallas/my_home_page.dart';
import 'package:frontend/login/signin.dart';

//import 'package:frontend/side_menu_down_side/login/signup.dart';
//import 'package:frontend/EscanerVehicular/inicioVehiculorReporteRobo.dart';
class RootScreen4 extends StatelessWidget {
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
        title: Text('Modulo Ingreso de Usuarios'),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MyHomePage("Lista de Usuarios")));

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

class RootScreen5 extends StatelessWidget {
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
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text('RootScreen5'),
      ),
      body: Center(
        child: Text('Screen 5'),
      ),
    );
  }
}

class RootScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Update current text (a "context" of root screen) to perform a navigation like real drawer
    NavigationCenter.shared.currentContext = context;
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        leading: FlatButton(
          onPressed: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => Signin()));
            // SideMenuHolder.shared.onOpenMenu();
          },
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text('RootScreen6'),
      ),
      body: Center(
        child: Text('Screen 6'),
      ),
    );
  }
}

class RootScreen7 extends StatelessWidget {
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
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text('RootScreen7'),
      ),
      body: Center(
        child: Text('Screen 7'),
      ),
    );
  }
}
