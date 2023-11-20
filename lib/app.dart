import 'package:tarefa_reativa_flutter/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP_TITLE".tr(),
       theme: ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: ColorScheme(
          primary: Colors.blue,
          secondary: Colors.white, //cor deslize tela
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: const Color.fromARGB(26, 41, 40, 40),
          onError: Colors.red,
          brightness: Brightness.dark,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
