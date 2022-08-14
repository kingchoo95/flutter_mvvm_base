import 'package:flutter/material.dart';

class ColorManager{
  static Color lightBlue = HexColor.fromHex("#3498db");
  static Color darkBlue = HexColor.fromHex("#2980b9");
  static Color navyBlue = HexColor.fromHex("#34495e");
  static Color lightGrey = HexColor.fromHex("#ecf0f1");
  static Color darkGrey = HexColor.fromHex("#A9A9A9");
  static Color grey1 = HexColor.fromHex("#D3D3D3");
  static Color grey = HexColor.fromHex("#808080");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color red = HexColor.fromHex("#ff0000");

  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF"+ hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF"+ hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}