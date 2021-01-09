import 'package:json_annotation/json_annotation.dart';

part 'gitea.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaUser {
  int id;
  String login;
  String fullName;
  String avatarUrl;
  DateTime created;
  GiteaUser();
  factory GiteaUser.fromJson(Map<String, dynamic> json) =>
      _$GiteaUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaOrg {
  int id;
  String username;
  String fullName;
  String avatarUrl;
  String description;
  String website;
  String location;
  GiteaOrg();
  factory GiteaOrg.fromJson(Map<String, dynamic> json) =>
      _$GiteaOrgFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaRepository {
  int id;
  GiteaUser owner;
  String name;
  String description;
  int starsCount;
  int forksCount;
  DateTime updatedAt;
  String website;
  int size;
  int openIssuesCount;
  int openPrCounter;
  GiteaRepository();
  factory GiteaRepository.fromJson(Map<String, dynamic> json) =>
      _$GiteaRepositoryFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaTree {
  String type;
  String name;
  String path;
  int size;
  String downloadUrl;
  GiteaTree();
  factory GiteaTree.fromJson(Map<String, dynamic> json) =>
      _$GiteaTreeFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaBlob extends GiteaTree {
  String content;
  GiteaBlob();
  factory GiteaBlob.fromJson(Map<String, dynamic> json) =>
      _$GiteaBlobFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaCommit {
  int number;
  GiteaUser author;
  String title;
  String body;
  GiteaCommitDetail commit;
  String sha;
  String htmlUrl;
  GiteaCommit();
  factory GiteaCommit.fromJson(Map<String, dynamic> json) =>
      _$GiteaCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaCommitDetail {
  String message;
  GiteaCommitAuthor author;
  GiteaCommitAuthor committer;
  GiteaCommitDetail();
  factory GiteaCommitDetail.fromJson(Map<String, dynamic> json) =>
      _$GiteaCommitDetailFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaCommitAuthor {
  String name;
  String email;
  DateTime date;
  GiteaCommitAuthor();
  factory GiteaCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$GiteaCommitAuthorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaIssue {
  String title;
  String body;
  int number;
  GiteaUser user;
  int comments;
  DateTime updatedAt;
  String state;
  String htmlUrl;
  List<GiteaLabel> labels;
  GiteaIssue();
  factory GiteaIssue.fromJson(Map<String, dynamic> json) =>
      _$GiteaIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaLabel {
  String color;
  String name;
  GiteaLabel();
  factory GiteaLabel.fromJson(Map<String, dynamic> json) =>
      _$GiteaLabelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaHeatmapItem {
  int timestamp;
  int contributions;
  GiteaHeatmapItem();
  factory GiteaHeatmapItem.fromJson(Map<String, dynamic> json) =>
      _$GiteaHeatmapItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaComment {
  String body;
  DateTime createdAt;
  String htmlUrl;
  String originalAuthor;
  DateTime updatedAt;
  int id;
  GiteaUser user;
  GiteaComment();
  factory GiteaComment.fromJson(Map<String, dynamic> json) =>
      _$GiteaCommentFromJson(json);
}
