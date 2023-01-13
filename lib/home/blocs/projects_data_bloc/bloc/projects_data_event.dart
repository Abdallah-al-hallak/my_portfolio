part of 'projects_data_bloc.dart';

@freezed
class ProjectsDataEvent with _$ProjectsDataEvent {
  const factory ProjectsDataEvent.started({
    ProjectsModel? proojectsModel,
  }) = _Started;
}
