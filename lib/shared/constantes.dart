import 'package:flutter/material.dart';

class Constantes {
  static Uri gerarURL(String url, [Map queryString]) {
    //return Uri.http('192.168.56.1', 'empresas_piraproa/api/' + url, queryString);
    return Uri.https('comerciosempirapora.com.br', 'api/' + url, queryString);
  }

  static Map<int, Color> color = {
    50: Color.fromRGBO(63, 161, 76, .1),
    100: Color.fromRGBO(63, 161, 76, .2),
    200: Color.fromRGBO(63, 161, 76, .3),
    300: Color.fromRGBO(63, 161, 76, .4),
    400: Color.fromRGBO(63, 161, 76, .5),
    500: Color.fromRGBO(63, 161, 76, .6),
    600: Color.fromRGBO(63, 161, 76, .7),
    700: Color.fromRGBO(63, 161, 76, .8),
    800: Color.fromRGBO(63, 161, 76, .9),
    900: Color.fromRGBO(63, 161, 76, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFF3FA14C, color);
}
