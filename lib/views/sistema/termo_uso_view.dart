import 'package:agendamentos/repositories/aplicativo/termo_uso_repository.dart';
import 'package:agendamentos/shared/constants/name_routes.dart';
import 'package:agendamentos/shared/infra/Inject/Injection.dart';
import 'package:agendamentos/widgets/scaffold/app_bar_defalt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermoUsoView extends StatefulWidget {
  bool termoUsoNaoFoiAceito = false;

  TermoUsoView({this.termoUsoNaoFoiAceito});

  @override
  _TermoUsoViewState createState() => _TermoUsoViewState();
}

class _TermoUsoViewState extends State<TermoUsoView> {
  static TermoUsoRepository _termoUsoRepository = Injection.injector.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDefalt(title: "Termos de Uso"),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: widget.termoUsoNaoFoiAceito
                ? _obterNaoAceitoTermoUso()
                : _obterTermoUso(),
          ),
        ));
  }

  Widget _obterNaoAceitoTermoUso() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(child: Text("Você recuso o Termo de Uso")),
          RaisedButton(
            onPressed: () {
              setState(() {
                widget.termoUsoNaoFoiAceito = false;
              });
            },
            child: const Text('Click aqui para retornar o Termo de Uso'),
          )
        ],
      ),
    );
  }

  Widget _obterTermoUso() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _termoUsoRepository
                .obterTexto()
                .map((texto) => Column(
                      children: <Widget>[Text(texto), SizedBox(height: 5)],
                    ))
                .toList(),
          ),
          SizedBox(height: 20),
          Flexible(child: Text("Concorda com os termos do aplicativo?")),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _termoUsoRepository.setarTermoUso(true);
                    Get.offAllNamed(NamesRoutes.agendamento);
                  });
                },
                child: const Text('Sim, aceito'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _termoUsoRepository.setarTermoUso(false);
                    Get.offAllNamed(NamesRoutes.termoUso, arguments: true);
                  });
                },
                child: const Text('não aceito'),
              )
            ],
          )
        ],
      ),
    );
  }
}
