import 'package:json_annotation/json_annotation.dart';

part 'gitea.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GiteaUser {
  int id;
  String login;
  String fullName;
  String avatarUrl;

  GiteaUser();

  factory GiteaUser.fromJson(Map<String, dynamic> json) =>
      _$GiteaUserFromJson(json);
}

@JsonSerializable()
class GiteaRepository {
  int id;
  GiteaUser owner;
  String name;
  String description;
  int starsCount;
  int forksCount;

  GiteaRepository();

  factory GiteaRepository.fromJson(Map<String, dynamic> json) =>
      _$GiteaRepositoryFromJson(json);
}
