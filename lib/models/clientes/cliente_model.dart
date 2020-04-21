import 'package:agendamentos/shared/Models/entidade.dart';

class Cliente extends Entidade {
  String nome;
  int quantidadeCavalos;
  int frequencia;
  String localPadrao;
  double valorDivida;

  bool get devendo => valorDivida!=null && valorDivida > 0;

  Cliente({    
      int id,
      this.nome,
      this.quantidadeCavalos,
      this.frequencia,
      this.localPadrao,
      this.valorDivida,
    }):super(id:id);

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    quantidadeCavalos = json['quantidadeCavalos'];
    frequencia = json['frequencia'];
    localPadrao = json['localPadrao'];
    valorDivida = json['valorDivida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['quantidadeCavalos'] = this.quantidadeCavalos;
    data['frequencia'] = this.frequencia;
    data['localPadrao'] = this.localPadrao;
    data['valorDivida'] = this.valorDivida;
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    var data = toJson();
    data.remove('id');
    return data;
  }
}