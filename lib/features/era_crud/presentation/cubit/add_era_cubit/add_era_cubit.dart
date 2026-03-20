import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/helper_functions/friendly_error_message.dart';
import 'package:timelens_dashboard/features/era_crud/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/era_crud/domain/usecases/add_era_usecase.dart';

part 'add_era_state.dart';

class AddEraCubit extends Cubit<AddEraCubitState> {
  AddEraCubit({ required this.addEraUsecase}) : super(AddEraCubitInitial());

  final AddEraUsecase addEraUsecase;

  Future<void> addEra(
      {required EraEntity eraEntity, required File imgFile}) async {
    emit(AddEraCubitLoading());

    var eraResult = await addEraUsecase.call(eraEntity, imgFile);
    eraResult.fold(
      (failure) {
        final errorMessage = getUserFriendlyError(failure);
        emit(AddEraCubitFailure(message: errorMessage));
      },
      (_) {
        emit(EraCubitSuccess());
      },
    );
  }

  void resetForm() {
    emit(AddEraCubitInitial());
  }
}
