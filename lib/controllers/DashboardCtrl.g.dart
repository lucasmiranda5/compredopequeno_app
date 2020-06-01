// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashboardCtrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardCtrl on _DashboardCtrlBase, Store {
  final _$quantidadeAbasAtom = Atom(name: '_DashboardCtrlBase.quantidadeAbas');

  @override
  int get quantidadeAbas {
    _$quantidadeAbasAtom.reportRead();
    return super.quantidadeAbas;
  }

  @override
  set quantidadeAbas(int value) {
    _$quantidadeAbasAtom.reportWrite(value, super.quantidadeAbas, () {
      super.quantidadeAbas = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_DashboardCtrlBase.carregando');

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

  final _$pagina_empresasAtom =
      Atom(name: '_DashboardCtrlBase.pagina_empresas');

  @override
  int get pagina_empresas {
    _$pagina_empresasAtom.reportRead();
    return super.pagina_empresas;
  }

  @override
  set pagina_empresas(int value) {
    _$pagina_empresasAtom.reportWrite(value, super.pagina_empresas, () {
      super.pagina_empresas = value;
    });
  }

  final _$quantidade_empresasAtom =
      Atom(name: '_DashboardCtrlBase.quantidade_empresas');

  @override
  int get quantidade_empresas {
    _$quantidade_empresasAtom.reportRead();
    return super.quantidade_empresas;
  }

  @override
  set quantidade_empresas(int value) {
    _$quantidade_empresasAtom.reportWrite(value, super.quantidade_empresas, () {
      super.quantidade_empresas = value;
    });
  }

  final _$quantidadePaginas_empresasAtom =
      Atom(name: '_DashboardCtrlBase.quantidadePaginas_empresas');

  @override
  int get quantidadePaginas_empresas {
    _$quantidadePaginas_empresasAtom.reportRead();
    return super.quantidadePaginas_empresas;
  }

  @override
  set quantidadePaginas_empresas(int value) {
    _$quantidadePaginas_empresasAtom
        .reportWrite(value, super.quantidadePaginas_empresas, () {
      super.quantidadePaginas_empresas = value;
    });
  }

  final _$pagina_produtosAtom =
      Atom(name: '_DashboardCtrlBase.pagina_produtos');

  @override
  int get pagina_produtos {
    _$pagina_produtosAtom.reportRead();
    return super.pagina_produtos;
  }

  @override
  set pagina_produtos(int value) {
    _$pagina_produtosAtom.reportWrite(value, super.pagina_produtos, () {
      super.pagina_produtos = value;
    });
  }

  final _$quantidade_produtosAtom =
      Atom(name: '_DashboardCtrlBase.quantidade_produtos');

  @override
  int get quantidade_produtos {
    _$quantidade_produtosAtom.reportRead();
    return super.quantidade_produtos;
  }

  @override
  set quantidade_produtos(int value) {
    _$quantidade_produtosAtom.reportWrite(value, super.quantidade_produtos, () {
      super.quantidade_produtos = value;
    });
  }

  final _$quantidadePaginas_produtosAtom =
      Atom(name: '_DashboardCtrlBase.quantidadePaginas_produtos');

  @override
  int get quantidadePaginas_produtos {
    _$quantidadePaginas_produtosAtom.reportRead();
    return super.quantidadePaginas_produtos;
  }

  @override
  set quantidadePaginas_produtos(int value) {
    _$quantidadePaginas_produtosAtom
        .reportWrite(value, super.quantidadePaginas_produtos, () {
      super.quantidadePaginas_produtos = value;
    });
  }

  final _$carregarAsyncAction = AsyncAction('_DashboardCtrlBase.carregar');

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$carregarDadosAsyncAction =
      AsyncAction('_DashboardCtrlBase.carregarDados');

  @override
  Future<void> carregarDados(
      [String search,
      BuildContext context,
      bool carregarMaisEmpresa = false,
      bool carregarMaisProduto = false]) {
    return _$carregarDadosAsyncAction.run(() => super.carregarDados(
        search, context, carregarMaisEmpresa, carregarMaisProduto));
  }

  @override
  String toString() {
    return '''
quantidadeAbas: ${quantidadeAbas},
carregando: ${carregando},
pagina_empresas: ${pagina_empresas},
quantidade_empresas: ${quantidade_empresas},
quantidadePaginas_empresas: ${quantidadePaginas_empresas},
pagina_produtos: ${pagina_produtos},
quantidade_produtos: ${quantidade_produtos},
quantidadePaginas_produtos: ${quantidadePaginas_produtos}
    ''';
  }
}
