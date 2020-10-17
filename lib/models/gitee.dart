import 'package:json_annotation/json_annotation.dart';

part 'gitee.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeUser {
  String login;
  String avatarUrl;
  String name;
  String htmlUrl;
  String bio;
  String blog;
  int publicRepos;
  int followers;
  int following;
  int stared;
  int watched;
  DateTime createdAt;
  GiteeUser();
  factory GiteeUser.fromJson(Map<String, dynamic> json) =>
      _$GiteeUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeListUser {
  String login;
  String avatarUrl;
  String name;
  String htmlUrl;
  GiteeListUser();
  factory GiteeListUser.fromJson(Map<String, dynamic> json) =>
      _$GiteeListUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeRepo {
  GiteeRepoNamespace namespace;
  GiteeRepoOwner owner;
  String path;
  String description;
  bool private;
  bool public;
  bool internal;
  bool fork;
  int forksCount;
  int stargazersCount;
  int watchersCount;
  DateTime updatedAt;
  String license;
  String homepage;
  int openIssuesCount;
  bool pullRequestsEnabled;
  GiteeRepo();
  factory GiteeRepo.fromJson(Map<String, dynamic> json) =>
      _$GiteeRepoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeRepoOwner {
  String login;
  String avatarUrl;
  GiteeRepoOwner();
  factory GiteeRepoOwner.fromJson(Map<String, dynamic> json) =>
      _$GiteeRepoOwnerFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeRepoNamespace {
  String path;
  GiteeRepoNamespace();
  factory GiteeRepoNamespace.fromJson(Map<String, dynamic> json) =>
      _$GiteeRepoNamespaceFromJson(json);
}
