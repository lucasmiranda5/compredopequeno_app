import 'package:compredopequeno/controllers/ProdutosCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/shared/funcoes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VerProduto extends StatefulWidget {
  final id;
  VerProduto({Key key, this.id}) : super(key: key,);

  @override
  _VerProdutoState createState() => _VerProdutoState(id:id);
}

class _VerProdutoState extends State<VerProduto> {
  final id;
  
  ScrollController scroll;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  ProdutosCtrl produtoCtrl = ProdutosCtrl();

  _VerProdutoState({this.id});

  @override
  void initState() {   
    produtoCtrl.carregarProduto(id);
    super.initState();
  }


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
           Observer(builder: (_) {
             return
          produtoCtrl.carregando
              ? Carregando()
              : Padding(
                  padding: const EdgeInsets.only(top:15, left:8, right: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: <Widget>[
                        Image.network(produtoCtrl.ver_foto, width:  MediaQuery.of(context).size.width * 0.70,),
                        ListTile(
                          title: Center(child: Text(produtoCtrl.ver_nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                          subtitle: Center(child: Column(
                            children: <Widget>[
                              Text(produtoCtrl.ver_empresa),
                              Text(produtoCtrl.ver_categoria)
                            ],
                          ) ),                        ),
                        RaisedButton(onPressed: () { 
                           Navigator.pushNamed(context, '/empresa',
                                        arguments: produtoCtrl.ver_id_empresa);

                        }, child: Text("Entrar em contato com a empresa"), color: Colors.green, textColor: Colors.white, ),
                        produtoCtrl.ver_preco != null ?  Column(children: <Widget>[
                            Text("Preço: R\$ "+produtoCtrl.ver_preco ,style: TextStyle(fontWeight: FontWeight.bold)),
                          ],) : SizedBox(),
                        produtoCtrl.ver_descricao != null ?
                        Column(children: <Widget>[
                            SizedBox(height: 15,),
                            Text("Descrição",style: TextStyle(fontWeight: FontWeight.bold)),
                             Html(data:produtoCtrl.ver_descricao)
                          ],) : SizedBox(),
                     
                      
                       
                            
                          
                      ]),
                    ),
                  )); })
        ])));
  }
}
