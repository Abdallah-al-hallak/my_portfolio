import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/projects_model.dart';

part 'projects_data_event.dart';
part 'projects_data_state.dart';
part 'projects_data_bloc.freezed.dart';

class ProjectsDataBloc extends Bloc<ProjectsDataEvent, ProjectsDataState> {
  ProjectsDataBloc() : super(const ProjectsDataState()) {
    on<_Started>(_getData);
  }
  void _getData(_Started event, Emitter<ProjectsDataState> emit) {
    emit(state.copyWith(proojectsModel: event.proojectsModel));
  }
}
