import 'package:compredopequeno/controllers/DashboardCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardCtrl dashboardCtrl = DashboardCtrl();

  @override
  void initState() {
    dashboardCtrl.carregar();
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
      body: Observer(builder: (_) {
        return dashboardCtrl.carregando
            ? Carregando()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[                   
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                child: Row(children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'CATEGORIAS DE EMPRESAS',
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
                                              context, '/categorias');
                                        },
                                        child: Text(
                                          'Ver Todas',
                                        ),
                                      )))
                            ])),
                          ),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    dashboardCtrl.categoriasEmpresa.length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                      onTap: () => {
                                            Navigator.pushNamed(
                                                context, '/empresas/categoria',
                                                arguments: dashboardCtrl
                                                    .categoriasEmpresa[i]['id'])
                                          },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Constantes.color[800],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                dashboardCtrl
                                                        .categoriasEmpresa[i]
                                                    ['nome'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                dashboardCtrl.categoriasEmpresa[
                                                                i][
                                                            'quantidadeEmpresas'] ==
                                                        1
                                                    ? dashboardCtrl
                                                            .categoriasEmpresa[
                                                                i][
                                                                'quantidadeEmpresas']
                                                            .toString() +
                                                        ' empresa'
                                                    : dashboardCtrl
                                                            .categoriasEmpresa[
                                                                i][
                                                                'quantidadeEmpresas']
                                                            .toString() +
                                                        ' empresas',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                child: Row(children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'ÚLTIMOS PRODUTOS',
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
                                              context, '/produtos');
                                        },
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
                                      dashboardCtrl.ultimosProdutos.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                         Navigator.pushNamed(context, '/produto',
                                        arguments: dashboardCtrl.ultimosProdutos[i]['id']);
                                      },
                                      child: Container(
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
                                                  dashboardCtrl.ultimosProdutos[i]
                                                      ['foto'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2, left: 4, right: 4),
                                                child: Text(
                                                    dashboardCtrl
                                                            .ultimosProdutos[i]
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
                                                child: Text(dashboardCtrl
                                                        .ultimosProdutos[i]
                                                    ['nomeEmpresa'])),
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                child: Row(children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'ÚLTIMAS EMPRESAS',
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
                                                context, '/empresas');
                                          },
                                          child: Text(
                                            'Ver Todas',
                                          ))))
                            ])),
                          ),
                          Column(
                            children:
                                dashboardCtrl.utltimasEmpresas.map((valor) {
                              return Container(
                                height: 80,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Constantes.color[900]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/empresa',
                                        arguments: valor['id']);
                                  },
                                  leading: Container(
                                    height: 120,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      child: Image.network(
                                        valor['marca'],
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  title: Text(valor['nome']),
                                  subtitle: Text(valor['nomeCategoria']),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
