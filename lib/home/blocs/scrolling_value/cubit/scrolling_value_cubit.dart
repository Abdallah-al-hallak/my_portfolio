import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scrolling_value_state.dart';
part 'scrolling_value_cubit.freezed.dart';

class ScrollingValueCubit extends Cubit<ScrollingValueState> {
  ScrollingValueCubit() : super(const ScrollingValueState());

  changeScrollingvalue(double value) {
    emit(ScrollingValueState(value: value));
  }
}
