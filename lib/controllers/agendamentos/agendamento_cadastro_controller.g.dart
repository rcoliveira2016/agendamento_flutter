// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoCadastroController on _AgendamentoCadastroController, Store {
  Computed<double> _$valorCalculadoComputed;

  @override
  double get valorCalculado =>
      (_$valorCalculadoComputed ??= Computed<double>(() => super.valorCalculado,
              name: '_AgendamentoCadastroController.valorCalculado'))
          .value;
  Computed<int> _$quantidadeCavalosComputed;

  @override
  int get quantidadeCavalos => (_$quantidadeCavalosComputed ??= Computed<int>(
          () => super.quantidadeCavalos,
          name: '_AgendamentoCadastroController.quantidadeCavalos'))
      .value;
  Computed<String> _$localPadraoComputed;

  @override
  String get localPadrao =>
      (_$localPadraoComputed ??= Computed<String>(() => super.localPadrao,
              name: '_AgendamentoCadastroController.localPadrao'))
          .value;
  Computed<int> _$indexFerramentaNovaComputed;

  @override
  int get indexFerramentaNova => (_$indexFerramentaNovaComputed ??=
          Computed<int>(() => super.indexFerramentaNova,
              name: '_AgendamentoCadastroController.indexFerramentaNova'))
      .value;

  final _$agendamentoAtualAtom =
      Atom(name: '_AgendamentoCadastroController.agendamentoAtual');

  @override
  AgendamentoStore get agendamentoAtual {
    _$agendamentoAtualAtom.reportRead();
    return super.agendamentoAtual;
  }

  @override
  set agendamentoAtual(AgendamentoStore value) {
    _$agendamentoAtualAtom.reportWrite(value, super.agendamentoAtual, () {
      super.agendamentoAtual = value;
    });
  }

  final _$itemsClientesAtom =
      Atom(name: '_AgendamentoCadastroController.itemsClientes');

  @override
  ObservableList<Cliente> get itemsClientes {
    _$itemsClientesAtom.reportRead();
    return super.itemsClientes;
  }

  @override
  set itemsClientes(ObservableList<Cliente> value) {
    _$itemsClientesAtom.reportWrite(value, super.itemsClientes, () {
      super.itemsClientes = value;
    });
  }

  final _$setarClienteAsyncAction =
      AsyncAction('_AgendamentoCadastroController.setarCliente');

  @override
  Future setarCliente(int id) {
    return _$setarClienteAsyncAction.run(() => super.setarCliente(id));
  }

  final _$initAsyncAction = AsyncAction('_AgendamentoCadastroController.init');

  @override
  Future<void> init(int id, int idCliente) {
    return _$initAsyncAction.run(() => super.init(id, idCliente));
  }

  @override
  String toString() {
    return '''
agendamentoAtual: ${agendamentoAtual},
itemsClientes: ${itemsClientes},
valorCalculado: ${valorCalculado},
quantidadeCavalos: ${quantidadeCavalos},
localPadrao: ${localPadrao},
indexFerramentaNova: ${indexFerramentaNova}
    ''';
  }
}
