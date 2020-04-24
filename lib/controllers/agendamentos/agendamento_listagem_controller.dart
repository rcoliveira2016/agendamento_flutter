import 'package:agendamentos/models/agendamentos/agendamento_listagem_model.dart';
import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_listagem_read_repository.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:mobx/mobx.dart';
part 'agendamento_listagem_controller.g.dart';

class AgendamentoListagemController = _AgendamentoListagemControllerBase
    with _$AgendamentoListagemController;

abstract class _AgendamentoListagemControllerBase with Store {
  final AgendamentoListagemReadRepository _agendamentoListagemReadRepository =
      Injection.injector.get();
  final AgendamentoRepository _agendamentoRepository = Injection.injector.get();

  @observable
  DateTime dataInicioSemana;

  @observable
  DateTime dataFinalSemana;

  @observable
  ObservableList<AgendamentoListagemModel> items =
      <AgendamentoListagemModel>[].asObservable();

  @action
  init() async {
    setarDataSemana(DateTime.now());
    buscarDados();
  }

  @action
  filtroData(DateTime dataDiaSemana) async {
    setarDataSemana(dataDiaSemana);
    buscarDados();
  }

  @action
  cadastro(AgendamentoListagemModel model) async {
    await _agendamentoRepository.add(Agendamento(
      data: model.data,
      idCliente: model.idCliente,
      quantidade: model.quantidade,
      valor: model.valor
    ));

    buscarDados();
  }

  @action
  deletar(int id) async{
    await _agendamentoRepository.delete(id);
    buscarDados();
  }

  buscarDados() async {
    items.clear();
    items.addAll(await _agendamentoListagemReadRepository
        .buscarAgendamentoNaoAgendado(dataInicioSemana, dataFinalSemana));
  }

  void setarDataSemana(DateTime dataDiaSemana) {
    var diaSemanaAtual = dataDiaSemana.weekday;
    
    dataInicioSemana = dataDiaSemana.add(Duration(days:DateTime.monday-diaSemanaAtual));
    dataFinalSemana = dataDiaSemana.add(Duration(days:DateTime.sunday-diaSemanaAtual));
  }
}
