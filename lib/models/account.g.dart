// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return AccountModel(
      avatarUrl: json['avatarUrl'] as String,
      token: json['token'] as String,
      domain: json['domain'] as String);
}

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'token': instance.token,
      'domain': instance.domain
    };
