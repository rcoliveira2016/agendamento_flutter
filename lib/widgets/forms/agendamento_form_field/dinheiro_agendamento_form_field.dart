import 'package:agendamentos/widgets/forms/agendamento_form_field/base_text_agendamento_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DinheiroAgendamentoFormField extends BaseTextAgendamentoFormField {

  DinheiroAgendamentoFormField({
    double initialValue,
    String labelText,
    String hintText,
    FormFieldSetter<double> onSaved,
    FormFieldValidator<double> validator = null,
    bool autofocus
  }):super(
    initialValue:initialValue?.toString(),
    labelText:labelText,
    hintText:hintText,
    onSaved:(text){
      onSaved(double.tryParse(text));
    },
    validator:validator==null?null:(text){
      return validator(double.tryParse(text));
    },
    iconLabel:Icon(Icons.attach_money, size: 35,),
    autofocus:autofocus,
    textInputType: TextInputType.number,
    textInputFormatters: [WhitelistingTextInputFormatter.digitsOnly]
  );
  
}