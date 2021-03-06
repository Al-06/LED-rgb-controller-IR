import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:sensor_ir/src/utils/powerValores.dart';
import 'package:sensor_ir/src/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _hasIrEmitter = false;
  String _getCarrierFrequencies = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool hasIrEmitter;
    String getCarrierFrequencies;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await IrSensorPlugin.platformVersion;
      hasIrEmitter = await IrSensorPlugin.hasIrEmitter;
      getCarrierFrequencies = await IrSensorPlugin.getCarrierFrequencies;
    } on PlatformException {
      platformVersion = 'Failed to get data in a platform.';
      hasIrEmitter = false;
      getCarrierFrequencies = 'None';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _hasIrEmitter = hasIrEmitter;
      _getCarrierFrequencies = getCarrierFrequencies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(top: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              _fila1(),
              
              _fila23456(),
              
              //_fila8901(),

              _fila7(),
            ],
          ),
        ),
      );
  }

  Widget _fila1() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[900],
      ),
      child: fila(
        b1Color: Colors.white,
        b1Texto: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_drop_up, size: 15.0,),
            Icon(Icons.wb_sunny, size: 15.0,)
          ],
        ),
        b1Power: ir_BPlus,
        b1TxColor: Colors.black,
        b2Color: Colors.white,
        b2Texto: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 15.0,),
            Icon(Icons.arrow_drop_down, size: 15.0,)
          ],
        ),
        b2Power: ir_BMinus,
        b2TxColor: Colors.black,
        b3Color: Colors.black,
        b3Texto: Icon(Icons.skip_next),
        b3Power: ir_ON,
        b3TxColor: Colors.white,
        b4Color: Colors.red[700],
        b4Texto: Icon(Icons.power_settings_new),
        b4Power: ir_OFF,
        b4TxColor: Colors.white,
      ),
    );
  }
  Widget _fila23456(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          _fila2(),
          SizedBox(height: 20.0,),
          _fila3(),
          SizedBox(height: 20.0,),
          _fila4(),
          SizedBox(height: 20.0,),
          _fila5(),
          SizedBox(height: 20.0,),
          _fila6(),
        ],
      ),
    );
  }

