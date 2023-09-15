import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/constants.dart';

String? Function(String?) emailValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.email(errorText: "Email is not valid."),
]);

String? Function(String?) passwordValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.minLength(8, errorText: "Password should be at least 8 characters."),
  (value) {
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value ?? '')) {
      return "Must have at least one uppercase letter.";
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(value ?? '')) {
      return "Should contain at least one number.";
    }
    return null;
  }
]);

String? Function(String?) repeatPasswordValidator(GlobalKey<FormBuilderState> formKey) {
  
  return FormBuilderValidators.compose([
    FormBuilderValidators.required(),
    (value) {
      if (value != formKey.currentState?.fields[passwordString]?.value) {
        return "Passwords do not match.";
      }
      return null;
    }
  ]);
}

String? Function(String?) usernameValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  (value) {
    // make backend request to check if taken
    return null;
  }
]);