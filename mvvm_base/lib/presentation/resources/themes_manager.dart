import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'value_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme(){
    return ThemeData(
        // main color of the app
        primaryColor: ColorManager.navyBlue,
        primaryColorLight: ColorManager.lightBlue,
        primaryColorDark: ColorManager.darkBlue,
        disabledColor: ColorManager.lightGrey,
        // ripple color
        splashColor: ColorManager.lightGrey,

        // card view theme
        cardTheme: CardTheme(
            color: ColorManager.white,
            shadowColor: ColorManager.lightGrey,
            elevation: AppSize.s4
        ),

        // app bar theme
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: ColorManager.navyBlue,
            elevation: AppSize.s4,
            shadowColor: ColorManager.lightGrey,
            titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)
        ),

        // button theme
        buttonTheme: ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.lightGrey,
            buttonColor: ColorManager.navyBlue,
            splashColor: ColorManager.lightBlue
        ),

        //  elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: getRegularStyle(color: ColorManager.white),
                primary: ColorManager.navyBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
            ),
        ),
        // Text Theme
         textTheme: TextTheme(
             headline1: getSemiBoldStyle(color:ColorManager.darkGrey, fontSize: FontSize.s16 ),
             subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
             caption:  getRegularStyle(color: ColorManager.grey1),
             bodyText1: getRegularStyle(color: ColorManager.grey),
        ),
        //  input decoration theme (text from field)
        inputDecorationTheme:  InputDecorationTheme(
            contentPadding: const EdgeInsets.all(AppPadding.p8),
            // hint Style
            hintStyle:  getRegularStyle(color: ColorManager.grey1),
            labelStyle: getMediumStyle(color: ColorManager.darkGrey),
            errorStyle: getRegularStyle(color: ColorManager.red),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
            ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.navyBlue, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
          ),
        )
        // input decoration theme
    );
}