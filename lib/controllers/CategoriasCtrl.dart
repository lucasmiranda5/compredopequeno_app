import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:compredopequeno/shared/constantes.dart';
import 'package:http/http.dart' as http;
part 'CategoriasCtrl.g.dart';

class CategoriasCtrl = _CategoriasCtrlBase with _$CategoriasCtrl;

abstract class _CategoriasCtrlBase with Store {
  
  ObservableList categorias = ObservableList.of([]);
  @observable
  bool carregando = true;

  @observable
  bool carregandoPesquisa = true;

  @observable
  int pagina = 1;

  @observable
  int quantidade = 12;

  @observable
  String pesquisa = '';

  @observable
  int quantidadePaginas = 0;



  @action
  void setPesquisa(String valor) {
    pesquisa = valor;
    carregandoPesquisa = true;
    carregarDados();
  }

  @action
  Future<void> carregarDados(
      [BuildContext context, bool carregarMais = false]) async {
    if (!carregarMais && !carregandoPesquisa) carregando = true;
    if (carregarMais)
      pagina = pagina + 1;
    else
      pagina = 1;
    Map<String, String> querys = {'page': pagina.toString()};
    if (pesquisa != '')
      querys = {
        ...{'search': pesquisa},
        ...querys
      };
    if (quantidade != 0)
      querys = {
        ...{'limit': quantidade.toString()},
        ...querys
      };
    var resposta = await http.get(
      Constantes.gerarURL('categorias', querys),
    );
    if (resposta.statusCode == 200) {

      var retorno = json.decode(resposta.body);
      quantidadePaginas = retorno['paginas'];
      if (carregarMais)
        categorias = ObservableList.of([...categorias, ...retorno['dados']]);
      else
        categorias = ObservableList.of(retorno['dados']);
    } 
    carregando = false;
    carregandoPesquisa = false;
  }


}