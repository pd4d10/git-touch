import 'package:json_annotation/json_annotation.dart';
part 'bitbucket.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BbPagination {
  int pagelen;
  int size;
  int page;
  String next;
  List values;
  BbPagination();
  factory BbPagination.fromJson(Map<String, dynamic> json) =>
      _$BbPaginationFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbRepoOwner {
  String nickname;
  String displayName;
  String type; // user, team
  Map<String, dynamic> links;
  String get avatarUrl => links['avatar']['href'];
  BbRepoOwner();
  factory BbRepoOwner.fromJson(Map<String, dynamic> json) =>
      _$BbRepoOwnerFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbUser extends BbRepoOwner {
  String username;
  bool isStaff;
  DateTime createdOn;
  String accountId;
  BbUser();
  factory BbUser.fromJson(Map<String, dynamic> json) => _$BbUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbRepo {
  String name;
  BbRepoOwner owner;
  String website;
  String language;
  int size;
  String type; // repository
  bool isPrivate;
  DateTime createdOn;
  DateTime updatedOn;
  String description;
  String fullName;
  String slug;
  BbRepoMainbranch mainbranch;
  Map<String, dynamic> links;
  String get ownerLogin => fullName.split('/')[0]; // owner has no username
  String get avatarUrl => links['avatar']['href'];
  BbRepo();
  factory BbRepo.fromJson(Map<String, dynamic> json) => _$BbRepoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbRepoMainbranch {
  String type;
  String name;
  BbRepoMainbranch();
  factory BbRepoMainbranch.fromJson(Map<String, dynamic> json) =>
      _$BbRepoMainbranchFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbTree {
  String type;
  String path;
  int size;
  Map<String, dynamic> links;
  BbTree();
  factory BbTree.fromJson(Map<String, dynamic> json) => _$BbTreeFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbCommit {
  String message;
  DateTime date;
  String hash;
  BbCommitAuthor author;
  BbCommit();
  factory BbCommit.fromJson(Map<String, dynamic> json) =>
      _$BbCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbCommitAuthor {
  String raw;
  BbRepoOwner user;
  BbCommitAuthor();
  factory BbCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$BbCommitAuthorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbIssues {
  String priority;
  String state;
  BbRepo repository;
  String title;
  BbRepoOwner reporter;
  DateTime createdOn;
  Map<String, dynamic> links;
  String get issueLink => links['self']['href'];
  BbIssues();
  factory BbIssues.fromJson(Map<String, dynamic> json) =>
      _$BbIssuesFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbPulls {
  String description;
  BbRepoOwner author;
  String title;
  Map<String, dynamic> links;
  String get pullRequestLink => links['self']['href'];
  DateTime createdOn;
  BbPulls();
  factory BbPulls.fromJson(Map<String, dynamic> json) =>
      _$BbPullsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbCommentContent {
  String raw;
  String markup;
  String html;
  BbCommentContent();
  factory BbCommentContent.fromJson(Map<String, dynamic> json) =>
      _$BbCommentContentFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbComment {
  String createdOn;
  String updatedOn;
  BbCommentContent content;
  BbRepoOwner user;
  BbComment();
  factory BbComment.fromJson(Map<String, dynamic> json) =>
      _$BbCommentFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbBranch {
  String name;
  String type;
  BbBranch();
  factory BbBranch.fromJson(Map<String, dynamic> json) =>
      _$BbBranchFromJson(json);
}
