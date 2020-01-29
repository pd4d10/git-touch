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
  GiteaRepository();
  factory GiteaRepository.fromJson(Map<String, dynamic> json) =>
      _$GiteaRepositoryFromJson(json);
}
