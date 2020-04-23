import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

abstract class BaseTextAgendamentoFormField extends StatefulWidget {
  
  String initialValue;
  String labelText;
  String hintText;
  FormFieldSetter<String> onSaved;
  ValueChanged<String> onChanged;
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
    this.onChanged,
    this.validator,
    this.iconLabel,
    this.autofocus,
    this.textInputType,
    this.textInputFormatters,
  });

  @override
  _BaseTextAgendamentoFormFieldState createState() => _BaseTextAgendamentoFormFieldState();
}

class _BaseTextAgendamentoFormFieldState extends State<BaseTextAgendamentoFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            key: Key(Uuid().v1()),
            autofocus: widget.autofocus??false,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              icon: widget.iconLabel,
            ),
            initialValue: widget.initialValue??"",
            validator: widget.validator,
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            inputFormatters: widget.textInputFormatters==null || widget.textInputFormatters.isEmpty ? null: widget.textInputFormatters,
            keyboardType: widget.textInputType,
          );
  }
}