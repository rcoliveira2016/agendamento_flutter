// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoStore on _AgendamentoStoreBase, Store {
  final _$dataAtom = Atom(name: '_AgendamentoStoreBase.data');

  @override
  DateTime get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_AgendamentoStoreBase.quantidade');

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

  final _$valorAtom = Atom(name: '_AgendamentoStoreBase.valor');

  @override
  double get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$idClienteAtom = Atom(name: '_AgendamentoStoreBase.idCliente');

  @override
  int get idCliente {
    _$idClienteAtom.reportRead();
    return super.idCliente;
  }

  @override
  set idCliente(int value) {
    _$idClienteAtom.reportWrite(value, super.idCliente, () {
      super.idCliente = value;
    });
  }

  final _$clienteAtom = Atom(name: '_AgendamentoStoreBase.cliente');

  @override
  Cliente get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(Cliente value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$observacaoAtom = Atom(name: '_AgendamentoStoreBase.observacao');

  @override
  String get observacao {
    _$observacaoAtom.reportRead();
    return super.observacao;
  }

  @override
  set observacao(String value) {
    _$observacaoAtom.reportWrite(value, super.observacao, () {
      super.observacao = value;
    });
  }

  final _$ferramentaNovaAtom =
      Atom(name: '_AgendamentoStoreBase.ferramentaNova');

  @override
  bool get ferramentaNova {
    _$ferramentaNovaAtom.reportRead();
    return super.ferramentaNova;
  }

  @override
  set ferramentaNova(bool value) {
    _$ferramentaNovaAtom.reportWrite(value, super.ferramentaNova, () {
      super.ferramentaNova = value;
    });
  }

  final _$_AgendamentoStoreBaseActionController =
      ActionController(name: '_AgendamentoStoreBase');

  @override
  void setData(DateTime value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setData');
    try {
      return super.setData(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantidade(int value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setQuantidade');
    try {
      return super.setQuantidade(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(double value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setValor');
    try {
      return super.setValor(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdCliente(int value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setIdCliente');
    try {
      return super.setIdCliente(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCliente(Cliente value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setCliente');
    try {
      return super.setCliente(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservacao(String value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setObservacao');
    try {
      return super.setObservacao(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFerramentaNova(bool value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction(
        name: '_AgendamentoStoreBase.setFerramentaNova');
    try {
      return super.setFerramentaNova(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
quantidade: ${quantidade},
valor: ${valor},
idCliente: ${idCliente},
cliente: ${cliente},
observacao: ${observacao},
ferramentaNova: ${ferramentaNova}
    ''';
  }
}
