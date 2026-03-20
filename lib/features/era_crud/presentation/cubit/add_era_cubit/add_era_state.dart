part of 'add_era_cubit.dart';

@immutable
sealed class AddEraCubitState {}

class AddEraCubitInitial extends AddEraCubitState {}

class AddEraCubitLoading extends AddEraCubitState {}

class EraCubitSuccess extends AddEraCubitState {}

class AddEraCubitFailure extends AddEraCubitState {
  final String message;

  AddEraCubitFailure({required this.message});
}
