import 'package:cricket_betting/constance/global.dart' as globals;
import 'package:cricket_betting/constance/sharedPreferences.dart';

class FirstTime {
  static getValues() async {
    globals.usertoken = (await MySharedPreferences().getUsertokenString())!;
    globals.userdata = await MySharedPreferences().getUserData();
  }
}
