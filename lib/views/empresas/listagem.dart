import 'package:compredopequeno/controllers/CategoriasCtrl.dart';
import 'package:compredopequeno/controllers/EmpresasCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListagemEmpresa extends StatefulWidget {
  final categoria;
  ListagemEmpresa({Key key, this.categoria}) : super(key: key,);

  @override
  _ListagemEmpresaState createState() => _ListagemEmpresaState(categoria:categoria);
}

class _ListagemEmpresaState extends State<ListagemEmpresa> {
  final categoria;
  
  ScrollController scroll;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  EmpresasCtrl empresaCtrl = EmpresasCtrl();

  _ListagemEmpresaState({this.categoria});

  @override
  void initState() {
    if(categoria != null)
      empresaCtrl.setCategoria(categoria);
    print(categoria);
    empresaCtrl.carregarDados(context, false);
    scroll = ScrollController();
    scroll.addListener(carregarMais);
    super.initState();
  }

  void carregarMais() {
    if (scroll.offset >= scroll.position.maxScrollExtent &&
        !scroll.position.outOfRange) {
      empresaCtrl.carregarDados(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Rodape(),
        appBar: PreferredSize(
              preferredSize: Size.fromHeight(150.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Topo(),
              )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
           Observer(builder: (_) {
             return
          empresaCtrl.carregando
              ? Carregando()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Pesquisar empresa',
                          suffixIcon: Icon(Icons.search)),
                      onChanged: empresaCtrl.setPesquisa,
                    ),
                    SizedBox(height: 20,),
                    Align(
                            alignment: Alignment.topLeft,
                            child: Observer(builder: (_) {return  Container( child: Text(
                                  empresaCtrl.nomeCategoria,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ));})),
                    Observer(builder: (_) {
                      return empresaCtrl.carregandoPesquisa
                          ? Carregando()
                          : RefreshIndicator(
                              onRefresh: () =>
                                  empresaCtrl.carregarDados(context),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                child: Observer(builder: (_) {return  ListView.builder(
                                  controller: scroll,
                                  itemCount: empresaCtrl.empresas.length + 1,
                                  itemBuilder: (context,index){
                                    if (index ==
                                              empresaCtrl.empresas.length) {
                                            if (empresaCtrl.pagina <
                                                empresaCtrl.quantidadePaginas)
                                              return Container(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 32.0),
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                                ),
                                              );
                                            else
                                              return SizedBox();
                                          } else
                                    return InkWell(
                                        onTap: () => {
                                          Navigator.pushNamed(
                                      context,
                                      '/empresa',
                                      arguments: empresaCtrl
                                                          .empresas[index]['id'])
                                        },
                                        child: Container(
                                height: 80,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    
                                    border: Border.all(
                                        width: 2, color: Constantes.color[900]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: ListTile(
                                  leading: Container(
                                    height: 120,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      child: Image.network(
                                        empresaCtrl.empresas[index]['marca'],
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  title: Text(empresaCtrl.empresas[index]['nome']),
                                  subtitle: Text(empresaCtrl.empresas[index]['categoria']),
                                ),
                              ));
                                  }                                ); }),
                              ));
                    })
                  ])); })
        ])));
  }
}
