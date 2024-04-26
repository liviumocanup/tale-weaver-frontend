import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tale_weaver/constants.dart';

String? Function(String?) emailValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.email(),
  //TODO: make backend request to check if taken
]);

String? Function(String?) passwordValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.minLength(8),
  (value) {
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value ?? '')) {
      return noUppercasePasswordError;
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(value ?? '')) {
      return noNumberPasswordError;
    }
    return null;
  }
]);

String? Function(String?) repeatPasswordValidator(
    GlobalKey<FormBuilderState> formKey) {
  return FormBuilderValidators.compose([
    FormBuilderValidators.required(),
    (value) {
      if (value != formKey.currentState?.fields[passwordString]?.value) {
        return notMatchingPasswordError;
      }
      return null;
    }
  ]);
}

String? Function(String?) usernameValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  (value) {
    //TODO: make backend request to check if taken
    return null;
  }
]);
