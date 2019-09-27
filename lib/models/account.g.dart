// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    platform: json['platform'] as String,
    domain: json['domain'] as String,
    token: json['token'] as String,
    login: json['login'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'platform': instance.platform,
      'domain': instance.domain,
      'token': instance.token,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
    };
