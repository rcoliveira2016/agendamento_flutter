import 'package:agendamentos/shared/Models/notificacao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetHelper {
  static GetHelper _get;
  factory GetHelper() {
    if (_get == null) _get = GetHelper._();
    return _get;
  }

  GetHelper._();

  static final _tituloSucesso = "Sucesso";
  static final _tituloErro = "Erro";
  static final _tituloAviso = "Aviso";

  static snackbarSucesso({NotificacaoModel resposta, mesagem})
  {
    assert(resposta!=null || mesagem!=null);

    Get.snackbar(_tituloSucesso, resposta?.mensagem??mesagem, backgroundColor: Colors.green,);
  }

  static snackbarErro({NotificacaoModel resposta, mesagem})
  {
    assert(resposta!=null || mesagem!=null);

    Get.snackbar(_tituloErro, resposta?.mensagem??mesagem, backgroundColor: Colors.red,);
  }

  static snackbarAlerta({NotificacaoModel resposta, mesagem})
  {
    assert(resposta!=null || mesagem!=null);

    Get.snackbar(_tituloAviso, resposta?.mensagem??mesagem, backgroundColor: Colors.yellowAccent,);
  }

  static snackbarRespostaAcao(NotificacaoModel resposta)
  {
    assert(resposta!=null);
    switch (resposta.status) {
      case StatusAcao.sucesso:
        snackbarSucesso(resposta: resposta);        
        break;
      case StatusAcao.erro:
      case StatusAcao.excecao:
        snackbarErro(resposta: resposta);
        break;
      case StatusAcao.alerta:
        snackbarAlerta(resposta: resposta);
        break;
    }
  }

  static excluirDialogo({
    String titulo,
    String mesagem,
    @required VoidCallback onConfirmacao,
    VoidCallback onCancelado,
  })
  {
    Get.defaultDialog(
      title: titulo??"Excluir",
      content: Container(
        child: Flexible(child: Text(mesagem??"Deseja excluir item")),
      ),
      cancel: FlatButton(
        child: Text("Não"),
        onPressed: onCancelado??() => Get.back(),
      ),
      confirm: FlatButton(
        child: Text("Sim"),
        onPressed: onConfirmacao,
      ),
    );
  }
  
  static dialogoPadrao({
    String titulo,
    @required String mesagem,
    @required VoidCallback onConfirmacao,
    VoidCallback onCancelado,
  })
  {
    Get.defaultDialog(
      title: titulo??"titulo",
      content: Container(
        child: Flexible(child: Text(mesagem)),
      ),
      cancel: FlatButton(
        child: Text("Não"),
        onPressed: onCancelado??() => Get.back(),
      ),
      confirm: FlatButton(
        child: Text("Sim"),
        onPressed: onConfirmacao,
      ),
    );
  }

}