Widget _fila2(){
  return fila(
        b1Color: Color.fromRGBO(251, 1, 2, 1),
        b1Texto: Text('R', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
        b1Power: ir_R,
        b1TxColor: Colors.black,
        b2Color: Color.fromRGBO(0, 175, 80, 1),
        b2Texto: Text('G', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
        b2Power: ir_G,
        b2TxColor: Colors.black,
        b3Color: Color.fromRGBO(0, 113, 193, 1),
        b3Texto: Text('B', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
        b3Power: ir_B,
        b3TxColor: Colors.black,
        b4Color: Colors.white,
        b4Texto: Text('W', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
        b4Power: ir_W,
        b4TxColor: Colors.black,
      );
}
Widget _fila3(){
  return fila(
        b1Color: Color.fromRGBO(228, 109, 9, 1),
        b1Texto: null,
        b1Power: ir_R1,
        b1TxColor: Colors.black,
        b2Color: Color.fromRGBO(146, 209, 79, 1),
        b2Texto: null,
        b2Power: ir_G1,
        b2TxColor: Colors.black,
        b3Color: Color.fromRGBO(51, 153, 254, 1),
        b3Texto: null,
        b3Power: ir_B1,
        b3TxColor: Colors.white,
        b4Color: Color.fromRGBO(255, 0, 254, 1),
        b4Texto: null,
        b4Power: ir_W1,
        b4TxColor: Colors.white,
      );
}
Widget _fila4(){
  return fila(
        b1Color: Color.fromRGBO(255, 79, 79, 1),
        b1Texto: null,
        b1Power: ir_R2,
        b1TxColor: Colors.black,
        b2Color: Color.fromRGBO(0, 152, 153, 1),
        b2Texto: null,
        b2Power: ir_G2,
        b2TxColor: Colors.black,
        b3Color: Color.fromRGBO(112, 48, 160, 1),
        b3Texto: null,
        b3Power: ir_B2,
        b3TxColor: Colors.white,
        b4Color: Color.fromRGBO(203, 0, 255, 1),
        b4Texto: null,
        b4Power: ir_W2,
        b4TxColor: Colors.white,
      );
}
Widget _fila5(){
  return fila(
        b1Color: Color.fromRGBO(254, 153, 0, 1),
        b1Texto: null,
        b1Power: ir_R3,
        b1TxColor: Colors.black,
        b2Color: Color.fromRGBO(0, 101, 152, 1),
        b2Texto: null,
        b2Power: ir_G3,
        b2TxColor: Colors.black,
        b3Color: Color.fromRGBO(101, 1, 255, 1),
        b3Texto: null,
        b3Power: ir_B3,
        b3TxColor: Colors.white,
        b4Color: Color.fromRGBO(0, 103, 102, 1),
        b4Texto: null,
        b4Power: ir_W3,
        b4TxColor: Colors.white,
      );
}
Widget _fila6(){
  return fila(
        b1Color: Color.fromRGBO(255, 255, 1, 1),
        b1Texto: null,
        b1Power: ir_R4,
        b1TxColor: Colors.black,
        b2Color: Color.fromRGBO(0, 52, 102, 1),
        b2Texto: null,
        b2Power: ir_G4,
        b2TxColor: Colors.black,
        b3Color: Color.fromRGBO(153, 0, 255, 1),
        b3Texto: null,
        b3Power: ir_B4,
        b3TxColor: Colors.white,
        b4Color: Color.fromRGBO(0, 110, 140, 1),
        b4Texto: null,
        b4Power: ir_W4,
        b4TxColor: Colors.white,
      );
}

Widget _fila7() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[900],
      ),
      child: fila(
        b1Color: Colors.white,
        b1Texto: Text('JUMP3', style: TextStyle(fontSize: 12.0),),
        b1Power: ir_JUMP3,
        b1TxColor: Colors.black,
        b2Color: Colors.white,
        b2Texto: Text('JUMP7', style: TextStyle(fontSize: 12.0),),
        b2Power: ir_JUMP7,
        b2TxColor: Colors.black,
        b3Color: Colors.white,
        b3Texto: Text('FADE3', style: TextStyle(fontSize: 12.0),),
        b3Power: ir_FADE3,
        b3TxColor: Colors.black,
        b4Color: Colors.white,
        b4Texto: Text('FADE7', style: TextStyle(fontSize: 12.0),),
        b4Power: ir_FADE7,
        b4TxColor: Colors.black,
      ),
    );
  }

  Widget _fila8901(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          _fila8(),
          SizedBox(height: 20.0,),
          _fila9(),
          SizedBox(height: 20.0,),
          _fila10(),
          SizedBox(height: 20.0,),
          _fila11(),
        ],
      ),
    );
  }
  
  Widget _fila8(){
    return fila(
      b1Color: Colors.white,
      b1Texto: Icon(Icons.arrow_upward, size: 35.0,),
      b1Power: ir_UPR,
      b1TxColor: Color.fromRGBO(251, 1, 2, 1),
      b2Color: Colors.white,
      b2Texto: Icon(Icons.arrow_upward, size: 35.0,),
      b2Power: ir_UPG,
      b2TxColor: Color.fromRGBO(0, 175, 80, 1),
      b3Color: Colors.white,
      b3Texto: Icon(Icons.arrow_upward, size: 35.0,),
      b3Power: ir_UPB,
      b3TxColor: Color.fromRGBO(0, 113, 193, 1),
      b4Color: Colors.white,
      b4Texto: Text('QUICK', style: TextStyle(fontSize: 12.0),),
      b4Power: ir_QUICK,
      b4TxColor: Colors.black,
    );
  }
  Widget _fila9(){
    return fila(
      b1Color: Colors.white,
      b1Texto: Icon(Icons.arrow_downward, size: 35.0,),
      b1Power: ir_DOWNR,
      b1TxColor: Color.fromRGBO(251, 1, 2, 1),
      b2Color: Colors.white,
      b2Texto: Icon(Icons.arrow_downward, size: 35.0,),
      b2Power: ir_DOWNG,
      b2TxColor: Color.fromRGBO(0, 175, 80, 1),
      b3Color: Colors.white,
      b3Texto: Icon(Icons.arrow_downward, size: 35.0,),
      b3Power: ir_DOWNB,
      b3TxColor: Color.fromRGBO(0, 113, 193, 1),
      b4Color: Colors.white,
      b4Texto: Text('SLOW', style: TextStyle(fontSize: 12.0),),
      b4Power: ir_SLOW,
      b4TxColor: Colors.black,
    );
  }
  Widget _fila10(){
    return fila(
      b1Color: Colors.white,
      b1Texto: Text('DIY1', style: TextStyle(fontSize: 12.0),),
      b1Power: ir_DIY1,
      b1TxColor: Colors.black,
      b2Color: Colors.white,
      b2Texto: Text('DIY2', style: TextStyle(fontSize: 12.0),),
      b2Power: ir_DIY2,
      b2TxColor: Colors.black,
      b3Color: Colors.white,
      b3Texto: Text('DIY3', style: TextStyle(fontSize: 12.0),),
      b3Power: ir_DIY3,
      b3TxColor: Colors.black,
      b4Color: Colors.white,
      b4Texto: Text('AUTO', style: TextStyle(fontSize: 12.0),),
      b4Power: ir_AUTO,
      b4TxColor: Colors.black,
    );
  }
  Widget _fila11(){
    return fila(
      b1Color: Colors.white,
      b1Texto: Text('DIY4', style: TextStyle(fontSize: 12.0),),
      b1Power: ir_DIY4,
      b1TxColor: Colors.black,
      b2Color: Colors.white,
      b2Texto: Text('DIY5', style: TextStyle(fontSize: 12.0),),
      b2Power: ir_DIY5,
      b2TxColor: Colors.black,
      b3Color: Colors.white,
      b3Texto: Text('DIY6', style: TextStyle(fontSize: 12.0),),
      b3Power: ir_DIY6,
      b3TxColor: Colors.black,
      b4Color: Colors.white,
      b4Texto: Text('FLASH', style: TextStyle(fontSize: 12.0),),
      b4Power: ir_FLASH,
      b4TxColor: Colors.black,
    );
  }
}