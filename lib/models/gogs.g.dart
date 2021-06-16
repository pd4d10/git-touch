// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GogsUser _$GogsUserFromJson(Map<String, dynamic> json) {
  return GogsUser()
    ..id = json['id'] as int?
    ..username = json['username'] as String?
    ..fullName = json['full_name'] as String?
    ..avatarUrl = json['avatar_url'] as String?
    ..email = json['email'] as String?;
}

Map<String, dynamic> _$GogsUserToJson(GogsUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'email': instance.email,
    };

GogsRepository _$GogsRepositoryFromJson(Map<String, dynamic> json) {
  return GogsRepository()
    ..id = json['id'] as int?
    ..fullName = json['full_name'] as String?
    ..private = json['private'] as bool?
    ..owner = json['owner'] == null
        ? null
        : GogsUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..htmlUrl = json['html_url'] as String?
    ..description = json['description'] as String?
    ..defaultBranch = json['default_branch'] as String?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..starsCount = json['stars_count'] as int?
    ..forksCount = json['forks_count'] as int?
    ..website = json['website'] as String?
    ..watchersCount = json['watchers_count'] as int?;
}

Map<String, dynamic> _$GogsRepositoryToJson(GogsRepository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'default_branch': instance.defaultBranch,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'stars_count': instance.starsCount,
      'forks_count': instance.forksCount,
      'website': instance.website,
      'watchers_count': instance.watchersCount,
    };

GogsOrg _$GogsOrgFromJson(Map<String, dynamic> json) {
  return GogsOrg()
    ..id = json['id'] as int?
    ..username = json['username'] as String?
    ..fullName = json['full_name'] as String?
    ..avatarUrl = json['avatar_url'] as String?
    ..description = json['description'] as String?
    ..location = json['location'] as String?
    ..website = json['website'] as String?;
}

Map<String, dynamic> _$GogsOrgToJson(GogsOrg instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'location': instance.location,
      'website': instance.website,
    };

GogsTree _$GogsTreeFromJson(Map<String, dynamic> json) {
  return GogsTree(
    type: json['type'] as String,
    name: json['name'] as String,
  )
    ..path = json['path'] as String?
    ..size = json['size'] as int?
    ..downloadUrl = json['download_url'] as String?;
}

Map<String, dynamic> _$GogsTreeToJson(GogsTree instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
    };

GogsBlob _$GogsBlobFromJson(Map<String, dynamic> json) {
  return GogsBlob(
    type: json['type'] as String,
    name: json['name'] as String,
  )
    ..path = json['path'] as String?
    ..size = json['size'] as int?
    ..downloadUrl = json['download_url'] as String?
    ..content = json['content'] as String?;
}

Map<String, dynamic> _$GogsBlobToJson(GogsBlob instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
      'content': instance.content,
    };

GogsBranch _$GogsBranchFromJson(Map<String, dynamic> json) {
  return GogsBranch()..name = json['name'] as String?;
}

Map<String, dynamic> _$GogsBranchToJson(GogsBranch instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

GogsCommit _$GogsCommitFromJson(Map<String, dynamic> json) {
  return GogsCommit()
    ..author = json['author'] == null
        ? null
        : GogsUser.fromJson(json['author'] as Map<String, dynamic>)
    ..commit = json['commit'] == null
        ? null
        : GogsCommitDetail.fromJson(json['commit'] as Map<String, dynamic>)
    ..sha = json['sha'] as String?
    ..htmlUrl = json['html_url'] as String?;
}

Map<String, dynamic> _$GogsCommitToJson(GogsCommit instance) =>
    <String, dynamic>{
      'author': instance.author,
      'commit': instance.commit,
      'sha': instance.sha,
      'html_url': instance.htmlUrl,
    };

GogsCommitDetail _$GogsCommitDetailFromJson(Map<String, dynamic> json) {
  return GogsCommitDetail()
    ..message = json['message'] as String?
    ..author = json['author'] == null
        ? null
        : GogsCommitAuthor.fromJson(json['author'] as Map<String, dynamic>)
    ..committer = json['committer'] == null
        ? null
        : GogsCommitAuthor.fromJson(json['committer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GogsCommitDetailToJson(GogsCommitDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
      'committer': instance.committer,
    };

GogsCommitAuthor _$GogsCommitAuthorFromJson(Map<String, dynamic> json) {
  return GogsCommitAuthor()
    ..name = json['name'] as String?
    ..email = json['email'] as String?
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$GogsCommitAuthorToJson(GogsCommitAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date?.toIso8601String(),
    };

GogsIssue _$GogsIssueFromJson(Map<String, dynamic> json) {
  return GogsIssue()
    ..number = json['number'] as int?
    ..state = json['state'] as String?
    ..title = json['title'] as String?
    ..body = json['body'] as String?
    ..user = json['user'] == null
        ? null
        : GogsUser.fromJson(json['user'] as Map<String, dynamic>)
    ..labels = (json['labels'] as List<dynamic>?)
        ?.map((e) => GogsLabel.fromJson(e as Map<String, dynamic>))
        .toList()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..comments = json['comments'] as int?;
}

Map<String, dynamic> _$GogsIssueToJson(GogsIssue instance) => <String, dynamic>{
      'number': instance.number,
      'state': instance.state,
      'title': instance.title,
      'body': instance.body,
      'user': instance.user,
      'labels': instance.labels,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments': instance.comments,
    };

GogsLabel _$GogsLabelFromJson(Map<String, dynamic> json) {
  return GogsLabel()
    ..name = json['name'] as String?
    ..color = json['color'] as String?;
}

Map<String, dynamic> _$GogsLabelToJson(GogsLabel instance) => <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };
