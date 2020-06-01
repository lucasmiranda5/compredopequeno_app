import 'dart:convert';

import 'package:compredopequeno/shared/constantes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'ProdutosCtrl.g.dart';

class ProdutosCtrl = _ProdutosCtrlBase with _$ProdutosCtrl;

abstract class _ProdutosCtrlBase with Store {
  
   ObservableList produtos = ObservableList.of([]);
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

  @observable
  int empresa = 0;

  @observable
  String titulo = "Todos os produtos";


  // variaveis para pagina de ver
  String ver_empresa = '';
  String ver_nome = '';
  String ver_descricao = '';
  String ver_categoria = '';
  String ver_preco = '';
  String ver_foto = '';
  int ver_id_empresa = 0;

  @action
  void setEmpresa(int valor) => empresa = valor;

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
    if (empresa != 0)
      querys = {
        ...{'empresa': empresa.toString()},
        ...querys
      };
    var resposta = await http.get(
      Constantes.gerarURL('produtos', querys),
    );
    if (resposta.statusCode == 200) {
      


      var retorno = json.decode(resposta.body);
      if(empresa != 0)
        titulo = retorno['empresa'];
      quantidadePaginas = retorno['paginas'];
      if (carregarMais)
        produtos = ObservableList.of([...produtos, ...retorno['dados']]);
      else
        produtos = ObservableList.of(retorno['dados']);
    } 
    carregando = false;
    carregandoPesquisa = false;
  }

  @action 
  Future<void> carregarProduto(int id) async { 
    var resposta = await http.get(
      Constantes.gerarURL('produtos/'+id.toString())      
    );
    if (resposta.statusCode == 200) {
      var retorno = json.decode(resposta.body);
      ver_nome = retorno['nome'];
      ver_categoria = retorno['categoria'];
      ver_empresa = retorno['empresa'];
      ver_descricao = retorno['descricao'];
      ver_preco = retorno['preco'];
      ver_foto = retorno['foto'];
      ver_id_empresa = retorno['id_empresa'];
    }
    carregando = false;
  }

}