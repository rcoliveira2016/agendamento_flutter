// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoCadastroController on _AgendamentoCadastroController, Store {
  final _$agendamentoAtualAtom =
      Atom(name: '_AgendamentoCadastroController.agendamentoAtual');

  @override
  Agendamento get agendamentoAtual {
    _$agendamentoAtualAtom.context.enforceReadPolicy(_$agendamentoAtualAtom);
    _$agendamentoAtualAtom.reportObserved();
    return super.agendamentoAtual;
  }

  @override
  set agendamentoAtual(Agendamento value) {
    _$agendamentoAtualAtom.context.conditionallyRunInAction(() {
      super.agendamentoAtual = value;
      _$agendamentoAtualAtom.reportChanged();
    }, _$agendamentoAtualAtom, name: '${_$agendamentoAtualAtom.name}_set');
  }

  final _$buscarAgendamentoAsyncAction = AsyncAction('buscarAgendamento');

  @override
  Future buscarAgendamento(int id) {
    return _$buscarAgendamentoAsyncAction
        .run(() => super.buscarAgendamento(id));
  }

  @override
  String toString() {
    final string = 'agendamentoAtual: ${agendamentoAtual.toString()}';
    return '{$string}';
  }
}
