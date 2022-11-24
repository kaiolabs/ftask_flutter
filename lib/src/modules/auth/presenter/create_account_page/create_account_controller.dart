import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/repositories/i_repository_factory.dart';
import '../../../../core/domain/services/i_form_validate_service.dart';
import '../../../../core/domain/services/i_http_service.dart';
import '../../../../core/domain/usecases/i_create_account_usecase.dart';
import '../../../../core/infra/application/common_state.dart';
import '../../../../core/infra/application/create_account_request.dart';
import '../../../../core/presenter/theme/lexicon.dart';

class CreateAccountController extends ValueNotifier<CommonState> {
  final IHttpService httpService;
  final IRepositoryFactory repositoryFactory;
  final IFormsValidateService formsValidate;
  final ICreateAccountUsecase createAccountUseCase;
  FocusNode loginFocus = FocusNode();
  FocusNode secretFocus = FocusNode();
  FocusNode secretConfirmFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController secretController = TextEditingController();
  TextEditingController secretConfirmController = TextEditingController();

  CreateAccountController({
    required this.httpService,
    required this.repositoryFactory,
    required this.formsValidate,
    required this.createAccountUseCase,
  }) : super(IdleState());

  GlobalKey<FormState> get form => formsValidate.form;

  void setLoginFocus(value) => loginFocus.requestFocus();

  void setSecretFocus(value) => secretFocus.requestFocus();

  void setSecretConfirmFocus(value) => secretConfirmFocus.requestFocus();

  Future createNewAccountExecute(CreateAccountRequest newAccount) async {
    value = LoadingState();
    createAccountUseCase.call(newAccount).then((v) {
      if (v is Exception || v == false) {
        value = ErrorState(v.toString());
      } else {
        value = SuccessState<String>(response: Lexicon.accountCreated);
        Modular.to.pop();
      }
    }).catchError((e) {
      value = ErrorState(e);
    });
  }

  void executeSubmitCreateAccount(value) {
    if (formsValidate.validate()) {
      CreateAccountRequest newAccount = CreateAccountRequest(
        name: nameController.text,
        login: loginController.text,
        secret: secretController.text,
      );
      createNewAccountExecute(newAccount);
    } else {
      value = ErrorState(Lexicon.invalidFields);
    }
  }
}
