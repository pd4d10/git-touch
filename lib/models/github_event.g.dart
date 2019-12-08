// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubEvent _$GithubEventFromJson(Map<String, dynamic> json) {
  return GithubEvent()
    ..actor = json['actor'] == null
        ? null
        : GithubEventActor.fromJson(json['actor'] as Map<String, dynamic>)
    ..type = json['type'] as String
    ..repo = json['repo'] == null
        ? null
        : GithubEventRepo.fromJson(json['repo'] as Map<String, dynamic>)
    ..createdAt = json['created_at'] as String
    ..payload = json['payload'] as Map<String, dynamic>;
}

Map<String, dynamic> _$GithubEventToJson(GithubEvent instance) =>
    <String, dynamic>{
      'actor': instance.actor,
      'type': instance.type,
      'repo': instance.repo,
      'created_at': instance.createdAt,
      'payload': instance.payload,
    };

GithubEventActor _$GithubEventActorFromJson(Map<String, dynamic> json) {
  return GithubEventActor()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GithubEventActorToJson(GithubEventActor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

GithubEventRepo _$GithubEventRepoFromJson(Map<String, dynamic> json) {
  return GithubEventRepo()..name = json['name'] as String;
}

Map<String, dynamic> _$GithubEventRepoToJson(GithubEventRepo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
