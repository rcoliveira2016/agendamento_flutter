import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:mobx/mobx.dart';
part 'agendamento_cadastro_controller.g.dart';

class AgendamentoCadastroController = _AgendamentoCadastroController with _$AgendamentoCadastroController;

abstract class _AgendamentoCadastroController with Store {
    final AgendamentoRepository _agendamentoRepository = Injection.injector.get();
    @observable
    Agendamento agendamentoAtual;

    @action
    buscarAgendamento(int id) async {
      agendamentoAtual = (id!=null && id > 0)?        
        await _agendamentoRepository.getId(id):
        Agendamento();
    }



    Future salvar() async {
      if(agendamentoAtual.isNew)
        await _agendamentoRepository.add(agendamentoAtual);
      else
        await _agendamentoRepository.updade(agendamentoAtual.id, agendamentoAtual);
    }
}