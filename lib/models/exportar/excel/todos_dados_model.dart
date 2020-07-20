import 'package:agendamentos/shared/Models/entidade.dart';

class TodosDadosModel extends Entidade {
  String nome;
  int quantidadeCavalos;
  int frequencia;
  String localPadrao;
  double valorDivida;
  DateTime data;
  int quantidade;
  double valor;
  int idCliente;
  String observacao;

  int dataNumero;

  TodosDadosModel({    
      int id,
      this.nome,
      this.quantidadeCavalos,
      this.frequencia,
      this.localPadrao,
      this.valorDivida,
      this.data, 
      this.quantidade, 
      this.valor, 
      this.idCliente,
      this.observacao 
    }):super(id:id);

  TodosDadosModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    quantidadeCavalos = json['quantidadeCavalos'];
    frequencia = json['frequencia'];
    localPadrao = json['localPadrao'];
    valorDivida = json['valorDivida'];

    data = DateTime.fromMillisecondsSinceEpoch(json['dataNumero']);
    quantidade = json['quantidade'];
    valor = json['valor'];
    idCliente = json['idCliente'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['quantidadeCavalos'] = this.quantidadeCavalos;
    data['frequencia'] = this.frequencia;
    data['localPadrao'] = this.localPadrao;
    data['valorDivida'] = this.valorDivida;

    data['dataNumero'] = this.data.millisecondsSinceEpoch;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    data['idCliente'] = this.idCliente;
    data['observacao'] = this.observacao;
    
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    var data = toJson();
    data.remove('id');
    return data;
  }

}