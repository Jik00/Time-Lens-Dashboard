part of 'get_eras_list_cubit.dart';

@immutable
sealed class GetErasListState extends Equatable {

  @override
  List<Object?> get props => [];
}

final class GetErasListInitial extends GetErasListState {}

final class GetErasListLoading extends GetErasListState {}

final class GetErasListSuccess extends GetErasListState {
  final List<EraEntity> eras;

  GetErasListSuccess({required this.eras});

  @override
  List<Object?> get props => [eras];
}

final class GetErasListFailure extends GetErasListState {
  final String message;
  GetErasListFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
