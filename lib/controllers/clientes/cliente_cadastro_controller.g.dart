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

  final _$buscarClienteAsyncAction = AsyncAction('buscarCliente');

  @override
  Future buscarCliente(int id) {
    return _$buscarClienteAsyncAction.run(() => super.buscarCliente(id));
  }

  @override
  String toString() {
    final string = 'clienteAtual: ${clienteAtual.toString()}';
    return '{$string}';
  }
}
