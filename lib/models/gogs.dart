import 'package:json_annotation/json_annotation.dart';

part 'gogs.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsUser {
  int id;
  String username;
  String fullName;
  String avatarUrl;
  String email;
  GogsUser();
  factory GogsUser.fromJson(Map<String, dynamic> json) =>
      _$GogsUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsRepository {
  int id;
  String fullName;
  bool private;
  GogsUser owner;
  String htmlUrl;
  String description;
  String defaultBranch;
  DateTime createdAt;
  DateTime updatedAt;
  int starsCount;
  int forksCount;
  String website;
  int watchersCount;
  GogsRepository();
  factory GogsRepository.fromJson(Map<String, dynamic> json) =>
      _$GogsRepositoryFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsOrg {
  int id;
  String username;
  String fullName;
  String avatarUrl;
  String description;
  String location;
  String website;
  GogsOrg();
  factory GogsOrg.fromJson(Map<String, dynamic> json) =>
      _$GogsOrgFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsTree {
  String type;
  String name;
  String path;
  int size;
  String downloadUrl;
  GogsTree();
  factory GogsTree.fromJson(Map<String, dynamic> json) =>
      _$GogsTreeFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsBlob extends GogsTree {
  String content;
  GogsBlob();
  factory GogsBlob.fromJson(Map<String, dynamic> json) =>
      _$GogsBlobFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsBranch {
  String name;
  GogsBranch();
  factory GogsBranch.fromJson(Map<String, dynamic> json) =>
      _$GogsBranchFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsCommit {
  GogsUser author;
  GogsCommitDetail commit;
  String sha;
  String htmlUrl;
  GogsCommit();
  factory GogsCommit.fromJson(Map<String, dynamic> json) =>
      _$GogsCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsCommitDetail {
  String message;
  GogsCommitAuthor author;
  GogsCommitAuthor committer;
  GogsCommitDetail();
  factory GogsCommitDetail.fromJson(Map<String, dynamic> json) =>
      _$GogsCommitDetailFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsCommitAuthor {
  String name;
  String email;
  DateTime date;
  GogsCommitAuthor();
  factory GogsCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$GogsCommitAuthorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsIssue {
  int number;
  String state;
  String title;
  String body;
  GogsUser user;
  List<GogsLabel> labels;
  DateTime createdAt;
  DateTime updatedAt;
  int comments;
  GogsIssue();
  factory GogsIssue.fromJson(Map<String, dynamic> json) =>
      _$GogsIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GogsLabel {
  String name;
  String color;
  GogsLabel();
  factory GogsLabel.fromJson(Map<String, dynamic> json) =>
      _$GogsLabelFromJson(json);
}
