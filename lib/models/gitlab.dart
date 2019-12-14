import 'package:json_annotation/json_annotation.dart';

part 'gitlab.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabUserProject {
  int id;
  GitlabUser owner;
  String name;
  String description;
  int starCount;
  int forksCount;
  String visibility;

  GitlabUserProject();

  factory GitlabUserProject.fromJson(Map<String, dynamic> json) =>
      _$GitlabUserProjectFromJson(json);
}

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

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabProject {
  int id;
  String name;
  String avatarUrl;
  String description;
  int starCount;
  int forksCount;
  String visibility;
  String readmeUrl;
  String webUrl;
  GitlabProjectNamespace namespace;
  bool issuesEnabled;
  int openIssuesCount;
  bool mergeRequestsEnabled;

  @JsonKey(ignore: true)
  String readme;

  @JsonKey(ignore: true)
  Map<String, double> languages;

  @JsonKey(ignore: true)
  String primaryLanguage;

  GitlabProject();

  factory GitlabProject.fromJson(Map<String, dynamic> json) =>
      _$GitlabProjectFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabProjectNamespace {
  int id;
  String name;
  GitlabProjectNamespace();

  factory GitlabProjectNamespace.fromJson(Map<String, dynamic> json) =>
      _$GitlabProjectNamespaceFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabTreeItem {
  String type;
  String path;
  String name;

  GitlabTreeItem();

  factory GitlabTreeItem.fromJson(Map<String, dynamic> json) =>
      _$GitlabTreeItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabBlob {
  String content;

  GitlabBlob();

  factory GitlabBlob.fromJson(Map<String, dynamic> json) =>
      _$GitlabBlobFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabEvent {
  GitlabUser author;
  String actionName;
  String targetType;
  GitlabEventNote note;

  GitlabEvent();

  factory GitlabEvent.fromJson(Map<String, dynamic> json) =>
      _$GitlabEventFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabEventNote {
  String body;
  String noteableType;
  int noteableIid;

  GitlabEventNote();

  factory GitlabEventNote.fromJson(Map<String, dynamic> json) =>
      _$GitlabEventNoteFromJson(json);
}
