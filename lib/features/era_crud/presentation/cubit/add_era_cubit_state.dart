part of 'add_era_cubit.dart';

@immutable
abstract class EraCubitState {
  final String? errorMessage;

  const EraCubitState({this.errorMessage});
}

class EraCubitInitial extends EraCubitState {
  const EraCubitInitial() : super(errorMessage: null);
}

class EraCubitLoading extends EraCubitState {
  const EraCubitLoading() : super(errorMessage: null);
}

class EraCubitSuccess extends EraCubitState {
  const EraCubitSuccess() : super(errorMessage: null);
}

class EraCubitFailure extends EraCubitState {
  final String message;

  const EraCubitFailure(this.message) : super(errorMessage: message);
}