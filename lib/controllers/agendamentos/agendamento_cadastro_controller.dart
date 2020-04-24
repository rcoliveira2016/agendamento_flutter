import 'package:agendamentos/Stores/agendamentos/cadastro/agendamento_store.dart';
import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/repositories/agendamentos/agendamento_repository.dart';
import 'package:agendamentos/repositories/clientes/cliente_repository.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:mobx/mobx.dart';
part 'agendamento_cadastro_controller.g.dart';

class AgendamentoCadastroController = _AgendamentoCadastroController with _$AgendamentoCadastroController;

abstract class _AgendamentoCadastroController with Store {
    final AgendamentoRepository _agendamentoRepository = Injection.injector.get();
    final ClienteRepository _clienteRepository = Injection.injector.get();
    
    @observable
    AgendamentoStore agendamentoAtual;

    @observable
    ObservableList<Cliente> itemsClientes = <Cliente>[].asObservable();

    @computed
    double get valorCalculado {
      if(agendamentoAtual.id != null)
        return agendamentoAtual.valor;

      var value = agendamentoAtual.cliente == null?
        agendamentoAtual?.quantidade??0:
        agendamentoAtual?.cliente?.quantidadeCavalos??0;

      return value*Constantes.valorCustoPadrao;
    }

    @computed
    int get quantidadeCavalos {
      return agendamentoAtual.cliente == null?
        agendamentoAtual.quantidade??0:
        agendamentoAtual.cliente.quantidadeCavalos??0;
    }

    @computed
    String get localPadrao {
      return agendamentoAtual.cliente==null?"":agendamentoAtual.cliente.localPadrao;
    }

    @action
    setarCliente(int id) async {
      var cliente = itemsClientes.firstWhere((x)=> x.id == id);
      agendamentoAtual.setCliente(cliente);
      agendamentoAtual.setIdCliente(id);
    }  

    @action
    Future<void> init(int id) async {
      itemsClientes.addAll(await _clienteRepository.all());
      if(id != null){
        agendamentoAtual = AgendamentoStore(agendamento: await _agendamentoRepository.getId(id));
        setarCliente(agendamentoAtual.idCliente);
      }
      else
        agendamentoAtual = AgendamentoStore.criarNovo();
    }

    deletar(int id) async{
      await _agendamentoRepository.delete(id);
    }

    Future salvar() async {
      var salvaModelo = Agendamento(
        data: agendamentoAtual.data,
        id: agendamentoAtual.id,
        idCliente: agendamentoAtual.idCliente,
        quantidade: agendamentoAtual.quantidade,
        valor: agendamentoAtual.valor
      );
      if(salvaModelo.isNew)
        await _agendamentoRepository.add(salvaModelo);
      else
        await _agendamentoRepository.updade(salvaModelo.id, salvaModelo);
    }
}