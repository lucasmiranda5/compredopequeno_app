// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProdutosCtrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosCtrl on _ProdutosCtrlBase, Store {
  final _$carregandoAtom = Atom(name: '_ProdutosCtrlBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$carregandoPesquisaAtom =
      Atom(name: '_ProdutosCtrlBase.carregandoPesquisa');

  @override
  bool get carregandoPesquisa {
    _$carregandoPesquisaAtom.reportRead();
    return super.carregandoPesquisa;
  }

  @override
  set carregandoPesquisa(bool value) {
    _$carregandoPesquisaAtom.reportWrite(value, super.carregandoPesquisa, () {
      super.carregandoPesquisa = value;
    });
  }

  final _$paginaAtom = Atom(name: '_ProdutosCtrlBase.pagina');

  @override
  int get pagina {
    _$paginaAtom.reportRead();
    return super.pagina;
  }

  @override
  set pagina(int value) {
    _$paginaAtom.reportWrite(value, super.pagina, () {
      super.pagina = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_ProdutosCtrlBase.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$pesquisaAtom = Atom(name: '_ProdutosCtrlBase.pesquisa');

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  final _$quantidadePaginasAtom =
      Atom(name: '_ProdutosCtrlBase.quantidadePaginas');

  @override
  int get quantidadePaginas {
    _$quantidadePaginasAtom.reportRead();
    return super.quantidadePaginas;
  }

  @override
  set quantidadePaginas(int value) {
    _$quantidadePaginasAtom.reportWrite(value, super.quantidadePaginas, () {
      super.quantidadePaginas = value;
    });
  }

  final _$empresaAtom = Atom(name: '_ProdutosCtrlBase.empresa');

  @override
  int get empresa {
    _$empresaAtom.reportRead();
    return super.empresa;
  }

  @override
  set empresa(int value) {
    _$empresaAtom.reportWrite(value, super.empresa, () {
      super.empresa = value;
    });
  }

  final _$tituloAtom = Atom(name: '_ProdutosCtrlBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$carregarDadosAsyncAction =
      AsyncAction('_ProdutosCtrlBase.carregarDados');

  @override
  Future<void> carregarDados(
      [BuildContext context, bool carregarMais = false]) {
    return _$carregarDadosAsyncAction
        .run(() => super.carregarDados(context, carregarMais));
  }

  final _$carregarProdutoAsyncAction =
      AsyncAction('_ProdutosCtrlBase.carregarProduto');

  @override
  Future<void> carregarProduto(int id) {
    return _$carregarProdutoAsyncAction.run(() => super.carregarProduto(id));
  }

  final _$_ProdutosCtrlBaseActionController =
      ActionController(name: '_ProdutosCtrlBase');

  @override
  void setEmpresa(int valor) {
    final _$actionInfo = _$_ProdutosCtrlBaseActionController.startAction(
        name: '_ProdutosCtrlBase.setEmpresa');
    try {
      return super.setEmpresa(valor);
    } finally {
      _$_ProdutosCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPesquisa(String valor) {
    final _$actionInfo = _$_ProdutosCtrlBaseActionController.startAction(
        name: '_ProdutosCtrlBase.setPesquisa');
    try {
      return super.setPesquisa(valor);
    } finally {
      _$_ProdutosCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
carregandoPesquisa: ${carregandoPesquisa},
pagina: ${pagina},
quantidade: ${quantidade},
pesquisa: ${pesquisa},
quantidadePaginas: ${quantidadePaginas},
empresa: ${empresa},
titulo: ${titulo}
    ''';
  }
}
