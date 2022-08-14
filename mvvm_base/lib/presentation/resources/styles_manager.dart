import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color){
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily,fontWeight: fontWeight, color: color);
}

// regular style
TextStyle getRegularStyle({ fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamiy,FontWeightManager.regular ,color );
}

// light text style
TextStyle getLightStyle({ fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamiy,FontWeightManager.light ,color );
}

// light bold style
TextStyle getBoldStyle({ fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamiy,FontWeightManager.bold ,color );
}

// light semi-bold style
TextStyle getSemiBoldStyle({ fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamiy,FontWeightManager.semiBold ,color );
}

// light mediu  style
TextStyle getMediumStyle({ fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamiy,FontWeightManager.medium ,color );
}