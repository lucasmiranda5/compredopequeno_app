import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/shared/rotas.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { 
 
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comércio em Pirapora',
      theme: ThemeData(
        primarySwatch: Constantes.colorCustom,        
      ),
      routes: rotas(context),
      initialRoute: '/',
    );
  }
}