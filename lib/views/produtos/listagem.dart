import 'package:compredopequeno/controllers/ProdutosCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListagemProdutos extends StatefulWidget {
  final empresa;
  ListagemProdutos({Key key, this.empresa}) : super(key: key);

  @override
  _ListagemProdutosState createState() => _ListagemProdutosState(empresa);
}

class _ListagemProdutosState extends State<ListagemProdutos> {
  final empresa;
  ScrollController scroll;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  ProdutosCtrl produtoCtrl = ProdutosCtrl();

  _ListagemProdutosState(this.empresa);
  @override
  void initState() {
    if(empresa != null)
      produtoCtrl.setEmpresa(empresa);
    produtoCtrl.carregarDados(context);
    scroll = ScrollController();
    scroll.addListener(carregarMais);
    super.initState();
  }

  void carregarMais() {
    if (scroll.offset >= scroll.position.maxScrollExtent &&
        !scroll.position.outOfRange) {
      print("Miranda");
      produtoCtrl.carregarDados(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Rodape(),
         appBar: PreferredSize(
              preferredSize: Size.fromHeight(145.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Topo(),
              )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Observer(builder: (_) {
            return produtoCtrl.carregando
                ? Carregando()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Pesquisar produto',
                            suffixIcon: Icon(Icons.search)),
                        onChanged: produtoCtrl.setPesquisa,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Observer(builder: (_) {
                            return Container(
                                child: Text(
                              produtoCtrl.titulo,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ));
                          })),
                      Observer(builder: (_) {
                        return produtoCtrl.carregandoPesquisa
                            ? Carregando()
                            : RefreshIndicator(
                                onRefresh: () =>
                                    produtoCtrl.carregarDados(context),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Observer(builder: (_) {
                                    return GridView.builder(
                                        gridDelegate:
                                            new SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2),
                                        shrinkWrap: true,
                                        controller: scroll,
                                        itemCount:
                                            produtoCtrl.produtos.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index ==
                                              produtoCtrl.produtos.length) {
                                            if (produtoCtrl.pagina <
                                                produtoCtrl.quantidadePaginas)
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
                                                          '/produto',
                                                          arguments: produtoCtrl
                                                                  .produtos[
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
                                                              Radius.circular(
                                                                  15))),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        height: 120,
                                                        width: 200,
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
                                                            produtoCtrl
                                                                    .produtos[
                                                                index]['foto'].toString(),
                                                            fit: BoxFit.cover,
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
                                                              produtoCtrl
                                                                      .produtos[
                                                                  index]['nome'].toString(),
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Constantes
                                                                    .color[900],
                                                              ))),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2,
                                                                  left: 4,
                                                                  right: 4),
                                                          child: Text(produtoCtrl
                                                                      .produtos[
                                                                  index]
                                                              ['empresa'].toString())),
                                                    ],
                                                  ),
                                                ));
                                        });
                                  }),
                                ));
                      })
                    ]));
          })
        ])));
  }
}
