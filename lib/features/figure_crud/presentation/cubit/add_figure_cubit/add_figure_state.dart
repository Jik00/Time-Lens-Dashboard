part of 'add_figure_cubit.dart';

@immutable
sealed class AddFigureState {}

final class AddFigureInitial extends AddFigureState {}

final class AddFigureLoading extends AddFigureState {}

final class AddFigureSuccess extends AddFigureState {}

final class AddFigureFailure extends AddFigureState {
  final String message;
  AddFigureFailure({required this.message});
}
