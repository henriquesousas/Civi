import 'package:deehelp/old_features/incident/presentation/update/incident_field.dart';
import 'package:flutter/material.dart';

class UpdateIncidentArgs {
  final String toolbarTitle;
  final String description;
  final String hint;
  final String value;
  final TextInputType textInputType;
  final IncidentField field;
  final int maxLine;
  final int? maxLength;
  final bool showMyLocationButton;
  UpdateIncidentArgs({
    required this.toolbarTitle,
    required this.description,
    required this.hint,
    required this.value,
    required this.textInputType,
    required this.field,
    this.maxLine = 1,
    this.maxLength,
    this.showMyLocationButton = false,
  });

  factory UpdateIncidentArgs.from(Map<String, dynamic> args) {
    return UpdateIncidentArgs(
      toolbarTitle: args['toolbarTitle'],
      description: args['description'],
      hint: args['hint'],
      value: args['value'],
      textInputType: args['textInputType'],
      field: args['field'],
      maxLength: args['maxLength'],
      maxLine: args['maxLine'],
      showMyLocationButton: args['showMyLocationButton'],
    );
  }

  static Map<String, dynamic> toMap({
    required String toolbarTitle,
    required String description,
    required String hint,
    required String value,
    required IncidentField field,
    TextInputType textInput = TextInputType.text,
    int? maxLength,
    int maxLine = 1,
    bool showMyLocationButton = false,
  }) {
    return {
      'toolbarTitle': toolbarTitle,
      'description': description,
      'hint': hint,
      'value': value,
      'textInputType': textInput,
      'field': field,
      'maxLine': maxLine,
      'maxLength': maxLength,
      'showMyLocationButton': showMyLocationButton
    };
  }
}
