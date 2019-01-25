// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(json['title'] as String, json['type'] as String);
}

Map<String, dynamic> _$SubjectToJson(Subject instance) =>
    <String, dynamic>{'title': instance.title, 'type': instance.type};

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(json['login'] as String, json['avatar_url'] as String);
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl
    };

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
      json['full_name'] as String,
      json['type'] as String,
      json['onwer'] == null
          ? null
          : Owner.fromJson(json['onwer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'type': instance.type,
      'onwer': instance.onwer
    };

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) {
  return NotificationItem(
      json['id'] as String,
      json['type'] as String,
      json['updated_at'] as String,
      json['repository'] == null
          ? null
          : Repository.fromJson(json['repository'] as Map<String, dynamic>),
      json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>))
    ..payload = json['payload'] as Map<String, dynamic>;
}

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'updated_at': instance.updatedAt,
      'repository': instance.repository,
      'subject': instance.subject,
      'payload': instance.payload
    };
