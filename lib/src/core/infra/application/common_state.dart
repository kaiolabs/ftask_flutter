abstract class CommonState {}

class IdleState extends CommonState {}

class LoadingState extends CommonState {}

class SuccessState<T> extends CommonState {
  final List<T>? listResponse;
  final T? response;

  SuccessState({this.listResponse, this.response});
}

class ErrorState extends CommonState {
  final String message;

  ErrorState(this.message);
}
