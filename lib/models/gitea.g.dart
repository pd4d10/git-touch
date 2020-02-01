// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteaUser _$GiteaUserFromJson(Map<String, dynamic> json) {
  return GiteaUser()
    ..id = json['id'] as int
    ..login = json['login'] as String
    ..fullName = json['full_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..created = json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String);
}

Map<String, dynamic> _$GiteaUserToJson(GiteaUser instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'created': instance.created?.toIso8601String(),
    };

GiteaRepository _$GiteaRepositoryFromJson(Map<String, dynamic> json) {
  return GiteaRepository()
    ..id = json['id'] as int
    ..owner = json['owner'] == null
        ? null
        : GiteaUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..starsCount = json['stars_count'] as int
    ..forksCount = json['forks_count'] as int
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..website = json['website'] as String
    ..size = json['size'] as int
    ..openIssuesCount = json['open_issues_count'] as int
    ..openPrCounter = json['open_pr_counter'] as int;
}

Map<String, dynamic> _$GiteaRepositoryToJson(GiteaRepository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'stars_count': instance.starsCount,
      'forks_count': instance.forksCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'website': instance.website,
      'size': instance.size,
      'open_issues_count': instance.openIssuesCount,
      'open_pr_counter': instance.openPrCounter,
    };

GiteaTree _$GiteaTreeFromJson(Map<String, dynamic> json) {
  return GiteaTree()
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..path = json['path'] as String
    ..size = json['size'] as int
    ..downloadUrl = json['download_url'] as String;
}

Map<String, dynamic> _$GiteaTreeToJson(GiteaTree instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
    };

GiteaBlob _$GiteaBlobFromJson(Map<String, dynamic> json) {
  return GiteaBlob()
    ..type = json['type'] as String
    ..name = json['name'] as String
    ..path = json['path'] as String
    ..size = json['size'] as int
    ..downloadUrl = json['download_url'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$GiteaBlobToJson(GiteaBlob instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
      'content': instance.content,
    };

GiteaCommit _$GiteaCommitFromJson(Map<String, dynamic> json) {
  return GiteaCommit()
    ..number = json['number'] as int
    ..author = json['author'] == null
        ? null
        : GiteaUser.fromJson(json['author'] as Map<String, dynamic>)
    ..title = json['title'] as String
    ..body = json['body'] as String
    ..commit = json['commit'] == null
        ? null
        : GiteaCommitDetail.fromJson(json['commit'] as Map<String, dynamic>)
    ..sha = json['sha'] as String
    ..htmlUrl = json['html_url'] as String;
}

Map<String, dynamic> _$GiteaCommitToJson(GiteaCommit instance) =>
    <String, dynamic>{
      'number': instance.number,
      'author': instance.author,
      'title': instance.title,
      'body': instance.body,
      'commit': instance.commit,
      'sha': instance.sha,
      'html_url': instance.htmlUrl,
    };

GiteaCommitDetail _$GiteaCommitDetailFromJson(Map<String, dynamic> json) {
  return GiteaCommitDetail()
    ..message = json['message'] as String
    ..author = json['author'] == null
        ? null
        : GiteaCommitAuthor.fromJson(json['author'] as Map<String, dynamic>)
    ..committer = json['committer'] == null
        ? null
        : GiteaCommitAuthor.fromJson(json['committer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GiteaCommitDetailToJson(GiteaCommitDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
      'committer': instance.committer,
    };

GiteaCommitAuthor _$GiteaCommitAuthorFromJson(Map<String, dynamic> json) {
  return GiteaCommitAuthor()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$GiteaCommitAuthorToJson(GiteaCommitAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date?.toIso8601String(),
    };
