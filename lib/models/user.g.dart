// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['login'] as String,
      json['avatar_url'] as String,
      json['name'] as String,
      json['public_repos'] as int,
      json['followers'] as int,
      json['following'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following
    };
