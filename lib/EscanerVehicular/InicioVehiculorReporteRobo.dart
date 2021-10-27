import 'dart:ui';

//import 'package:OcrSpecs/auth.dart';
//import 'package:OcrSpecs/login.dart';
import 'package:frontend/EscanerVehicular/widget/text_recognition_widget.dart';
import 'package:flutter/material.dart';
import 'package:frontend/PantallasDatosVehiculo/my_home_pagesDV.dart';

class MainPages extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

//AuthMethods authMethods = new AuthMethods();

class _MainPageState extends State<MainPages> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Escaner Vehicular",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add_box_sharp),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage("Ingrese Datos del Reporte")));
                }),
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  return showDialog(
                      context: (context),
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Escaner",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Vehicular",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                            color:
                                                // ignore: deprecated_member_use
                                                Theme.of(context).accentColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Version 1.0',
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Desarrollado por Gabriel Castillo',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        // ignore: deprecated_member_use
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Desarrollado en Flutter",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextRecognitionWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
}
