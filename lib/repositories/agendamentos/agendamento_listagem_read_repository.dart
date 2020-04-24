import 'package:agendamentos/models/agendamentos/agendamento_listagem_model.dart';
import 'package:agendamentos/shared/constants/constants.dart';
import 'package:agendamentos/shared/infra/data/repository/repository_read_dase.dart';

class AgendamentoListagemReadRepository
    extends RepositoryReadBase<AgendamentoListagemModel> {
  @override
  AgendamentoListagemModel map(Map<String, dynamic> json) =>
      AgendamentoListagemModel.fromJson(json);

  Future<List<AgendamentoListagemModel>> buscarAgendamentoNaoAgendado(
      DateTime dataInicial, DateTime dataFinal) async {
    var filtro = [
      dataInicial.millisecondsSinceEpoch,
      dataFinal.millisecondsSinceEpoch,
      dataInicial.millisecondsSinceEpoch,
      dataFinal.millisecondsSinceEpoch
    ];

    return getAll('''
      Select 
        1 as marcado, 
        id, 
        idCliente, 
        dataNumero, 
        quantidade, 
        valor,
        (Select cliente.nome from cliente where cliente.id = idCliente LIMIT 1) as nomeCliente
      from agendamento
      where
        dataNumero BETWEEN ? and ?
      UNION
      Select
        0 as marcado,
        null as id,
        cliente.id as idCliente,
        (max(dataNumero)+(cliente.frequencia*24*60*60*1000)) as dataNumero,
        quantidadeCavalos as quantidade,
        quantidadeCavalos*${Constantes.valorCustoPadrao} as valor,
        cliente.nome as nomeCliente
      from 
        cliente, agendamento
      where 
        cliente.id = agendamento.idCliente
        and (dataNumero)+(cliente.frequencia*24*60*60*1000) BETWEEN ? and ?
      group by cliente.id, quantidadeCavalos, frequencia            
    ''', filtro);
  }
}
