// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitbucket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BbUser _$BbUserFromJson(Map<String, dynamic> json) {
  return BbUser()
    ..username = json['username'] as String
    ..displayName = json['display_name'] as String
    ..isStaff = json['is_staff'] as bool
    ..createdOn = json['created_on'] == null
        ? null
        : DateTime.parse(json['created_on'] as String)
    ..links = json['links'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BbUserToJson(BbUser instance) => <String, dynamic>{
      'username': instance.username,
      'display_name': instance.displayName,
      'is_staff': instance.isStaff,
      'created_on': instance.createdOn?.toIso8601String(),
      'links': instance.links,
    };
