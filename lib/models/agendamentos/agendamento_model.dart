import 'package:agendamentos/models/clientes/cliente_model.dart';
import 'package:agendamentos/shared/Models/entidade.dart';

class Agendamento extends Entidade {
  DateTime data;
  int quantidade;
  double valor;
  int idCliente;
  String observacao;

  int dataNumero;
  Cliente cliente;

  Agendamento({
    int id,
    this.data, 
    this.quantidade, 
    this.valor, 
    this.idCliente,
    this.observacao 
  }):super(id:id);

  adicionarCliente(Cliente cliente){
    this.cliente = cliente;
  }

  Agendamento.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    data = DateTime.fromMillisecondsSinceEpoch(json['dataNumero']);
    quantidade = json['quantidade'];
    valor = json['valor'];
    idCliente = json['idCliente'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataNumero'] = this.data.millisecondsSinceEpoch;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    data['idCliente'] = this.idCliente;
    data['observacao'] = this.observacao;
    print(this);
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    var data = toJson();
    data.remove('id');
    return data;
  }
}
