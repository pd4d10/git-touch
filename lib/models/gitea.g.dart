// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteaUser _$GiteaUserFromJson(Map<String, dynamic> json) {
  return GiteaUser()
    ..id = json['id'] as int
    ..login = json['login'] as String
    ..fullName = json['full_name'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GiteaUserToJson(GiteaUser instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
    };

GiteaRepository _$GiteaRepositoryFromJson(Map<String, dynamic> json) {
  return GiteaRepository()
    ..id = json['id'] as int
    ..owner = json['owner'] == null
        ? null
        : GiteaUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..starsCount = json['starsCount'] as int
    ..forksCount = json['forksCount'] as int;
}

Map<String, dynamic> _$GiteaRepositoryToJson(GiteaRepository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'starsCount': instance.starsCount,
      'forksCount': instance.forksCount,
    };
