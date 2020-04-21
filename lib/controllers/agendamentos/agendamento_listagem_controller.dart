import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';

class AgendamentoListagemController {
  final AgendamentoRepository _agendamentoRepository = Injection.injector.get();

  Future<List<Agendamento>> buscarTodos() {
    return _agendamentoRepository.buscarAgendamentoNaoAgendado();
  }
}