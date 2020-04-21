import 'package:agendamentos/models/agendamentos/agendamento_model.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_dase.dart';

class AgendamentoRepository extends RepositoryBase<Agendamento>{

  AgendamentoRepository():super(nameTable:"agendamento");
  
  Future<List<Agendamento>> buscarAgendamentoNaoAgendado() async {
    return getAll('''
      Select 0 as marcado, id, idCliente, dataNumero, quantidade, valor from agendamento
      UNION
      Select
      1 as marcado,
      cliente.id,
      cliente.id as idCliente,
      (max(dataNumero)+(cliente.frequencia*24*60*60*1000)) as dataNumero,
      quantidadeCavalos as quantidade,
      quantidadeCavalos*140 as valor
      from cliente, agendamento
      where cliente.id = agendamento.idCliente
      group by cliente.id, quantidadeCavalos, frequencia            
    ''');
  }

  @override
  Agendamento map(Map<String, dynamic> json) => Agendamento.fromJson(json);

}