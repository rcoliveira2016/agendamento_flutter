import 'package:shared_preferences/shared_preferences.dart';

class TermoUsoRepository {
  final nameTermoUso = 'IndexStatusTermoUso';
  final nameDataAceitacaoTermoUso = 'DataAceitacaoTermoUso';
  final dataUltimaVersaoTermo = DateTime(2020, 7, 30, 15);
  StatusTermoUso _status;

  TermoUsoRepository(){
    var t = true;

  }

  Future<StatusTermoUso> obterStatus() async {
    if(_status!=null) return _status;

    var prefs = await SharedPreferences.getInstance();
    var indexStatus = prefs.getInt(nameTermoUso) ?? StatusTermoUso.naoRespondido.index;
    _status = StatusTermoUso.values[indexStatus];

    var dataAceitacaoTermoUso  = DateTime.fromMillisecondsSinceEpoch(prefs.getInt(nameDataAceitacaoTermoUso)??0);
    if(_status==StatusTermoUso.aceito &&  dataAceitacaoTermoUso.isBefore(dataUltimaVersaoTermo) ){
      _status = StatusTermoUso.novoTermo;
    }

    return _status;
  }

  Future setarTermoUso(bool aceitouTermoUso) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(nameTermoUso, (aceitouTermoUso?StatusTermoUso.aceito:StatusTermoUso.recusado).index);
    if(aceitouTermoUso){
      prefs.setInt(nameDataAceitacaoTermoUso, DateTime.now().millisecondsSinceEpoch);
      _status = StatusTermoUso.aceito;
    }
    else{
      prefs.remove(nameDataAceitacaoTermoUso);
      _status = StatusTermoUso.recusado;
    }
  }

  Future resetar() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(nameTermoUso);
    prefs.remove(nameDataAceitacaoTermoUso);
    _status = null;
  }

  List<String> obterTexto(){
    return <String>[
      "1 - Disponibiliza uma ferramenta para organizar datas de agendamento de serviços para clientes.",
      "2 - Não é coletado nenhuma informação pessoal do usuários.",
      "3 - Para acessar o aplicativo não é necessário cadastro.",
      "4 - O aplicativo funciona de forma totalmente offline.",
      "5 - Salvamos os dados no próprio celular do cliente, por isso está sujeito a perca dos dados caso mude de aparelho ou celular estrague.",
      "6 - Não nos responsabilizamos por qualquer perda de dados do aplicativo em questão.",
      "7 - É recomendado exportar os dados do aplicativo periodicamente, para existir um backup dos dados do aplicativo.",
      "8 - Melhoria e correções de  erros  estarão sujeitas análise do desenvolvedor do aplicativo.",
      "9 - Não garantimos suporte técnico ao aplicativo.",
      "10 - Contato por email: roramon7@gmail.com"
    ];
  }
  
}

enum StatusTermoUso{ aceito, recusado, novoTermo, naoRespondido} 