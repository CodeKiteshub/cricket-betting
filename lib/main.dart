import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricket_betting/bloc/phoneVerificationBloc.dart';
import 'package:cricket_betting/constance/firsttime.dart';
import 'package:cricket_betting/constance/global.dart' as globals;
import 'package:bloc/bloc.dart';
import 'package:cricket_betting/constance/routes.dart';
import 'package:cricket_betting/constance/themes.dart';
import 'package:cricket_betting/modules/home/tabScreen.dart';
import 'package:cricket_betting/modules/login/loginScreen.dart';
import 'package:cricket_betting/modules/login/otpValidationScreen.dart';
import 'package:cricket_betting/modules/splash/SplashScreen.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
    (_) => runApp(new MyApp()),
  );
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index, {Color? color}) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index, color: color!);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    globals.phoneVerificationBloc =
        PhoneVerificationBloc(PhoneVerificationBlocState.initial());
    // globals.phoneVerificationBloc!.onInisialList("91", "phoneNoData");
    FirstTime.getValues();
    super.initState();
  }

  void setCustomeTheme(int index, {Color? color}) {
    if (index == 6) {
      setState(() {
        AllCoustomTheme.isLight = true;
      });
    } else if (index == 7) {
      setState(() {
        AllCoustomTheme.isLight = false;
      });
    }
    setState(() {
      globals.colorsIndex = index;
      globals.primaryColorString = color != null ? color : Color(0xFF4FBE9F);
      globals.secondaryColorString = globals.primaryColorString;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
          AllCoustomTheme.isLight ? Brightness.dark : Brightness.light,
    ));
    return Container(
      color: AllCoustomTheme.getThemeData().primaryColor,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cricket Fantasy',
        theme: AllCoustomTheme.getThemeData(),
        routes: routes,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => new SplashScreen(),
    Routes.LOGIN: (BuildContext context) => new LoginScreen(),
    Routes.TAB: (BuildContext context) => new TabScreen(),
    Routes.OTP: (BuildContext context) => new OtpValidationScreen(),
  };
}
