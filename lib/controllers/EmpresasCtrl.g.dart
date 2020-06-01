// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmpresasCtrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresasCtrl on _EmpresasCtrlBase, Store {
  final _$carregandoAtom = Atom(name: '_EmpresasCtrlBase.carregando');

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
      Atom(name: '_EmpresasCtrlBase.carregandoPesquisa');

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

  final _$nomeCategoriaAtom = Atom(name: '_EmpresasCtrlBase.nomeCategoria');

  @override
  String get nomeCategoria {
    _$nomeCategoriaAtom.reportRead();
    return super.nomeCategoria;
  }

  @override
  set nomeCategoria(String value) {
    _$nomeCategoriaAtom.reportWrite(value, super.nomeCategoria, () {
      super.nomeCategoria = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_EmpresasCtrlBase.categoria');

  @override
  int get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(int value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$paginaAtom = Atom(name: '_EmpresasCtrlBase.pagina');

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

  final _$quantidadeAtom = Atom(name: '_EmpresasCtrlBase.quantidade');

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

  final _$pesquisaAtom = Atom(name: '_EmpresasCtrlBase.pesquisa');

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
      Atom(name: '_EmpresasCtrlBase.quantidadePaginas');

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

  final _$ver_nomeAtom = Atom(name: '_EmpresasCtrlBase.ver_nome');

  @override
  String get ver_nome {
    _$ver_nomeAtom.reportRead();
    return super.ver_nome;
  }

  @override
  set ver_nome(String value) {
    _$ver_nomeAtom.reportWrite(value, super.ver_nome, () {
      super.ver_nome = value;
    });
  }

  final _$ver_categoriaAtom = Atom(name: '_EmpresasCtrlBase.ver_categoria');

  @override
  String get ver_categoria {
    _$ver_categoriaAtom.reportRead();
    return super.ver_categoria;
  }

  @override
  set ver_categoria(String value) {
    _$ver_categoriaAtom.reportWrite(value, super.ver_categoria, () {
      super.ver_categoria = value;
    });
  }

  final _$ver_marcaAtom = Atom(name: '_EmpresasCtrlBase.ver_marca');

  @override
  String get ver_marca {
    _$ver_marcaAtom.reportRead();
    return super.ver_marca;
  }

  @override
  set ver_marca(String value) {
    _$ver_marcaAtom.reportWrite(value, super.ver_marca, () {
      super.ver_marca = value;
    });
  }

  final _$ver_horarioAtom = Atom(name: '_EmpresasCtrlBase.ver_horario');

  @override
  String get ver_horario {
    _$ver_horarioAtom.reportRead();
    return super.ver_horario;
  }

  @override
  set ver_horario(String value) {
    _$ver_horarioAtom.reportWrite(value, super.ver_horario, () {
      super.ver_horario = value;
    });
  }

  final _$ver_descricaoAtom = Atom(name: '_EmpresasCtrlBase.ver_descricao');

  @override
  String get ver_descricao {
    _$ver_descricaoAtom.reportRead();
    return super.ver_descricao;
  }

  @override
  set ver_descricao(String value) {
    _$ver_descricaoAtom.reportWrite(value, super.ver_descricao, () {
      super.ver_descricao = value;
    });
  }

  final _$carregarDadosAsyncAction =
      AsyncAction('_EmpresasCtrlBase.carregarDados');

  @override
  Future<void> carregarDados(
      [BuildContext context, bool carregarMais = false]) {
    return _$carregarDadosAsyncAction
        .run(() => super.carregarDados(context, carregarMais));
  }

  final _$carregarEmpresaAsyncAction =
      AsyncAction('_EmpresasCtrlBase.carregarEmpresa');

  @override
  Future<void> carregarEmpresa(int id) {
    return _$carregarEmpresaAsyncAction.run(() => super.carregarEmpresa(id));
  }

  final _$_EmpresasCtrlBaseActionController =
      ActionController(name: '_EmpresasCtrlBase');

  @override
  void setPesquisa(String valor) {
    final _$actionInfo = _$_EmpresasCtrlBaseActionController.startAction(
        name: '_EmpresasCtrlBase.setPesquisa');
    try {
      return super.setPesquisa(valor);
    } finally {
      _$_EmpresasCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoria(int cat) {
    final _$actionInfo = _$_EmpresasCtrlBaseActionController.startAction(
        name: '_EmpresasCtrlBase.setCategoria');
    try {
      return super.setCategoria(cat);
    } finally {
      _$_EmpresasCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
carregandoPesquisa: ${carregandoPesquisa},
nomeCategoria: ${nomeCategoria},
categoria: ${categoria},
pagina: ${pagina},
quantidade: ${quantidade},
pesquisa: ${pesquisa},
quantidadePaginas: ${quantidadePaginas},
ver_nome: ${ver_nome},
ver_categoria: ${ver_categoria},
ver_marca: ${ver_marca},
ver_horario: ${ver_horario},
ver_descricao: ${ver_descricao}
    ''';
  }
}
