import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/get_eras_usecase.dart';

part 'get_eras_list_state.dart';

class GetErasListCubit extends Cubit<GetErasListState> {
  GetErasListCubit({required this.getErasUsecase}) : super(GetErasListInitial());

  final GetErasUsecase getErasUsecase;

  Future<void> getErasList() async {
    emit(GetErasListLoading());

    final erasResult = await getErasUsecase.call();

    erasResult.fold(
      (failure) => emit(GetErasListFailure(message: failure.message)),
      (eras) => emit(
        GetErasListSuccess(eras: eras),
      ),
    );
  }
}