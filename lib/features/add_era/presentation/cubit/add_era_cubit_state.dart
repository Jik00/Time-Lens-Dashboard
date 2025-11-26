part of 'add_era_cubit.dart';

@immutable
abstract class AddEraCubitState {
  final String? errorMessage;
  
  const AddEraCubitState({this.errorMessage});
}

class AddEraCubitInitial extends AddEraCubitState {
  const AddEraCubitInitial() : super(errorMessage: null);
}

class AddEraCubitLoading extends AddEraCubitState {
  const AddEraCubitLoading() : super(errorMessage: null);
}

class AddEraCubitSuccess extends AddEraCubitState {
  const AddEraCubitSuccess() : super(errorMessage: null);
}

class AddEraCubitFailure extends AddEraCubitState {
  final String message;
  
  const AddEraCubitFailure(this.message) : super(errorMessage: message);
}