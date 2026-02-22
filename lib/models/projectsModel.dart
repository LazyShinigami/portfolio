class ProjectModel {
  ProjectModel({
    required this.name,
    required this.desc,
    required this.githubLink,
    required this.projectIconURL,
    required this.toolsUsed,
    required this.tags,
    required this.features,
    required this.projectIlltURL,
    this.rotateIcon = false,
    this.availablePlatforms = const [],
    this.evaluation = const [],
  });
  String name, desc, githubLink, projectIconURL, projectIlltURL;
  List tags, toolsUsed, features;
  List? availablePlatforms, evaluation;

  bool? rotateIcon;
}
