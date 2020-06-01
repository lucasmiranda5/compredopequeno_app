// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriasCtrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriasCtrl on _CategoriasCtrlBase, Store {
  final _$carregandoAtom = Atom(name: '_CategoriasCtrlBase.carregando');

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
      Atom(name: '_CategoriasCtrlBase.carregandoPesquisa');

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

  final _$paginaAtom = Atom(name: '_CategoriasCtrlBase.pagina');

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

  final _$quantidadeAtom = Atom(name: '_CategoriasCtrlBase.quantidade');

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

  final _$pesquisaAtom = Atom(name: '_CategoriasCtrlBase.pesquisa');

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
      Atom(name: '_CategoriasCtrlBase.quantidadePaginas');

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

  final _$carregarDadosAsyncAction =
      AsyncAction('_CategoriasCtrlBase.carregarDados');

  @override
  Future<void> carregarDados(
      [BuildContext context, bool carregarMais = false]) {
    return _$carregarDadosAsyncAction
        .run(() => super.carregarDados(context, carregarMais));
  }

  final _$_CategoriasCtrlBaseActionController =
      ActionController(name: '_CategoriasCtrlBase');

  @override
  void setPesquisa(String valor) {
    final _$actionInfo = _$_CategoriasCtrlBaseActionController.startAction(
        name: '_CategoriasCtrlBase.setPesquisa');
    try {
      return super.setPesquisa(valor);
    } finally {
      _$_CategoriasCtrlBaseActionController.endAction(_$actionInfo);
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
quantidadePaginas: ${quantidadePaginas}
    ''';
  }
}
