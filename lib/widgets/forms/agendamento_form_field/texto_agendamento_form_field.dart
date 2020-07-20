import 'package:agendamentos/widgets/forms/agendamento_form_field/base_text_agendamento_form_field.dart';
import 'package:flutter/cupertino.dart';

class TextoAgendamentoFormField extends BaseTextAgendamentoFormField {

  TextoAgendamentoFormField({
    String initialValue,
    String labelText,
    String hintText,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    Icon iconLabel,
    bool autofocus,  
    int maxLines,
    int minLines
  }):super(
    initialValue:initialValue,
    labelText:labelText,
    hintText:hintText,
    onSaved:onSaved,
    validator:validator,
    iconLabel:iconLabel,
    autofocus:autofocus,
    minLines: minLines,
    maxLines:maxLines
  );

}