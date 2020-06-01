
import 'package:compredopequeno/views/cadastrar.dart';
import 'package:compredopequeno/views/cadastro_feito.dart';
import 'package:compredopequeno/views/categorias/listagem.dart';
import 'package:compredopequeno/views/dasboard.dart';
import 'package:compredopequeno/views/empresas/listagem.dart';
import 'package:compredopequeno/views/empresas/ver.dart';
import 'package:compredopequeno/views/pesquisar.dart';
import 'package:compredopequeno/views/produtos/listagem.dart';
import 'package:compredopequeno/views/produtos/ver.dart';
import 'package:compredopequeno/views/sobre.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> rotas(BuildContext context) {
  return {
    '/': (context) => Dashboard(),
    '/sobre': (context) => Sobre(),
    '/categorias': (context) => ListagemCategorias(),
    '/empresas': (context) => ListagemEmpresa(),
    '/cadastrar': (context) => CadastrarEmpresa(),
    '/cadastrarFeito': (context) => CadastroFeito(),
     '/pesquisar': (context) => Pesquisar(
        pesquisar: ModalRoute.of(context).settings.arguments,
      ),
    
    '/empresas/categoria': (context) => ListagemEmpresa(
        categoria: ModalRoute.of(context).settings.arguments,
      ),
    '/empresa': (context) => VerEmpresa(
        id: ModalRoute.of(context).settings.arguments,
      ),
    '/produtos': (context) => ListagemProdutos(), 
    '/produtos/empresa': (context) => ListagemProdutos(
        empresa: ModalRoute.of(context).settings.arguments,
      ),
    '/produto': (context) => VerProduto(
        id: ModalRoute.of(context).settings.arguments,
      ),
  };
}