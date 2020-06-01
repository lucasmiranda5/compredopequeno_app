import 'package:compredopequeno/controllers/EmpresasCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/shared/funcoes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VerEmpresa extends StatefulWidget {
  final id;
  VerEmpresa({Key key, this.id}) : super(key: key,);

  @override
  _VerEmpresaState createState() => _VerEmpresaState(id:id);
}

class _VerEmpresaState extends State<VerEmpresa> {
  final id;
  
  ScrollController scroll;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  EmpresasCtrl empresaCtrl = EmpresasCtrl();

  _VerEmpresaState({this.id});

  @override
  void initState() {   
    empresaCtrl.carregarEmpresa(id);
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
          empresaCtrl.carregando
              ? Carregando()
              : Padding(
                  padding: const EdgeInsets.only(top:15, left:8, right: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: <Widget>[
                        Image.network(empresaCtrl.ver_marca, width:  MediaQuery.of(context).size.width * 0.70,),
                       
                        ListTile(
                          title: Center(child: Text(empresaCtrl.ver_nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                          subtitle: Center(child: Text(empresaCtrl.ver_categoria)),
                        ),
                         Text("Clique em cima para ser redirecionado"),
                        Column(children: empresaCtrl.ver_contatos.map((valor){
                              if(valor['tipo'] == 'telefone'){
                              return ListTile(
                                onTap: () {
                                  String val = valor['escrita'];
                                  val = val.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll('_', '').replaceAll(' ', '');
                                  Funcoes.ligar(val);
                                },
                                title: Text(valor['escrita']),
                                leading: Icon(Icons.phone),
                                trailing:  Icon(Icons.add_call),
                              );
                            }else if(valor['tipo'] == 'site'){
                              return ListTile(
                                onTap: (){
                                  Funcoes.goSite(valor['direcionamento']);
                                },
                                title: Text(valor['escrita']),
                                leading: Icon(Icons.desktop_windows),
                                trailing:  Icon(Icons.add_to_home_screen),
                              );
                            }else{
                              return ListTile(
                                 onTap: () {
                                  String val = valor['escrita'];
                                  val = '55'+val.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll('_', '').replaceAll(' ', '');
                                  Funcoes.goSite('whatsapp://send?phone='+val);
                                },
                                title: Text(valor['escrita']),
                                leading: Icon(MdiIcons.whatsapp),
                                trailing:  Icon(MdiIcons.whatsapp), 
                              );
                            }
                        }).toList(),),
                        empresaCtrl.ver_horario != null ?  Column(children: <Widget>[
                            Text("Hórario de funcionamento",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(empresaCtrl.ver_horario)
                          ],) : SizedBox(),
                        empresaCtrl.ver_descricao != null ?
                        Column(children: <Widget>[
                            SizedBox(height: 15,),
                            Text("Descrição",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(empresaCtrl.ver_descricao)
                          ],) : SizedBox(),
                      empresaCtrl.ver_produtos.length > 0 ?
                        Column(children: <Widget>[
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                child: Row(children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Produtos',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () { 
                                          Navigator.pushNamed(
                                      context,
                                      '/produtos/empresa',
                                      arguments: id);},
                                        child: Text(
                                          'Ver Todas',
                                        ),
                                      )))
                            ])),
                          ),
                          Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width - 20,
                              child: ListView.builder(
                                  itemCount:
                                      empresaCtrl.ver_produtos.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Constantes.color[900]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 120,
                                            width: 200,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15)),
                                              child: Image.network(
                                                empresaCtrl.ver_produtos[i]
                                                    ['foto'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 4, right: 4),
                                              child: Text(
                                                  empresaCtrl.ver_produtos[i]
                                                      ['nome'],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Constantes.color[900],
                                                  ))),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 4, right: 4),
                                              child: Text(empresaCtrl.ver_produtos[i]
                                                  ['categoria'].toString())),
                                        ],
                                      ),
                                    );
                                  })),
                        ])

                      : SizedBox(),

                      
                       
                            
                          
                      ]),
                    ),
                  )); })
        ])));
  }
}
