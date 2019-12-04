import 'package:json_annotation/json_annotation.dart';

part 'gitlab.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabUser {
  int id;
  String username;
  String name;
  String avatarUrl;

  GitlabUser();

  factory GitlabUser.fromJson(Map<String, dynamic> json) =>
      _$GitlabUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabRepository {
  int id;
  GitlabUser owner;
  String name;
  String description;
  int starCount;
  int forksCount;

  GitlabRepository();

  factory GitlabRepository.fromJson(Map<String, dynamic> json) =>
      _$GitlabRepositoryFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabTodoProject {
  String pathWithNamespace;

  GitlabTodoProject();

  factory GitlabTodoProject.fromJson(Map<String, dynamic> json) =>
      _$GitlabTodoProjectFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabTodo {
  GitlabUser author;
  GitlabTodoProject project;
  String actionName;
  String targetType;
  GitlabIssue target;

  GitlabTodo();

  factory GitlabTodo.fromJson(Map<String, dynamic> json) =>
      _$GitlabTodoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabIssue {
  int iid;
  int projectId;
  String title;
  GitlabUser author;
  String description;
  String createdAt;

  GitlabIssue();

  factory GitlabIssue.fromJson(Map<String, dynamic> json) =>
      _$GitlabIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabIssueNote {
  GitlabUser author;
  String body;

  GitlabIssueNote();

  factory GitlabIssueNote.fromJson(Map<String, dynamic> json) =>
      _$GitlabIssueNoteFromJson(json);
}
