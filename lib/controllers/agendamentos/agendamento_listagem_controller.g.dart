// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_listagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoListagemController
    on _AgendamentoListagemControllerBase, Store {
  final _$dataInicioSemanaAtom =
      Atom(name: '_AgendamentoListagemControllerBase.dataInicioSemana');

  @override
  DateTime get dataInicioSemana {
    _$dataInicioSemanaAtom.context.enforceReadPolicy(_$dataInicioSemanaAtom);
    _$dataInicioSemanaAtom.reportObserved();
    return super.dataInicioSemana;
  }

  @override
  set dataInicioSemana(DateTime value) {
    _$dataInicioSemanaAtom.context.conditionallyRunInAction(() {
      super.dataInicioSemana = value;
      _$dataInicioSemanaAtom.reportChanged();
    }, _$dataInicioSemanaAtom, name: '${_$dataInicioSemanaAtom.name}_set');
  }

  final _$dataFinalSemanaAtom =
      Atom(name: '_AgendamentoListagemControllerBase.dataFinalSemana');

  @override
  DateTime get dataFinalSemana {
    _$dataFinalSemanaAtom.context.enforceReadPolicy(_$dataFinalSemanaAtom);
    _$dataFinalSemanaAtom.reportObserved();
    return super.dataFinalSemana;
  }

  @override
  set dataFinalSemana(DateTime value) {
    _$dataFinalSemanaAtom.context.conditionallyRunInAction(() {
      super.dataFinalSemana = value;
      _$dataFinalSemanaAtom.reportChanged();
    }, _$dataFinalSemanaAtom, name: '${_$dataFinalSemanaAtom.name}_set');
  }

  final _$itemsAtom = Atom(name: '_AgendamentoListagemControllerBase.items');

  @override
  ObservableList<AgendamentoListagemModel> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<AgendamentoListagemModel> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$filtroDataAsyncAction = AsyncAction('filtroData');

  @override
  Future filtroData(DateTime dataDiaSemana) {
    return _$filtroDataAsyncAction.run(() => super.filtroData(dataDiaSemana));
  }

  final _$cadastroAsyncAction = AsyncAction('cadastro');

  @override
  Future cadastro(AgendamentoListagemModel model) {
    return _$cadastroAsyncAction.run(() => super.cadastro(model));
  }

  final _$deletarAsyncAction = AsyncAction('deletar');

  @override
  Future deletar(int id) {
    return _$deletarAsyncAction.run(() => super.deletar(id));
  }

  @override
  String toString() {
    final string =
        'dataInicioSemana: ${dataInicioSemana.toString()},dataFinalSemana: ${dataFinalSemana.toString()},items: ${items.toString()}';
    return '{$string}';
  }
}
