import 'package:flutter/material.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';

Widget fila({
  List<int> b1Power,
  Color b1Color,
  b1Texto,
  Color b1TxColor,
  List<int> b2Power,
  Color b2Color,
  b2Texto,
  Color b2TxColor,
  List<int> b3Power,
  Color b3Color,
  b3Texto,
  Color b3TxColor,
  List<int> b4Power,
  Color b4Color,
  b4Texto,
  Color b4TxColor,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      botones(
        power: b1Power,
        color: b1Color,
        texto: b1Texto,
        txColor: b1TxColor,
      ),
      botones(
        power: b2Power,
        color: b2Color,
        texto: b2Texto,
        txColor: b2TxColor,
      ),
      botones(
        power: b3Power,
        color: b3Color,
        texto: b3Texto,
        txColor: b3TxColor,
      ),
      botones(
        power: b4Power,
        color: b4Color,
        texto: b4Texto,
        txColor: b4TxColor,
      ),
    ],
  );
}

Widget botones({List<int> power, Color color, texto, Color txColor}) {
  return Container(
    height: 60.0,
    width: 60.0,
    child: RaisedButton(
      onPressed: () async {
        final String result = await IrSensorPlugin.transmitListInt(list: power);
        debugPrint('Emitiendo la señal: $result');
      },
      padding: EdgeInsets.all(10.0),
      child: texto,
      color: color,
      textColor: txColor,
      shape: CircleBorder(),
    ),
  );
}
