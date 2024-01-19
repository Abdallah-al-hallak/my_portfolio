import 'package:equatable/equatable.dart';

class ProjectsModel extends Equatable {
  final String description;
  final String projectName;
  final String photo1;
  final String photo2;
  final String photo3;
  final String googleLink;
  final String storeLink;
  const ProjectsModel({
    required this.description,
    required this.projectName,
    required this.photo1,
    required this.photo2,
    required this.photo3,
    required this.googleLink,
    required this.storeLink,
  });

  @override
  List<Object?> get props => [description, photo1, photo2, photo3, projectName];
}
