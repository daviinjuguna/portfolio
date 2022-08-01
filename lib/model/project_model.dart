class ProjectModel {
  final String title, description, url;

  ProjectModel({
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectModel && other.description == description;
  }

  @override
  int get hashCode => description.hashCode;
}
