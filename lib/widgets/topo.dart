import 'package:compredopequeno/shared/constantes.dart';
import 'package:flutter/material.dart';

class Topo extends StatefulWidget {
  final barraPesquisa;
  final valorPesquisa;
  Topo({Key key, this.barraPesquisa = false, this.valorPesquisa = ''}) : super(key: key);

  @override
  _TopoState createState() => _TopoState(barraPesquisa, valorPesquisa);
}

class _TopoState extends State<Topo> {
  final barraPesquisa;
  final valorPesquisa;

  _TopoState(this.barraPesquisa, this.valorPesquisa);

  final inputPesquisa = TextEditingController();

  @override
  void initState() {
    inputPesquisa.text = valorPesquisa;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: <Widget>[
                  SizedBox(height: 20,),
                    Container(
                     
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                      context,
                                      '/');
                            },
                            child: Image.asset(
                              'assents/logoBranco.png',
                              scale: 3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          barraPesquisa ?
                          TextField(
                              controller: inputPesquisa,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                  Navigator.pushNamed(
                                                context, '/pesquisar',
                                                arguments: inputPesquisa.text);
                                },
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(40.0),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle:
                                      new TextStyle(color: Colors.grey[800]),
                                  hintText: "Pesquisar por produto ou empresa",
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                     onPressed: () {
                                         Navigator.pushNamed(
                                                context, '/pesquisar',
                                                arguments: inputPesquisa.text);
                                      },
                                  ))) : SizedBox(),
                        ],
                      ),
                    )
        ],
      );
  }
}