import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:mobx/mobx.dart';
part 'agendamento_store.g.dart';

class AgendamentoStore = _AgendamentoStoreBase with _$AgendamentoStore;

abstract class _AgendamentoStoreBase with Store {

  _AgendamentoStoreBase({Agendamento agendamento}){
    if(agendamento==null)return;

    id = agendamento.id;
    setData(agendamento.data);
    setQuantidade(agendamento.quantidade);
    setValor(agendamento.valor);
    setIdCliente(agendamento.idCliente);
    setObservacao(agendamento.observacao);
    setFerramentaNova(agendamento.ferramentaNova);
  }

  _AgendamentoStoreBase.criarNovo(){
    data = DateTime.now();
  }


  int id;

  @observable
  DateTime data;
  @action
  void setData(DateTime value) => data = value;

  @observable
  int quantidade;
  @action
  void setQuantidade(int value) => quantidade = value;
  
  @observable
  double valor;
  @action
  void setValor(double value) => valor = value;

  @observable
  int idCliente;
  @action
  void setIdCliente(int value) => idCliente = value;  

  @observable
  Cliente cliente;
  @action
  void setCliente(Cliente value) => cliente = value; 

  @observable
  String observacao;
  @action
  void setObservacao(String value) => observacao = value;  
  
  @observable
  bool ferramentaNova;
  @action
  void setFerramentaNova(bool value) => ferramentaNova = value;
}