import 'package:agendamentos/shared/Models/entidade.dart';

class Agendamento extends Entidade {
  DateTime data;
  int quantidade;
  double valor;
  int idCliente;

  int dataNumero;


  Agendamento({
    int id,
    this.data, 
    this.quantidade, 
    this.valor, 
    this.idCliente, 
  }):super(id:id);

  Agendamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = DateTime.fromMillisecondsSinceEpoch(json['dataNumero']*1000);
    quantidade = json['quantidade'];
    valor = json['valor'];
    idCliente = json['idCliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataNumero'] = this.data.second;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    data['idCliente'] = this.idCliente;
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    var data = toJson();
    data.remove('id');
    return data;
  }
}
