import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/login/signup.dart';
import 'package:frontend/menu_lateral_abajo/side_menu_down_side.dart';
import 'package:frontend/modelos/user.login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

// se importa el micro servicio de http, luego se manda a llamar la ip del servidor y luego la api.
class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://192.168.101.6:8080/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
    // navega a otra pesata;a
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => SideMenuDownSide()));
  }

// liberia para diseño de la app
  User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            child: SvgPicture.asset(
              'images/top.svg', // se agrega la imagen
              width: 380,
              height: 120,
            )),
        Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                ),
                Text(
                  "Control Registro Vehicular🚗", // nombre de la aplicacion
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.email),
                    onChanged: (value) {
                      user.email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese Su Correo';
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return null;
                      } else {
                        return 'Ingrese Un Correo Valido';
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.orange,
                        ),
                        hintText: 'Ingrese Correo Electronico',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.orange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.password),
                    onChanged: (value) {
                      user.password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese correo porfavor';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.orange,
                        ),
                        hintText: 'Introducir La Contraseña',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.orange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 6, 16, 0),
                  child: Container(
                    height: 42,
                    width: 400,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            save();
                          } else {
                            print("no está bien");
                          }
                        },
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(85, 10, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "No Tiene Una Cuenta ? ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            "Inscribirse",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
