// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoCadastroController on _AgendamentoCadastroController, Store {
  Computed<double> _$valorCalculadoComputed;

  @override
  double get valorCalculado => (_$valorCalculadoComputed ??=
          Computed<double>(() => super.valorCalculado))
      .value;
  Computed<int> _$quantidadeCavalosComputed;

  @override
  int get quantidadeCavalos => (_$quantidadeCavalosComputed ??=
          Computed<int>(() => super.quantidadeCavalos))
      .value;
  Computed<String> _$localPadraoComputed;

  @override
  String get localPadrao =>
      (_$localPadraoComputed ??= Computed<String>(() => super.localPadrao))
          .value;

  final _$agendamentoAtualAtom =
      Atom(name: '_AgendamentoCadastroController.agendamentoAtual');

  @override
  AgendamentoStore get agendamentoAtual {
    _$agendamentoAtualAtom.context.enforceReadPolicy(_$agendamentoAtualAtom);
    _$agendamentoAtualAtom.reportObserved();
    return super.agendamentoAtual;
  }

  @override
  set agendamentoAtual(AgendamentoStore value) {
    _$agendamentoAtualAtom.context.conditionallyRunInAction(() {
      super.agendamentoAtual = value;
      _$agendamentoAtualAtom.reportChanged();
    }, _$agendamentoAtualAtom, name: '${_$agendamentoAtualAtom.name}_set');
  }

  final _$itemsClientesAtom =
      Atom(name: '_AgendamentoCadastroController.itemsClientes');

  @override
  ObservableList<Cliente> get itemsClientes {
    _$itemsClientesAtom.context.enforceReadPolicy(_$itemsClientesAtom);
    _$itemsClientesAtom.reportObserved();
    return super.itemsClientes;
  }

  @override
  set itemsClientes(ObservableList<Cliente> value) {
    _$itemsClientesAtom.context.conditionallyRunInAction(() {
      super.itemsClientes = value;
      _$itemsClientesAtom.reportChanged();
    }, _$itemsClientesAtom, name: '${_$itemsClientesAtom.name}_set');
  }

  final _$setarClienteAsyncAction = AsyncAction('setarCliente');

  @override
  Future setarCliente(int id) {
    return _$setarClienteAsyncAction.run(() => super.setarCliente(id));
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init(int id, int idCliente) {
    return _$initAsyncAction.run(() => super.init(id, idCliente));
  }

  @override
  String toString() {
    final string =
        'agendamentoAtual: ${agendamentoAtual.toString()},itemsClientes: ${itemsClientes.toString()},valorCalculado: ${valorCalculado.toString()},quantidadeCavalos: ${quantidadeCavalos.toString()},localPadrao: ${localPadrao.toString()}';
    return '{$string}';
  }
}
