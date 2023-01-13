import 'package:equatable/equatable.dart';

class ProjectsModel extends Equatable {
  final String description;
  final String projectName;
  final String photo;
  const ProjectsModel({
    required this.description,
    required this.projectName,
    required this.photo,
  });

  @override
  List<Object?> get props => [description, photo, projectName];
}
