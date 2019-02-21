// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['login'] as String,
      json['avatarUrl'] as String,
      json['name'] as String,
      json['publicRepos'] as int,
      json['followers'] as int,
      json['following'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'name': instance.name,
      'publicRepos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following
    };
