import 'package:compredopequeno/shared/constantes.dart';
import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  const Rodape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        backgroundColor: Constantes.color[900],
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (item){
          if(item == 0)
            Navigator.pushNamed(context, '/');
          if(item == 2)
            Navigator.pushNamed(context, '/sobre');
          if(item == 1)
            Navigator.pushNamed(context, '/cadastrar');
        },
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text('Add Empresa')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Sobre'))
        ],
      );
  }
}