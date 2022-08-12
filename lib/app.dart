import 'package:flutter/material.dart';
import 'package:flutter_summer_school/utils/constants.dart';
import 'features/auth/screens/auth_screen.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const AuthScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          brightness: Brightness.light,

          primaryColor: primary,
          colorScheme: ThemeData().colorScheme.copyWith(primary: primary),

          scaffoldBackgroundColor: primaryBackground,

          textTheme: TextTheme(
            headline1: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            headline2: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            headline3: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            headline4: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            headline5: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            headline6: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            bodyText1: TextStyle(fontSize: mediumTextSize, fontFamily: mainFontFamily, color: primary),
            bodyText2: TextStyle(fontSize: largeTextSize, fontFamily: mainFontFamily, color: primary),
            subtitle1: TextStyle(fontSize: mediumTextSize, fontFamily: mainFontFamily, color: primary),
            subtitle2: TextStyle(fontSize: mediumTextSize, fontFamily: mainFontFamily, color: primary),
          ),
        )
    );
  }
}