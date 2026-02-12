part of 'add_era_cubit.dart';

@immutable
sealed class EraCubitState {}

class EraCubitInitial extends EraCubitState {}

class EraCubitLoading extends EraCubitState {}

class EraCubitSuccess extends EraCubitState {}

class EraCubitFailure extends EraCubitState {
  final String message;

  EraCubitFailure({required this.message});
}
