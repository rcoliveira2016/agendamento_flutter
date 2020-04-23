// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoStore on _AgendamentoStoreBase, Store {
  final _$dataAtom = Atom(name: '_AgendamentoStoreBase.data');

  @override
  DateTime get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$quantidadeAtom = Atom(name: '_AgendamentoStoreBase.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.context.enforceReadPolicy(_$quantidadeAtom);
    _$quantidadeAtom.reportObserved();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.context.conditionallyRunInAction(() {
      super.quantidade = value;
      _$quantidadeAtom.reportChanged();
    }, _$quantidadeAtom, name: '${_$quantidadeAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_AgendamentoStoreBase.valor');

  @override
  double get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$idClienteAtom = Atom(name: '_AgendamentoStoreBase.idCliente');

  @override
  int get idCliente {
    _$idClienteAtom.context.enforceReadPolicy(_$idClienteAtom);
    _$idClienteAtom.reportObserved();
    return super.idCliente;
  }

  @override
  set idCliente(int value) {
    _$idClienteAtom.context.conditionallyRunInAction(() {
      super.idCliente = value;
      _$idClienteAtom.reportChanged();
    }, _$idClienteAtom, name: '${_$idClienteAtom.name}_set');
  }

  final _$clienteAtom = Atom(name: '_AgendamentoStoreBase.cliente');

  @override
  Cliente get cliente {
    _$clienteAtom.context.enforceReadPolicy(_$clienteAtom);
    _$clienteAtom.reportObserved();
    return super.cliente;
  }

  @override
  set cliente(Cliente value) {
    _$clienteAtom.context.conditionallyRunInAction(() {
      super.cliente = value;
      _$clienteAtom.reportChanged();
    }, _$clienteAtom, name: '${_$clienteAtom.name}_set');
  }

  final _$_AgendamentoStoreBaseActionController =
      ActionController(name: '_AgendamentoStoreBase');

  @override
  void setData(DateTime value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction();
    try {
      return super.setData(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantidade(int value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction();
    try {
      return super.setQuantidade(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(double value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction();
    try {
      return super.setValor(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdCliente(int value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction();
    try {
      return super.setIdCliente(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCliente(Cliente value) {
    final _$actionInfo = _$_AgendamentoStoreBaseActionController.startAction();
    try {
      return super.setCliente(value);
    } finally {
      _$_AgendamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'data: ${data.toString()},quantidade: ${quantidade.toString()},valor: ${valor.toString()},idCliente: ${idCliente.toString()},cliente: ${cliente.toString()}';
    return '{$string}';
  }
}
