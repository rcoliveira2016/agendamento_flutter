// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteCadastroController on _ClienteCadastroController, Store {
  final _$clienteAtualAtom =
      Atom(name: '_ClienteCadastroController.clienteAtual');

  @override
  Cliente get clienteAtual {
    _$clienteAtualAtom.reportRead();
    return super.clienteAtual;
  }

  @override
  set clienteAtual(Cliente value) {
    _$clienteAtualAtom.reportWrite(value, super.clienteAtual, () {
      super.clienteAtual = value;
    });
  }

  final _$ultimoAgendamentoAtom =
      Atom(name: '_ClienteCadastroController.ultimoAgendamento');

  @override
  DateTime get ultimoAgendamento {
    _$ultimoAgendamentoAtom.reportRead();
    return super.ultimoAgendamento;
  }

  @override
  set ultimoAgendamento(DateTime value) {
    _$ultimoAgendamentoAtom.reportWrite(value, super.ultimoAgendamento, () {
      super.ultimoAgendamento = value;
    });
  }

  final _$proximoAgendamentoAtom =
      Atom(name: '_ClienteCadastroController.proximoAgendamento');

  @override
  DateTime get proximoAgendamento {
    _$proximoAgendamentoAtom.reportRead();
    return super.proximoAgendamento;
  }

  @override
  set proximoAgendamento(DateTime value) {
    _$proximoAgendamentoAtom.reportWrite(value, super.proximoAgendamento, () {
      super.proximoAgendamento = value;
    });
  }

  final _$itemsDeAgendamentosAtom =
      Atom(name: '_ClienteCadastroController.itemsDeAgendamentos');

  @override
  ObservableList<Agendamento> get itemsDeAgendamentos {
    _$itemsDeAgendamentosAtom.reportRead();
    return super.itemsDeAgendamentos;
  }

  @override
  set itemsDeAgendamentos(ObservableList<Agendamento> value) {
    _$itemsDeAgendamentosAtom.reportWrite(value, super.itemsDeAgendamentos, () {
      super.itemsDeAgendamentos = value;
    });
  }

  final _$buscarClienteAsyncAction =
      AsyncAction('_ClienteCadastroController.buscarCliente');

  @override
  Future buscarCliente(int id) {
    return _$buscarClienteAsyncAction.run(() => super.buscarCliente(id));
  }

  final _$mostarAgendamentosAsyncAction =
      AsyncAction('_ClienteCadastroController.mostarAgendamentos');

  @override
  Future mostarAgendamentos() {
    return _$mostarAgendamentosAsyncAction
        .run(() => super.mostarAgendamentos());
  }

  final _$carregarProximosAgendamentosAsyncAction =
      AsyncAction('_ClienteCadastroController.carregarProximosAgendamentos');

  @override
  Future carregarProximosAgendamentos() {
    return _$carregarProximosAgendamentosAsyncAction
        .run(() => super.carregarProximosAgendamentos());
  }

  @override
  String toString() {
    return '''
clienteAtual: ${clienteAtual},
ultimoAgendamento: ${ultimoAgendamento},
proximoAgendamento: ${proximoAgendamento},
itemsDeAgendamentos: ${itemsDeAgendamentos}
    ''';
  }
}
