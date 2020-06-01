import 'package:compredopequeno/controllers/CategoriasCtrl.dart';
import 'package:compredopequeno/controllers/DashboardCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroFeito extends StatefulWidget {
  CadastroFeito({Key key}) : super(key: key);

  @override
  _CadastroFeitoState createState() => _CadastroFeitoState();
}

class _CadastroFeitoState extends State<CadastroFeito> {

  
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
          Text("Cadastro Realizado com sucesso", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Text("Obrigado por fazer seu cadastro em nossa lista de empresas, em breve nossa equipe entrará em contato com você para te passa o acesso para cadastrar produtos para sua empresa e ativar sua empresa no nosso App"),

              ], ),
            ),
          )
          
        ])));
  }
}
