// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeUser _$GiteeUserFromJson(Map<String, dynamic> json) {
  return GiteeUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GiteeUserToJson(GiteeUser instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
