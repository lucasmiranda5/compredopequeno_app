import 'package:compredopequeno/controllers/CategoriasCtrl.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:compredopequeno/widgets/carregando.dart';
import 'package:compredopequeno/widgets/rodape.dart';
import 'package:compredopequeno/widgets/topo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListagemCategorias extends StatefulWidget {
  ListagemCategorias({Key key}) : super(key: key);

  @override
  _ListagemCategoriasState createState() => _ListagemCategoriasState();
}

class _ListagemCategoriasState extends State<ListagemCategorias> {
  ScrollController scroll;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  CategoriasCtrl categoriaCtrl = CategoriasCtrl();
  @override
  void initState() {
    categoriaCtrl.carregarDados(context);
    scroll = ScrollController();
    scroll.addListener(carregarMais);
    super.initState();
  }

  void carregarMais() {
    if (scroll.offset >= scroll.position.maxScrollExtent && !scroll.position.outOfRange) {
      categoriaCtrl.carregarDados(context, true);
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
            return categoriaCtrl.carregando
                ? Carregando()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Pesquisar categoria', suffixIcon: Icon(Icons.search)),
                        onChanged: categoriaCtrl.setPesquisa,
                      ),
                      Observer(builder: (_) {
                        return categoriaCtrl.carregandoPesquisa
                            ? Carregando()
                            : RefreshIndicator(
                                onRefresh: () => categoriaCtrl.carregarDados(context),
                                child: Container(
                                  height: kIsWeb ? MediaQuery.of(context).size.height * 0.67 : MediaQuery.of(context).size.height * 0.57,
                                  child: Observer(builder: (_) {
                                    return GridView.builder(
                                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: kIsWeb ? 6 : 3),
                                        shrinkWrap: true,
                                        controller: scroll,
                                        itemCount: categoriaCtrl.categorias.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index == categoriaCtrl.categorias.length) {
                                            if (categoriaCtrl.pagina < categoriaCtrl.quantidadePaginas)
                                              return Container(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 32.0),
                                                  child: Center(child: CircularProgressIndicator()),
                                                ),
                                              );
                                            else
                                              return SizedBox();
                                          } else
                                            return InkWell(
                                                onTap: () => {Navigator.pushNamed(context, '/empresas/categoria', arguments: categoriaCtrl.categorias[index]['id'])},
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                                                  height: 100,
                                                  decoration: BoxDecoration(color: Constantes.color[800], borderRadius: BorderRadius.all(Radius.circular(15))),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          categoriaCtrl.categorias[index]['nome'],
                                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                        ),
                                                        Text(
                                                          categoriaCtrl.categorias[index]['empresas'] == 1
                                                              ? categoriaCtrl.categorias[index]['empresas'].toString() + ' empresa'
                                                              : categoriaCtrl.categorias[index]['empresas'].toString() + ' empresas',
                                                          style: TextStyle(color: Colors.white),
                                                        )
                                                      ],
                                                    ),
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
