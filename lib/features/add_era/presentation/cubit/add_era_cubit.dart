import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/helper_functions/friendly_error_message.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/add_era/domain/usecases/add_era_usecase.dart';

part 'add_era_cubit_state.dart';

class AddEraCubit extends Cubit<AddEraCubitState> {
  AddEraCubit(this.addEraUsecase) : super(const AddEraCubitInitial());

  final AddEraUsecase addEraUsecase;

  Future<void> addEra(EraEntity eraEntity) async {
    emit(const AddEraCubitLoading());

    var eraResult = await addEraUsecase(eraEntity);
    eraResult.fold(
      (failure) {
        final errorMessage = getUserFriendlyError(failure);
        emit(AddEraCubitFailure(errorMessage));
      },
      (_) {
        emit(const AddEraCubitSuccess());
      },
    );
  }

  void resetForm() {
    emit(const AddEraCubitInitial());
  }
}
