import 'dart:convert';

import 'package:compredopequeno/shared/constantes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'EmpresasCtrl.g.dart';

class EmpresasCtrl = _EmpresasCtrlBase with _$EmpresasCtrl;

abstract class _EmpresasCtrlBase with Store {

  
  ObservableList empresas = ObservableList.of([]);
  @observable
  bool carregando = true;

  @observable
  bool carregandoPesquisa = true;

  @observable
  String nomeCategoria = "Todas as Empresas Cadastradas";

  @observable
  int categoria = 0;
  @observable
  int pagina = 1;

  @observable
  int quantidade = 12;

  @observable
  String pesquisa = '';

  @observable
  int quantidadePaginas = 0;

  //Dados individuais da empresa
  @observable
  String ver_nome = '';
  @observable
  String ver_categoria = '';
  @observable
  String ver_marca = '';
  @observable
  String ver_horario = '';
  @observable
  String ver_descricao = '';
  ObservableList ver_contatos = ObservableList.of([]);
  ObservableList ver_produtos = ObservableList.of([]);
 



  @action
  void setPesquisa(String valor) {
    pesquisa = valor;
    carregandoPesquisa = true;
    carregarDados();
  }



  @action
  void setCategoria(int cat) => categoria = cat;
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
    if (categoria != 0)
      querys = {
        ...{'categoria': categoria.toString()},
        ...querys
      };
    var resposta = await http.get(
      Constantes.gerarURL('empresas', querys),
    );
    if (resposta.statusCode == 200) {
      var retorno = json.decode(resposta.body);
      quantidadePaginas = retorno['paginas'];
      if(categoria != 0)
        nomeCategoria = retorno['categoria'];
      if (carregarMais)
        empresas = ObservableList.of([...empresas, ...retorno['dados']]);
      else
        empresas = ObservableList.of(retorno['dados']);
    } 
    carregando = false;
    carregandoPesquisa = false;
  }

  @action 
  Future<void> carregarEmpresa(int id) async { 
    var resposta = await http.get(
      Constantes.gerarURL('empresas/'+id.toString())      
    );
    if (resposta.statusCode == 200) {
      var retorno = json.decode(resposta.body);
      ver_nome = retorno['nome'];
      ver_categoria = retorno['categoria'];
      ver_marca = retorno['marca'];
      ver_descricao = retorno['descricao'];
      ver_horario = retorno['horario_funcionamento'];
      ver_contatos = ObservableList.of(retorno['contatos']);
      ver_produtos= ObservableList.of(retorno['produtos']);
    }
    carregando = false;
  }
  
  
}