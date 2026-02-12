import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/helper_functions/friendly_error_message.dart';
import 'package:timelens_dashboard/features/figure_crud/domain/usecases/add_figure_usecase.dart';

import '../../../domain/entities/figure_entity.dart';

part 'add_figure_state.dart';

class AddFigureCubit extends Cubit<AddFigureState> {
  AddFigureCubit(this.addFigureUsecase) : super(AddFigureInitial());

  final AddFigureUsecase addFigureUsecase;

  Future<void> addFigure(FigureEntity figureEntity) async {
    emit(AddFigureLoading());

    var figureResult = await addFigureUsecase(figureEntity);
    figureResult.fold(
      (failure) {
        final errorMessage = getUserFriendlyError(failure);

        emit(AddFigureFailure(message: errorMessage));
      },
      (_) {
        emit(AddFigureSuccess());
      },
    );
  }

  void resetForm() {
    emit(AddFigureInitial());
  }
}