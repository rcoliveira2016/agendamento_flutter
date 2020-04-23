import 'package:agendamentos/widgets/forms/agendamento_form_field/base_text_agendamento_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class NumeroAgendamentoFormField extends BaseTextAgendamentoFormField {

  NumeroAgendamentoFormField({
    int initialValue,
    String labelText,
    String hintText,
    FormFieldSetter<int> onSaved,
    FormFieldValidator<int> validator= null,
    ValueChanged<int> onChanged = null,
    Icon iconLabel,
    bool autofocus,
  }):super(
    initialValue:initialValue?.toString(),
    labelText:labelText,
    hintText:hintText,
    onSaved:(text){
      onSaved(int.tryParse(text));
    },
    validator:validator==null?null:(text){
      return validator(int.tryParse(text));
    },
    onChanged:onChanged==null?null:(text){
      onChanged(int.tryParse(text));
    },
    iconLabel:iconLabel,
    autofocus:autofocus,
    textInputType: TextInputType.number,
    textInputFormatters: [WhitelistingTextInputFormatter.digitsOnly]
  );
  
}