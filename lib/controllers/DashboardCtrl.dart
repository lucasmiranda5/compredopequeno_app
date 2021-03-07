import 'dart:convert';
import 'dart:io';

import 'package:compredopequeno/shared/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
part 'DashboardCtrl.g.dart';

class DashboardCtrl = _DashboardCtrlBase with _$DashboardCtrl;

abstract class _DashboardCtrlBase with Store {
  ObservableList categoriasEmpresa = ObservableList.of([]);
  ObservableList ultimosProdutos = ObservableList.of([]);
  ObservableList utltimasEmpresas = ObservableList.of([]);

  ObservableList resultadoEmpresas = ObservableList.of([]);
  ObservableList resultadoProdutos = ObservableList.of([]);

  @observable
  int quantidadeAbas = 0;

  @observable
  bool carregando = true;

  @observable
  int pagina_empresas = 1;

  @observable
  int quantidade_empresas = 12;

  @observable
  int quantidadePaginas_empresas = 0;

  @observable
  int pagina_produtos = 1;

  @observable
  int quantidade_produtos = 12;

  @observable
  int quantidadePaginas_produtos = 0;

  @action
  Future<void> carregar() async {
    carregando = true;

    var resposta = await http.get(Constantes.gerarURL('dashboard'));
    if (resposta.statusCode == 200) {
      var retorno = json.decode(resposta.body);
      categoriasEmpresa = ObservableList.of(retorno['categorias']);
      ultimosProdutos = ObservableList.of(retorno['ultimosProdutos']);
      utltimasEmpresas = ObservableList.of(retorno['ultimasEmpresas']);
      carregando = false;
    }
  }

  @action
  Future<void> carregarDados([String search, BuildContext context, bool carregarMaisEmpresa = false, bool carregarMaisProduto = false]) async {
    if (!carregarMaisEmpresa && !carregarMaisProduto) carregando = true;

    // Carregar Mais Empresa
    if (carregarMaisEmpresa)
      pagina_empresas = pagina_empresas + 1;
    else
      pagina_empresas = 1;
    Map<String, String> querys = {'page_empresa': pagina_empresas.toString()};

    if (quantidade_empresas != 0)
      querys = {
        ...{'limit_empresa': quantidade_empresas.toString()},
        ...querys
      };

    querys = {
      ...{'search': search.toString()},
      ...querys
    };

    // Carregar Mais Empresa
    if (carregarMaisProduto)
      pagina_produtos = pagina_produtos + 1;
    else
      pagina_produtos = 1;

    querys = {
      ...{'page_produto': pagina_produtos.toString()},
      ...querys
    };

    if (quantidade_produtos != 0)
      querys = {
        ...{'limit_produto': quantidade_produtos.toString()},
        ...querys
      };

    var resposta = await http.get(
      Constantes.gerarURL('pesquisa', querys),
    );
    if (resposta.statusCode == 200) {
      var retorno = json.decode(resposta.body);
      quantidadePaginas_empresas = retorno['paginas_empresa'];
      quantidadePaginas_produtos = retorno['paginas_produto'];

      if (carregarMaisEmpresa)
        resultadoEmpresas = ObservableList.of([...resultadoEmpresas, ...retorno['dados_empresa']]);
      else
        resultadoEmpresas = ObservableList.of(retorno['dados_empresa']);

      if (carregarMaisProduto)
        resultadoProdutos = ObservableList.of([...resultadoProdutos, ...retorno['dados_produto']]);
      else
        resultadoProdutos = ObservableList.of(retorno['dados_produto']);
    }
    quantidadeAbas = 2;
    carregando = false;
  }
}
