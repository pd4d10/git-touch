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
    ..release = json['release'] == null
        ? null
        : GithubEventRelease.fromJson(json['release'] as Map<String, dynamic>)
    ..action = json['action'] as String
    ..ref = json['ref'] as String
    ..refType = json['ref_type'] as String
    ..before = json['before'] as String
    ..head = json['head'] as String
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
      'release': instance.release,
      'action': instance.action,
      'ref': instance.ref,
      'ref_type': instance.refType,
      'before': instance.before,
      'head': instance.head,
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
    ..pullRequest = json['pull_request']
    ..state = json['state'] as String
    ..comments = json['comments'] as int
    ..merged = json['merged'] as bool
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$GithubEventIssueToJson(GithubEventIssue instance) =>
    <String, dynamic>{
      'title': instance.title,
      'user': instance.user,
      'number': instance.number,
      'body': instance.body,
      'pull_request': instance.pullRequest,
      'state': instance.state,
      'comments': instance.comments,
      'merged': instance.merged,
      'created_at': instance.createdAt?.toIso8601String(),
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

GithubEventRelease _$GithubEventReleaseFromJson(Map<String, dynamic> json) {
  return GithubEventRelease()
    ..htmlUrl = json['html_url'] as String
    ..tagName = json['tag_name'] as String;
}

Map<String, dynamic> _$GithubEventReleaseToJson(GithubEventRelease instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'tag_name': instance.tagName,
    };

GithubNotificationItem _$GithubNotificationItemFromJson(
    Map<String, dynamic> json) {
  return GithubNotificationItem()
    ..id = json['id'] as String
    ..htmlUrl = json['html_url'] as String
    ..subject = json['subject'] == null
        ? null
        : GithubNotificationItemSubject.fromJson(
            json['subject'] as Map<String, dynamic>)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..repository = json['repository'] == null
        ? null
        : GithubNotificationItemRepo.fromJson(
            json['repository'] as Map<String, dynamic>)
    ..unread = json['unread'] as bool;
}

Map<String, dynamic> _$GithubNotificationItemToJson(
        GithubNotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'html_url': instance.htmlUrl,
      'subject': instance.subject,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'repository': instance.repository,
      'unread': instance.unread,
    };

GithubNotificationItemSubject _$GithubNotificationItemSubjectFromJson(
    Map<String, dynamic> json) {
  return GithubNotificationItemSubject()
    ..title = json['title'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$GithubNotificationItemSubjectToJson(
        GithubNotificationItemSubject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };

GithubNotificationItemRepo _$GithubNotificationItemRepoFromJson(
    Map<String, dynamic> json) {
  return GithubNotificationItemRepo()..fullName = json['full_name'] as String;
}

Map<String, dynamic> _$GithubNotificationItemRepoToJson(
        GithubNotificationItemRepo instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
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

GithubTrendingUser _$GithubTrendingUserFromJson(Map<String, dynamic> json) {
  return GithubTrendingUser()
    ..username = json['username'] as String
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..repo = json['repo'] == null
        ? null
        : GithubTrendingUserRepo.fromJson(json['repo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubTrendingUserToJson(GithubTrendingUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'avatar': instance.avatar,
      'repo': instance.repo,
    };

GithubTrendingUserRepo _$GithubTrendingUserRepoFromJson(
    Map<String, dynamic> json) {
  return GithubTrendingUserRepo()
    ..name = json['name'] as String
    ..description = json['description'] as String;
}

Map<String, dynamic> _$GithubTrendingUserRepoToJson(
        GithubTrendingUserRepo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

GithubTreeItem _$GithubTreeItemFromJson(Map<String, dynamic> json) {
  return GithubTreeItem()
    ..name = json['name'] as String
    ..path = json['path'] as String
    ..size = json['size'] as int
    ..type = json['type'] as String
    ..downloadUrl = json['download_url'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$GithubTreeItemToJson(GithubTreeItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'type': instance.type,
      'download_url': instance.downloadUrl,
      'content': instance.content,
    };
