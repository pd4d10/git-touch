import 'package:json_annotation/json_annotation.dart';

part 'gitlab.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabUser {
  int id;
  String username;
  String name;
  String avatarUrl;
  String bio;
  DateTime createdAt;
  int accessLevel;
  GitlabUser();
  factory GitlabUser.fromJson(Map<String, dynamic> json) =>
      _$GitlabUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabGroup {
  int id;
  String path;
  String name;
  String avatarUrl;
  String description;
  List<GitlabProject> projects;
  GitlabGroup();
  factory GitlabGroup.fromJson(Map<String, dynamic> json) =>
      _$GitlabGroupFromJson(json);
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
  GitlabTodoTarget target;
  GitlabTodo();
  factory GitlabTodo.fromJson(Map<String, dynamic> json) =>
      _$GitlabTodoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabTodoTarget {
  int iid;
  int projectId;
  String title;
  GitlabUser author;
  String description;
  DateTime createdAt;
  GitlabTodoTarget();
  factory GitlabTodoTarget.fromJson(Map<String, dynamic> json) =>
      _$GitlabTodoTargetFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabIssueNote {
  GitlabUser author;
  String body;
  bool system;
  DateTime createdAt;
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
  GitlabUser owner;
  bool issuesEnabled;
  int openIssuesCount;
  bool mergeRequestsEnabled;
  GitlabProjectStatistics statistics;
  DateTime lastActivityAt;
  DateTime createdAt;
  String defaultBranch;
  GitlabProject();
  factory GitlabProject.fromJson(Map<String, dynamic> json) =>
      _$GitlabProjectFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabProjectBadge {
  String renderedImageUrl;
  GitlabProjectBadge();
  factory GitlabProjectBadge.fromJson(Map<String, dynamic> json) =>
      _$GitlabProjectBadgeFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabProjectStatistics {
  int commitCount;
  int repositorySize;
  GitlabProjectStatistics();
  factory GitlabProjectStatistics.fromJson(Map<String, dynamic> json) =>
      _$GitlabProjectStatisticsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabProjectNamespace {
  int id;
  String name;
  String path;
  String kind;
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

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabCommit {
  String id;
  String shortId;
  String title;
  DateTime createdAt;
  String authorName;
  String message;
  GitlabCommit();
  factory GitlabCommit.fromJson(Map<String, dynamic> json) =>
      _$GitlabCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabDiff {
  String diff;
  String newPath;
  String oldPath;
  GitlabDiff();
  factory GitlabDiff.fromJson(Map<String, dynamic> json) =>
      _$GitlabDiffFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabIssue {
  String title;
  int iid;
  int projectId;
  GitlabUser author;
  int userNotesCount;
  DateTime updatedAt;
  List<String> labels;
  GitlabIssue();
  factory GitlabIssue.fromJson(Map<String, dynamic> json) =>
      _$GitlabIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabStarrer {
  DateTime starredSince;
  GitlabUser user;
  GitlabStarrer();
  factory GitlabStarrer.fromJson(Map<String, dynamic> json) =>
      _$GitlabStarrerFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GitlabBranch {
  String name;
  bool merged;
  GitlabBranch();
  factory GitlabBranch.fromJson(Map<String, dynamic> json) =>
      _$GitlabBranchFromJson(json);
}
