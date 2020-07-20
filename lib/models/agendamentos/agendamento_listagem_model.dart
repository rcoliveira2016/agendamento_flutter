import 'package:agendamentos/shared/Models/entidade.dart';

class AgendamentoListagemModel {
  int id;
  DateTime data;
  int quantidade;
  double valor;
  int idCliente;
  String nomeCliente;
  bool marcado;

  AgendamentoListagemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['dataNumero']!=null)
      data = DateTime.fromMillisecondsSinceEpoch(json['dataNumero']);
    quantidade = json['quantidade'];
    valor = json['valor'];
    idCliente = json['idCliente'];
    nomeCliente = json['nomeCliente'];
    marcado = json['marcado']==1;
  }
 
}