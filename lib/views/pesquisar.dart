import 'package:compredopequeno/controllers/DashboardCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/customview.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pesquisar extends StatefulWidget {
  final pesquisar;
  Pesquisar({Key key, this.pesquisar}) : super(key: key);

  @override
  _PesquisarState createState() => _PesquisarState(pesquisar);
}

class _PesquisarState extends State<Pesquisar>
    with SingleTickerProviderStateMixin {
  final pesquisar;
  _PesquisarState(this.pesquisar);

  ScrollController scrollEmpresa;
  ScrollController scrollProduto;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  DashboardCtrl dashboardCtrl = DashboardCtrl();
  TabController _tabController;

  @override
  void initState() {
    dashboardCtrl.carregarDados(pesquisar, context, false, false);

    scrollEmpresa = ScrollController();
    scrollProduto = ScrollController();
    scrollEmpresa.addListener(carregarMaisEmpresa);
    scrollProduto.addListener(carregarMaisProduto);
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void carregarMaisEmpresa() {
    if (scrollEmpresa.offset >= scrollEmpresa.position.maxScrollExtent &&
        !scrollEmpresa.position.outOfRange) {
      dashboardCtrl.carregarDados(pesquisar, context, true, false);
    }
  }

  void carregarMaisProduto() {
    if (scrollProduto.offset >= scrollProduto.position.maxScrollExtent &&
        !scrollProduto.position.outOfRange) {
      dashboardCtrl.carregarDados(pesquisar, context, false, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        bottomNavigationBar: Rodape(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(205.0),
            child: AppBar(
              
              automaticallyImplyLeading: false,
              flexibleSpace:
                  Topo(barraPesquisa: true, valorPesquisa: pesquisar),
            )),
        body: Observer(builder: (_) {
          return SafeArea(
              child: CustomTabView(
                  initPosition: 0,
                  itemCount: dashboardCtrl.quantidadeAbas,
                  tabBuilder: (context, index) =>
                      index == 0 ? Text('Empresas') : Text('Produtos'),
                  pageBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text("Resultado da pesquisa por: $pesquisar"),
                              RefreshIndicator(
                                  onRefresh: () => dashboardCtrl.carregarDados(
                                      pesquisar, context, false, true),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.47,
                                    child: Observer(builder: (_) {
                                      print(dashboardCtrl.pagina_empresas.toString()+ ' - '+dashboardCtrl.quantidadePaginas_empresas.toString());
                                      return ListView.builder(
                                          controller: scrollEmpresa,
                                          itemCount: dashboardCtrl
                                                  .resultadoEmpresas.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            if (index ==
                                                dashboardCtrl
                                                    .resultadoEmpresas.length) {
                                              if (dashboardCtrl
                                                      .pagina_empresas <
                                                  dashboardCtrl
                                                      .quantidadePaginas_empresas)
                                                return Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                            context, '/empresa',
                                                            arguments: dashboardCtrl
                                                                    .resultadoEmpresas[
                                                                index]['id'])
                                                      },
                                                  child: Container(
                                                    height: 80,
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: Constantes
                                                                .color[900]),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 120,
                                                        width: 100,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15)),
                                                          child: Image.network(
                                                            dashboardCtrl
                                                                    .resultadoEmpresas[
                                                                index]['marca'],
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                      ),
                                                      title: Text(dashboardCtrl
                                                              .resultadoEmpresas[
                                                          index]['nome']),
                                                      subtitle: Text(dashboardCtrl
                                                              .resultadoEmpresas[
                                                          index]['categoria']),
                                                    ),
                                                  ));
                                          });
                                    }),
                                  )),
                            ],
                          ),
                        ),
                      ));
                    } else {
                      return new Container(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                  child: Column(children: <Widget>[
                                Text("Resultado da pesquisa por: $pesquisar"),
                                RefreshIndicator(
                                    onRefresh: () =>
                                        dashboardCtrl.carregarDados(
                                            pesquisar, context, false, false),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                      child: Observer(builder: (_) {
                                        return GridView.builder(
                                            gridDelegate:
                                                new SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2),
                                            shrinkWrap: true,
                                            controller: scrollProduto,
                                            itemCount: dashboardCtrl
                                                    .resultadoProdutos.length +
                                                1,
                                            itemBuilder: (context, index) {
                                              if (index ==
                                                  dashboardCtrl
                                                      .resultadoProdutos
                                                      .length) {
                                                if (dashboardCtrl
                                                        .pagina_produtos <
                                                    dashboardCtrl
                                                        .quantidadePaginas_produtos)
                                                  return Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
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
                                                              '/produto',
                                                              arguments: dashboardCtrl
                                                                      .resultadoProdutos[
                                                                  index]['id'])
                                                        },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      height: 200,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: Constantes
                                                                  .color[900]),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 120,
                                                            width: 200,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15)),
                                                              child:
                                                                  Image.network(
                                                                dashboardCtrl
                                                                    .resultadoProdutos[
                                                                        index]
                                                                        ['foto']
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 2,
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(
                                                                  dashboardCtrl
                                                                      .resultadoProdutos[
                                                                          index]
                                                                          [
                                                                          'nome']
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Constantes
                                                                            .color[
                                                                        900],
                                                                  ))),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 2,
                                                                      left: 4,
                                                                      right: 4),
                                                              child: Text(dashboardCtrl
                                                                  .resultadoProdutos[
                                                                      index][
                                                                      'empresa']
                                                                  .toString())),
                                                        ],
                                                      ),
                                                    ));
                                            });
                                      }),
                                    ))
                              ]))));
                    }
                  }));
        }),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
