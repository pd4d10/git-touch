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
