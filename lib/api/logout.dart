// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:cricket_betting/constance/global.dart' as globals;
import 'package:cricket_betting/constance/routes.dart';
import 'package:cricket_betting/constance/sharedPreferences.dart';
import 'package:cricket_betting/models/userData.dart';
import 'package:cricket_betting/modules/login/loginScreen.dart';
import 'package:cricket_betting/utils/dialogs.dart';

class LogOut {
  void logout(BuildContext context) async {
    try {
      globals.usertoken = '';
      await MySharedPreferences().clearSharedPreferences();
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.LOGIN, (Route<dynamic> route) => false);
    } on Exception {
      Dialogs.showDialogWithOneButton(
        context,
        "Error",
        "please! try again.",
        onButtonPress: () {},
      );
    }
  }

  Future backSplashScreen(BuildContext context) async {
    try {
      globals.usertoken = '';
      loginUserData = UserData();
      await MySharedPreferences().clearSharedPreferences();
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.LOGIN, (Route<dynamic> route) => false);
    } on Exception {
      Dialogs.showDialogWithOneButton(
        context,
        "Error",
        "please! try again.",
        onButtonPress: () {},
      );
    }
  }
}
