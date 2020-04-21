import 'package:agendamentos/shared/Models/entidade.dart';

class Agendamento extends Entidade {
  DateTime data;
  int quantidade;
  double valor;
  int idCliente;
  bool marcado;

  int dataNumero;


  Agendamento({
    int id,
    this.data, 
    this.quantidade, 
    this.valor, 
    this.idCliente, 
    this.marcado,
  }):super(id:id);

  Agendamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = DateTime.fromMillisecondsSinceEpoch(json['dataNumero']);
    quantidade = json['quantidade'];
    valor = json['valor'];
    idCliente = json['idCliente'];
    marcado = json['marcado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataNumero'] = this.data.millisecondsSinceEpoch;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    data['idCliente'] = this.idCliente;
    data['marcado'] = this.marcado;
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    var data = toJson();
    data.remove('id');
    return data;
  }
}
