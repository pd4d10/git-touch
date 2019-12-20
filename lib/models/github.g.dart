// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubEvent _$GithubEventFromJson(Map<String, dynamic> json) {
  return GithubEvent()
    ..actor = json['actor'] == null
        ? null
        : GithubEventUser.fromJson(json['actor'] as Map<String, dynamic>)
    ..type = json['type'] as String
    ..repo = json['repo'] == null
        ? null
        : GithubEventRepo.fromJson(json['repo'] as Map<String, dynamic>)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..payload = json['payload'] == null
        ? null
        : GithubEventPayload.fromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubEventToJson(GithubEvent instance) =>
    <String, dynamic>{
      'actor': instance.actor,
      'type': instance.type,
      'repo': instance.repo,
      'created_at': instance.createdAt?.toIso8601String(),
      'payload': instance.payload,
    };

GithubEventUser _$GithubEventUserFromJson(Map<String, dynamic> json) {
  return GithubEventUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GithubEventUserToJson(GithubEventUser instance) =>
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

GithubEventPayload _$GithubEventPayloadFromJson(Map<String, dynamic> json) {
  return GithubEventPayload()
    ..issue = json['issue'] == null
        ? null
        : GithubEventIssue.fromJson(json['issue'] as Map<String, dynamic>)
    ..pullRequest = json['pull_request'] == null
        ? null
        : GithubEventIssue.fromJson(
            json['pull_request'] as Map<String, dynamic>)
    ..comment = json['comment'] == null
        ? null
        : GithubEventComment.fromJson(json['comment'] as Map<String, dynamic>)
    ..action = json['action'] as String
    ..ref = json['ref'] as String
    ..before = json['before'] as String
    ..after = json['after'] as String
    ..commits = (json['commits'] as List)
        ?.map((e) => e == null
            ? null
            : GithubEventCommit.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..forkee = json['forkee'] as Map<String, dynamic>;
}

Map<String, dynamic> _$GithubEventPayloadToJson(GithubEventPayload instance) =>
    <String, dynamic>{
      'issue': instance.issue,
      'pull_request': instance.pullRequest,
      'comment': instance.comment,
      'action': instance.action,
      'ref': instance.ref,
      'before': instance.before,
      'after': instance.after,
      'commits': instance.commits,
      'forkee': instance.forkee,
    };

GithubEventIssue _$GithubEventIssueFromJson(Map<String, dynamic> json) {
  return GithubEventIssue()
    ..title = json['title'] as String
    ..user = json['user'] == null
        ? null
        : GithubEventUser.fromJson(json['user'] as Map<String, dynamic>)
    ..number = json['number'] as int
    ..body = json['body'] as String
    ..pullRequest = json['pull_request'];
}

Map<String, dynamic> _$GithubEventIssueToJson(GithubEventIssue instance) =>
    <String, dynamic>{
      'title': instance.title,
      'user': instance.user,
      'number': instance.number,
      'body': instance.body,
      'pull_request': instance.pullRequest,
    };

GithubEventComment _$GithubEventCommentFromJson(Map<String, dynamic> json) {
  return GithubEventComment()
    ..body = json['body'] as String
    ..user = json['user'] == null
        ? null
        : GithubEventUser.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubEventCommentToJson(GithubEventComment instance) =>
    <String, dynamic>{
      'body': instance.body,
      'user': instance.user,
    };

GithubEventCommit _$GithubEventCommitFromJson(Map<String, dynamic> json) {
  return GithubEventCommit()
    ..sha = json['sha'] as String
    ..message = json['message'] as String;
}

Map<String, dynamic> _$GithubEventCommitToJson(GithubEventCommit instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'message': instance.message,
    };

GithubTrendingItem _$GithubTrendingItemFromJson(Map<String, dynamic> json) {
  return GithubTrendingItem()
    ..author = json['author'] as String
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..description = json['description'] as String
    ..language = json['language'] as String
    ..languageColor = json['languageColor'] as String
    ..stars = json['stars'] as int
    ..forks = json['forks'] as int
    ..currentPeriodStars = json['currentPeriodStars'] as int;
}

Map<String, dynamic> _$GithubTrendingItemToJson(GithubTrendingItem instance) =>
    <String, dynamic>{
      'author': instance.author,
      'name': instance.name,
      'avatar': instance.avatar,
      'description': instance.description,
      'language': instance.language,
      'languageColor': instance.languageColor,
      'stars': instance.stars,
      'forks': instance.forks,
      'currentPeriodStars': instance.currentPeriodStars,
    };
