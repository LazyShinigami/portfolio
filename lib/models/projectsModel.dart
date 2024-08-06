class ProjectModel {
  ProjectModel(
      {required this.name,
      required this.desc,
      required this.githubLink,
      required this.projectIconURL,
      required this.toolsUsed,
      required this.availablePlatforms,
      required this.tags,
      required this.features});
  String name, desc, githubLink, projectIconURL;
  List tags, toolsUsed, availablePlatforms, features;
}
