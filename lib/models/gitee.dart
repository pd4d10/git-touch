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
  String defaultBranch;
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

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeCommit {
  GiteeUser author;
  GiteeCommitDetail commit;
  String sha;
  String htmlUrl;
  List<GiteeCommitFile> files;
  GiteeCommit();
  factory GiteeCommit.fromJson(Map<String, dynamic> json) =>
      _$GiteeCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeCommitDetail {
  String message;
  GiteeCommitAuthor author;
  GiteeCommitAuthor committer;
  GiteeCommitDetail();
  factory GiteeCommitDetail.fromJson(Map<String, dynamic> json) =>
      _$GiteeCommitDetailFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeCommitAuthor {
  String name;
  String email;
  DateTime date;
  GiteeCommitAuthor();
  factory GiteeCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$GiteeCommitAuthorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeTreeItem {
  String path;
  String type;
  String sha;
  int size;
  GiteeTreeItem();
  factory GiteeTreeItem.fromJson(Map<String, dynamic> json) =>
      _$GiteeTreeItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeBlob {
  String content;
  GiteeBlob();
  factory GiteeBlob.fromJson(Map<String, dynamic> json) =>
      _$GiteeBlobFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeLabel {
  String color;
  String name;
  GiteeLabel();
  factory GiteeLabel.fromJson(Map<String, dynamic> json) =>
      _$GiteeLabelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeIssue {
  int comments;
  String commentsUrl;
  String createdAt;
  String htmlUrl;
  String updatedAt;
  String body;
  String bodyHtml;
  String title;
  String state;
  GiteeRepo repository;
  GiteeRepoOwner user;
  String number;
  List<GiteeLabel> labels;
  int id;
  GiteeIssue();
  factory GiteeIssue.fromJson(Map<String, dynamic> json) =>
      _$GiteeIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteePull {
  String commentsUrl;
  String createdAt;
  String htmlUrl;
  String updatedAt;
  String body;
  String bodyHtml;
  String title;
  String state;
  GiteeRepoOwner user;
  List<GiteeLabel> labels;
  int number;
  int id;
  GiteePull();
  factory GiteePull.fromJson(Map<String, dynamic> json) =>
      _$GiteePullFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeComment {
  int id;
  String body;
  String createdAt;
  GiteeRepoOwner user;
  GiteeComment();
  factory GiteeComment.fromJson(Map<String, dynamic> json) =>
      _$GiteeCommentFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteePatch {
  String diff;
  GiteePatch();
  factory GiteePatch.fromJson(Map<String, dynamic> json) =>
      _$GiteePatchFromJson(json);
}

// Two different classes because of variable type mismatch
// for additions, deletions, patch
@JsonSerializable(fieldRename: FieldRename.snake)
class GiteePullFile {
  String additions;
  String deletions;
  String blobUrl;
  String filename;
  String sha;
  String status;
  GiteePatch patch;
  GiteePullFile();
  factory GiteePullFile.fromJson(Map<String, dynamic> json) =>
      _$GiteePullFileFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeCommitFile {
  int additions;
  int deletions;
  int changes;
  String blobUrl;
  String filename;
  String sha;
  String status;
  String patch;
  GiteeCommitFile();
  factory GiteeCommitFile.fromJson(Map<String, dynamic> json) =>
      _$GiteeCommitFileFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeContributor {
  String name;
  int contributions;
  GiteeContributor();
  factory GiteeContributor.fromJson(Map<String, dynamic> json) =>
      _$GiteeContributorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteeBranch {
  String name;
  GiteeBranch();
  factory GiteeBranch.fromJson(Map<String, dynamic> json) =>
      _$GiteeBranchFromJson(json);
}
