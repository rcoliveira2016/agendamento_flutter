class NotificacaoModel {
  String mensagem;
  StatusAcao status;

  NotificacaoModel({
    this.mensagem,
    this.status
  });

  NotificacaoModel.ocorreuExecao(String mensagem){
    this.mensagem = mensagem;
    this.status = StatusAcao.excecao;
  }

  NotificacaoModel.sucesso(String mensagem){
    this.mensagem = mensagem;
    this.status = StatusAcao.sucesso;
  }

  NotificacaoModel.erro(String mensagem){
    this.mensagem = mensagem;
    this.status = StatusAcao.erro;
  }

  NotificacaoModel.alerta(String mensagem){
    this.mensagem = mensagem;
    this.status = StatusAcao.alerta;
  }
  
}
enum StatusAcao{erro,alerta,sucesso,excecao}