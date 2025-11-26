import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/helper_functions/friendly_error_message.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';

part 'add_era_cubit_state.dart';

class AddEraCubit extends Cubit<AddEraCubitState> {
  AddEraCubit(this.eraRepo) : super(const AddEraCubitInitial());

  final EraRepo eraRepo;

  Future<void> addEra(EraEntity eraEntity) async {
    emit(const AddEraCubitLoading());

    var eraResult = await eraRepo.addEra(eraEntity);
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
}
