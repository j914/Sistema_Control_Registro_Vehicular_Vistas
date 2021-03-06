import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: onClickedPickImage,
            child: Text('Elegir Imagen'),
          ),
          const SizedBox(width: 12),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: onClickedScanText,
            child: Text('Escanear Placa '),
          ),
          const SizedBox(width: 12),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: onClickedClear,
            child: Text('Limpiar'),
          )
        ],
      );
}
