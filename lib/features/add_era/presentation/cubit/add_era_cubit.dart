import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/repos/era_repo/era_repo.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';

part 'add_era_cubit_state.dart';

class AddEraCubit extends Cubit<AddEraCubitState> {
  AddEraCubit(this.eraRepo) : super(AddEraCubitInitial());

  final EraRepo eraRepo;

  Future<void> addEra(EraEntity eraEntity) async {
    emit(AddEraCubitLoading());

    var eraResult = await eraRepo.addEra(eraEntity);
    eraResult.fold((failure) {
      emit(AddEraCubitFailure("Adding era failed ${failure.message}"));
    }, (_) {
      emit(AddEraCubitSuccess());
    });
  }
}
