part of 'add_era_cubit.dart';

@immutable
sealed class AddEraCubitState {}

final class AddEraCubitInitial extends AddEraCubitState {}

final class AddEraCubitLoading extends AddEraCubitState {}

final class AddEraCubitSuccess extends AddEraCubitState {}

final class AddEraCubitFailure extends AddEraCubitState {
  final String errorMessage;

  AddEraCubitFailure(this.errorMessage);
}
