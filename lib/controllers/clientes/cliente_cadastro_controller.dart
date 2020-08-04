import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_listagem_read_repository.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:mobx/mobx.dart';
part 'cliente_cadastro_controller.g.dart';

class ClienteCadastroController = _ClienteCadastroController with _$ClienteCadastroController;

abstract class _ClienteCadastroController with Store {
    final ClienteRepository _clienteRepository = Injection.injector.get();
    final AgendamentoListagemReadRepository _agendamentoListagemReadRepository = Injection.injector.get();
    final AgendamentoRepository _agendamentoRepository = Injection.injector.get();
    var _inicioPaginacaoAgendamentos = 0;
    var _limitePaginacaoAgendamentos = 5;
    
    @observable
    Cliente clienteAtual;
    @observable
    DateTime ultimoAgendamento;
    @observable
    DateTime proximoAgendamento;
    @observable
    ObservableList<Agendamento> itemsDeAgendamentos =
      <Agendamento>[].asObservable();

    @action
    buscarCliente(int id) async {
      clienteAtual = (id!=null && id > 0)?        
        await _clienteRepository.getId(id):
        Cliente();

        await buscarDatas();
    }

    @action
    mostarAgendamentos() async {
      itemsDeAgendamentos.clear();
      itemsDeAgendamentos.addAll(await _agendamentoRepository.buscarPorIdCliente(clienteAtual.id));
    }

    @action
    carregarProximosAgendamentos() async {
      await new Future.delayed(new Duration(milliseconds: 800));
      _inicioPaginacaoAgendamentos+=_limitePaginacaoAgendamentos;
      itemsDeAgendamentos.addAll(
        await _agendamentoRepository.buscarPorIdCliente(
          clienteAtual.id,
          contidade: _limitePaginacaoAgendamentos,
          inicio: _inicioPaginacaoAgendamentos
        )
      );
    }

    Future buscarDatas() async {
      if(clienteAtual.isNew) return;

      ultimoAgendamento = await _agendamentoListagemReadRepository.buscarUltimoAgendamento(clienteAtual.id);
      proximoAgendamento = await _agendamentoListagemReadRepository.buscarProximoAgendamento(clienteAtual.id);
    }


    String validarTexto(String texto){
      if (texto == null || texto.isEmpty)
        return "Informe o valor";
      else
        return null;
    }

    String validarNumero(int valor){
      if (valor == null || valor < 0)
        return "Informe uma valor";
      else
        return null;
    }

    Future salvar() async {
      if(clienteAtual.isNew)
        await _clienteRepository.add(clienteAtual);
      else
        await _clienteRepository.updade(clienteAtual.id, clienteAtual);
    }
    
}