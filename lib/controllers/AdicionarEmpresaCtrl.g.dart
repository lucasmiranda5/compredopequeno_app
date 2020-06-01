// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdicionarEmpresaCtrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdicionarEmpresaCtrl on _AdicionarEmpresaCtrlBase, Store {
  final _$nomeEmpresaAtom = Atom(name: '_AdicionarEmpresaCtrlBase.nomeEmpresa');

  @override
  String get nomeEmpresa {
    _$nomeEmpresaAtom.reportRead();
    return super.nomeEmpresa;
  }

  @override
  set nomeEmpresa(String value) {
    _$nomeEmpresaAtom.reportWrite(value, super.nomeEmpresa, () {
      super.nomeEmpresa = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_AdicionarEmpresaCtrlBase.categoria');

  @override
  String get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(String value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_AdicionarEmpresaCtrlBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$horarioFuncionamentoAtom =
      Atom(name: '_AdicionarEmpresaCtrlBase.horarioFuncionamento');

  @override
  String get horarioFuncionamento {
    _$horarioFuncionamentoAtom.reportRead();
    return super.horarioFuncionamento;
  }

  @override
  set horarioFuncionamento(String value) {
    _$horarioFuncionamentoAtom.reportWrite(value, super.horarioFuncionamento,
        () {
      super.horarioFuncionamento = value;
    });
  }

  final _$contatosAtom = Atom(name: '_AdicionarEmpresaCtrlBase.contatos');

  @override
  List<dynamic> get contatos {
    _$contatosAtom.reportRead();
    return super.contatos;
  }

  @override
  set contatos(List<dynamic> value) {
    _$contatosAtom.reportWrite(value, super.contatos, () {
      super.contatos = value;
    });
  }

  final _$nomeResponsavelAtom =
      Atom(name: '_AdicionarEmpresaCtrlBase.nomeResponsavel');

  @override
  String get nomeResponsavel {
    _$nomeResponsavelAtom.reportRead();
    return super.nomeResponsavel;
  }

  @override
  set nomeResponsavel(String value) {
    _$nomeResponsavelAtom.reportWrite(value, super.nomeResponsavel, () {
      super.nomeResponsavel = value;
    });
  }

  final _$telefoneResponsavelAtom =
      Atom(name: '_AdicionarEmpresaCtrlBase.telefoneResponsavel');

  @override
  String get telefoneResponsavel {
    _$telefoneResponsavelAtom.reportRead();
    return super.telefoneResponsavel;
  }

  @override
  set telefoneResponsavel(String value) {
    _$telefoneResponsavelAtom.reportWrite(value, super.telefoneResponsavel, () {
      super.telefoneResponsavel = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_AdicionarEmpresaCtrlBase.carregando');

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

  final _$fileAtom = Atom(name: '_AdicionarEmpresaCtrlBase.file');

  @override
  File get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$escolherAsyncAction =
      AsyncAction('_AdicionarEmpresaCtrlBase.escolher');

  @override
  Future<void> escolher() {
    return _$escolherAsyncAction.run(() => super.escolher());
  }

  final _$salvarAsyncAction = AsyncAction('_AdicionarEmpresaCtrlBase.salvar');

  @override
  Future<void> salvar(
      GlobalKey<ScaffoldState> scaffodkey, BuildContext context) {
    return _$salvarAsyncAction.run(() => super.salvar(scaffodkey, context));
  }

  final _$carregarAsyncAction =
      AsyncAction('_AdicionarEmpresaCtrlBase.carregar');

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$_AdicionarEmpresaCtrlBaseActionController =
      ActionController(name: '_AdicionarEmpresaCtrlBase');

  @override
  void setEmpresa(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setEmpresa');
    try {
      return super.setEmpresa(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoria(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setCategoria');
    try {
      return super.setCategoria(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setDescricao');
    try {
      return super.setDescricao(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHorario(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setHorario');
    try {
      return super.setHorario(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContato(int index, int tipo, String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setContato');
    try {
      return super.setContato(index, tipo, valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsavel(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setResponsavel');
    try {
      return super.setResponsavel(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefoneResponsavel(String valor) {
    final _$actionInfo = _$_AdicionarEmpresaCtrlBaseActionController
        .startAction(name: '_AdicionarEmpresaCtrlBase.setTelefoneResponsavel');
    try {
      return super.setTelefoneResponsavel(valor);
    } finally {
      _$_AdicionarEmpresaCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeEmpresa: ${nomeEmpresa},
categoria: ${categoria},
descricao: ${descricao},
horarioFuncionamento: ${horarioFuncionamento},
contatos: ${contatos},
nomeResponsavel: ${nomeResponsavel},
telefoneResponsavel: ${telefoneResponsavel},
carregando: ${carregando},
file: ${file}
    ''';
  }
}
