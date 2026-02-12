import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/helper_functions/friendly_error_message.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/add_era_usecase.dart';

part 'add_era_state.dart';

class EraCubit extends Cubit<EraCubitState> {
  EraCubit(this.addEraUsecase) : super(EraCubitInitial());

  final AddEraUsecase addEraUsecase;

  Future<void> addEra(EraEntity eraEntity) async {
    emit(EraCubitLoading());

    var eraResult = await addEraUsecase(eraEntity);
    eraResult.fold(
      (failure) {
        final errorMessage = getUserFriendlyError(failure);
        emit(EraCubitFailure(message: errorMessage));
      },
      (_) {
        emit(EraCubitSuccess());
      },
    );
  }

  void resetForm() {
    emit(EraCubitInitial());
  }
}
