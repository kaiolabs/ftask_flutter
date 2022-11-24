import 'package:flutter/material.dart';

import '../../domain/services/i_form_validate_service.dart';

class FormsValidate implements IFormsValidateService {
  final _formValidate = GlobalKey<FormState>();

  @override
  GlobalKey<FormState> get form => _formValidate;

  @override
  bool validate() {
    return form.currentState?.validate() ?? false;
  }
}
