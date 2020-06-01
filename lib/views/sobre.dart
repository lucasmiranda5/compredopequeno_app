import 'package:compredopequeno/controllers/CategoriasCtrl.dart';
import 'package:compredopequeno/controllers/DashboardCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Sobre extends StatefulWidget {
  Sobre({Key key}) : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Rodape(),
        appBar: PreferredSize(
              preferredSize: Size.fromHeight(205.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Topo(barraPesquisa: true),
              )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
          Text("Sobre", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Text("Nesse momento de pandemia mundial onde pequenos negócios e profissionais liberais vem sendo muito afetados, nós da ACIAPI/CDL e IFNMG Campus Pirapora juntamos forças para poder trazer meios de minimizar as perdas nesse momento, uma das nossas ações é nosso aplicativo Comércios em Pirapora que tem como foco divulgar todas as empresas para que as pessoas possam entrar em contato e comprar produtos ou realizar serviços."),
          Text("Esse serviço é 100% gratuito para todas as empresas de Pirapora não sendo necessário ser associado a ACIAPI/CDL nem ter vinculo com o IFNMG. Um projeto Open Source que tem seu código no Github para contribuições."),
          Text("ACIAPI – Associação Comercial, Industrial e Agropecuária de Pirapora"),
          Text("CDL – Câmara dos dirigentes lojistas"),
          Text("IFNMG – Instituto Federal do Norte de Minas Campus Pirapora")
              ], ),
            ),
          )
          
        ])));
  }
}
