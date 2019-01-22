// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(json['login'] as String, json['avatar_url'] as String);
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl
    };

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(json['name'] as String);
}

Map<String, dynamic> _$RepoToJson(Repo instance) =>
    <String, dynamic>{'name': instance.name};

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      json['id'] as String,
      json['type'] as String,
      json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      json['repo'] == null
          ? null
          : Repo.fromJson(json['repo'] as Map<String, dynamic>))
    ..payload = json['payload'] as Map<String, dynamic>;
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor,
      'repo': instance.repo,
      'payload': instance.payload
    };
