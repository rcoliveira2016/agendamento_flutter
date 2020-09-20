// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_listagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoListagemController
    on _AgendamentoListagemControllerBase, Store {
  final _$dataInicioSemanaAtom =
      Atom(name: '_AgendamentoListagemControllerBase.dataInicioSemana');

  @override
  DateTime get dataInicioSemana {
    _$dataInicioSemanaAtom.reportRead();
    return super.dataInicioSemana;
  }

  @override
  set dataInicioSemana(DateTime value) {
    _$dataInicioSemanaAtom.reportWrite(value, super.dataInicioSemana, () {
      super.dataInicioSemana = value;
    });
  }

  final _$dataFinalSemanaAtom =
      Atom(name: '_AgendamentoListagemControllerBase.dataFinalSemana');

  @override
  DateTime get dataFinalSemana {
    _$dataFinalSemanaAtom.reportRead();
    return super.dataFinalSemana;
  }

  @override
  set dataFinalSemana(DateTime value) {
    _$dataFinalSemanaAtom.reportWrite(value, super.dataFinalSemana, () {
      super.dataFinalSemana = value;
    });
  }

  final _$itemsAtom = Atom(name: '_AgendamentoListagemControllerBase.items');

  @override
  ObservableList<AgendamentoListagemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<AgendamentoListagemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$initAsyncAction =
      AsyncAction('_AgendamentoListagemControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$filtroDataAsyncAction =
      AsyncAction('_AgendamentoListagemControllerBase.filtroData');

  @override
  Future filtroData(DateTime dataDiaSemana) {
    return _$filtroDataAsyncAction.run(() => super.filtroData(dataDiaSemana));
  }

  final _$cadastroAsyncAction =
      AsyncAction('_AgendamentoListagemControllerBase.cadastro');

  @override
  Future cadastro(AgendamentoListagemModel model) {
    return _$cadastroAsyncAction.run(() => super.cadastro(model));
  }

  final _$deletarAsyncAction =
      AsyncAction('_AgendamentoListagemControllerBase.deletar');

  @override
  Future deletar(int id) {
    return _$deletarAsyncAction.run(() => super.deletar(id));
  }

  @override
  String toString() {
    return '''
dataInicioSemana: ${dataInicioSemana},
dataFinalSemana: ${dataFinalSemana},
items: ${items}
    ''';
  }
}
