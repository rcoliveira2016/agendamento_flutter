import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

abstract class BaseTextAgendamentoFormField extends StatelessWidget {
  
  String initialValue;
  String labelText;
  String hintText;
  FormFieldSetter<String> onSaved;
  FormFieldValidator<String> validator;
  Icon iconLabel;
  bool autofocus;
  TextInputType textInputType;
  List<TextInputFormatter> textInputFormatters;

  BaseTextAgendamentoFormField({
    this.initialValue,
    this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    this.iconLabel,
    this.autofocus,
    this.textInputType,
    this.textInputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            key: Key(Uuid().v1()),
            autofocus: autofocus??false,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              icon: iconLabel,
            ),
            initialValue: initialValue??"",
            validator: validator,
            onSaved: onSaved,
            inputFormatters: textInputFormatters==null || textInputFormatters.isEmpty ? null: textInputFormatters,
            keyboardType: textInputType,
          );
  }
}