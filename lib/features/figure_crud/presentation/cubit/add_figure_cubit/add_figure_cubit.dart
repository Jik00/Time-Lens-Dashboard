import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_figure_state.dart';

class AddFigureCubit extends Cubit<AddFigureState> {
  AddFigureCubit() : super(AddFigureInitial());
}
