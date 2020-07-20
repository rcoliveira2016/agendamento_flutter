// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteCadastroController on _ClienteCadastroController, Store {
  final _$clienteAtualAtom =
      Atom(name: '_ClienteCadastroController.clienteAtual');

  @override
  Cliente get clienteAtual {
    _$clienteAtualAtom.context.enforceReadPolicy(_$clienteAtualAtom);
    _$clienteAtualAtom.reportObserved();
    return super.clienteAtual;
  }

  @override
  set clienteAtual(Cliente value) {
    _$clienteAtualAtom.context.conditionallyRunInAction(() {
      super.clienteAtual = value;
      _$clienteAtualAtom.reportChanged();
    }, _$clienteAtualAtom, name: '${_$clienteAtualAtom.name}_set');
  }

  final _$ultimoAgendamentoAtom =
      Atom(name: '_ClienteCadastroController.ultimoAgendamento');

  @override
  DateTime get ultimoAgendamento {
    _$ultimoAgendamentoAtom.context.enforceReadPolicy(_$ultimoAgendamentoAtom);
    _$ultimoAgendamentoAtom.reportObserved();
    return super.ultimoAgendamento;
  }

  @override
  set ultimoAgendamento(DateTime value) {
    _$ultimoAgendamentoAtom.context.conditionallyRunInAction(() {
      super.ultimoAgendamento = value;
      _$ultimoAgendamentoAtom.reportChanged();
    }, _$ultimoAgendamentoAtom, name: '${_$ultimoAgendamentoAtom.name}_set');
  }

  final _$proximoAgendamentoAtom =
      Atom(name: '_ClienteCadastroController.proximoAgendamento');

  @override
  DateTime get proximoAgendamento {
    _$proximoAgendamentoAtom.context
        .enforceReadPolicy(_$proximoAgendamentoAtom);
    _$proximoAgendamentoAtom.reportObserved();
    return super.proximoAgendamento;
  }

  @override
  set proximoAgendamento(DateTime value) {
    _$proximoAgendamentoAtom.context.conditionallyRunInAction(() {
      super.proximoAgendamento = value;
      _$proximoAgendamentoAtom.reportChanged();
    }, _$proximoAgendamentoAtom, name: '${_$proximoAgendamentoAtom.name}_set');
  }

  final _$buscarClienteAsyncAction = AsyncAction('buscarCliente');

  @override
  Future buscarCliente(int id) {
    return _$buscarClienteAsyncAction.run(() => super.buscarCliente(id));
  }

  @override
  String toString() {
    final string =
        'clienteAtual: ${clienteAtual.toString()},ultimoAgendamento: ${ultimoAgendamento.toString()},proximoAgendamento: ${proximoAgendamento.toString()}';
    return '{$string}';
  }
}
