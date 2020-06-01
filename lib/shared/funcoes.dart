


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Funcoes{

  static msgError(GlobalKey<ScaffoldState> scaffodkey, String msg){
    final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(msg));
      scaffodkey.currentState.showSnackBar(snackBar);
  }

static Future<void> ligar(String url) async {
    if (await canLaunch('tel:'+url)) {
      await launch('tel:'+url);
    } else {
      throw 'Could not launch $url';
    }
  }

static Future<void> goSite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}