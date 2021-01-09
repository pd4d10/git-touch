// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeUser _$GiteeUserFromJson(Map<String, dynamic> json) {
  return GiteeUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..name = json['name'] as String
    ..htmlUrl = json['html_url'] as String
    ..bio = json['bio'] as String
    ..blog = json['blog'] as String
    ..publicRepos = json['public_repos'] as int
    ..followers = json['followers'] as int
    ..following = json['following'] as int
    ..stared = json['stared'] as int
    ..watched = json['watched'] as int
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$GiteeUserToJson(GiteeUser instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'html_url': instance.htmlUrl,
      'bio': instance.bio,
      'blog': instance.blog,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following,
      'stared': instance.stared,
      'watched': instance.watched,
      'created_at': instance.createdAt?.toIso8601String(),
    };

GiteeListUser _$GiteeListUserFromJson(Map<String, dynamic> json) {
  return GiteeListUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..name = json['name'] as String
    ..htmlUrl = json['html_url'] as String;
}

Map<String, dynamic> _$GiteeListUserToJson(GiteeListUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'html_url': instance.htmlUrl,
    };

GiteeRepo _$GiteeRepoFromJson(Map<String, dynamic> json) {
  return GiteeRepo()
    ..namespace = json['namespace'] == null
        ? null
        : GiteeRepoNamespace.fromJson(json['namespace'] as Map<String, dynamic>)
    ..owner = json['owner'] == null
        ? null
        : GiteeRepoOwner.fromJson(json['owner'] as Map<String, dynamic>)
    ..path = json['path'] as String
    ..description = json['description'] as String
    ..private = json['private'] as bool
    ..public = json['public'] as bool
    ..internal = json['internal'] as bool
    ..fork = json['fork'] as bool
    ..forksCount = json['forks_count'] as int
    ..stargazersCount = json['stargazers_count'] as int
    ..watchersCount = json['watchers_count'] as int
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..license = json['license'] as String
    ..homepage = json['homepage'] as String
    ..openIssuesCount = json['open_issues_count'] as int
    ..pullRequestsEnabled = json['pull_requests_enabled'] as bool
    ..defaultBranch = json['default_branch'] as String;
}

Map<String, dynamic> _$GiteeRepoToJson(GiteeRepo instance) => <String, dynamic>{
      'namespace': instance.namespace,
      'owner': instance.owner,
      'path': instance.path,
      'description': instance.description,
      'private': instance.private,
      'public': instance.public,
      'internal': instance.internal,
      'fork': instance.fork,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'license': instance.license,
      'homepage': instance.homepage,
      'open_issues_count': instance.openIssuesCount,
      'pull_requests_enabled': instance.pullRequestsEnabled,
      'default_branch': instance.defaultBranch,
    };

GiteeRepoOwner _$GiteeRepoOwnerFromJson(Map<String, dynamic> json) {
  return GiteeRepoOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GiteeRepoOwnerToJson(GiteeRepoOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

GiteeRepoNamespace _$GiteeRepoNamespaceFromJson(Map<String, dynamic> json) {
  return GiteeRepoNamespace()..path = json['path'] as String;
}

Map<String, dynamic> _$GiteeRepoNamespaceToJson(GiteeRepoNamespace instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

GiteeCommit _$GiteeCommitFromJson(Map<String, dynamic> json) {
  return GiteeCommit()
    ..author = json['author'] == null
        ? null
        : GiteeUser.fromJson(json['author'] as Map<String, dynamic>)
    ..commit = json['commit'] == null
        ? null
        : GiteeCommitDetail.fromJson(json['commit'] as Map<String, dynamic>)
    ..sha = json['sha'] as String
    ..htmlUrl = json['html_url'] as String
    ..files = (json['files'] as List)
        ?.map((e) => e == null
            ? null
            : GiteeCommitFile.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GiteeCommitToJson(GiteeCommit instance) =>
    <String, dynamic>{
      'author': instance.author,
      'commit': instance.commit,
      'sha': instance.sha,
      'html_url': instance.htmlUrl,
      'files': instance.files,
    };

GiteeCommitDetail _$GiteeCommitDetailFromJson(Map<String, dynamic> json) {
  return GiteeCommitDetail()
    ..message = json['message'] as String
    ..author = json['author'] == null
        ? null
        : GiteeCommitAuthor.fromJson(json['author'] as Map<String, dynamic>)
    ..committer = json['committer'] == null
        ? null
        : GiteeCommitAuthor.fromJson(json['committer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GiteeCommitDetailToJson(GiteeCommitDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
      'committer': instance.committer,
    };

GiteeCommitAuthor _$GiteeCommitAuthorFromJson(Map<String, dynamic> json) {
  return GiteeCommitAuthor()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$GiteeCommitAuthorToJson(GiteeCommitAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date?.toIso8601String(),
    };

GiteeTreeItem _$GiteeTreeItemFromJson(Map<String, dynamic> json) {
  return GiteeTreeItem()
    ..path = json['path'] as String
    ..type = json['type'] as String
    ..sha = json['sha'] as String
    ..size = json['size'] as int;
}

Map<String, dynamic> _$GiteeTreeItemToJson(GiteeTreeItem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': instance.type,
      'sha': instance.sha,
      'size': instance.size,
    };

GiteeBlob _$GiteeBlobFromJson(Map<String, dynamic> json) {
  return GiteeBlob()..content = json['content'] as String;
}

Map<String, dynamic> _$GiteeBlobToJson(GiteeBlob instance) => <String, dynamic>{
      'content': instance.content,
    };

GiteeLabel _$GiteeLabelFromJson(Map<String, dynamic> json) {
  return GiteeLabel()
    ..color = json['color'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GiteeLabelToJson(GiteeLabel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

GiteeIssue _$GiteeIssueFromJson(Map<String, dynamic> json) {
  return GiteeIssue()
    ..comments = json['comments'] as int
    ..commentsUrl = json['comments_url'] as String
    ..createdAt = json['created_at'] as String
    ..htmlUrl = json['html_url'] as String
    ..updatedAt = json['updated_at'] as String
    ..body = json['body'] as String
    ..bodyHtml = json['body_html'] as String
    ..title = json['title'] as String
    ..state = json['state'] as String
    ..repository = json['repository'] == null
        ? null
        : GiteeRepo.fromJson(json['repository'] as Map<String, dynamic>)
    ..user = json['user'] == null
        ? null
        : GiteeRepoOwner.fromJson(json['user'] as Map<String, dynamic>)
    ..number = json['number'] as String
    ..labels = (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : GiteeLabel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..id = json['id'] as int;
}

Map<String, dynamic> _$GiteeIssueToJson(GiteeIssue instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'comments_url': instance.commentsUrl,
      'created_at': instance.createdAt,
      'html_url': instance.htmlUrl,
      'updated_at': instance.updatedAt,
      'body': instance.body,
      'body_html': instance.bodyHtml,
      'title': instance.title,
      'state': instance.state,
      'repository': instance.repository,
      'user': instance.user,
      'number': instance.number,
      'labels': instance.labels,
      'id': instance.id,
    };

GiteePull _$GiteePullFromJson(Map<String, dynamic> json) {
  return GiteePull()
    ..commentsUrl = json['comments_url'] as String
    ..createdAt = json['created_at'] as String
    ..htmlUrl = json['html_url'] as String
    ..updatedAt = json['updated_at'] as String
    ..body = json['body'] as String
    ..bodyHtml = json['body_html'] as String
    ..title = json['title'] as String
    ..state = json['state'] as String
    ..user = json['user'] == null
        ? null
        : GiteeRepoOwner.fromJson(json['user'] as Map<String, dynamic>)
    ..labels = (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : GiteeLabel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..number = json['number'] as int
    ..id = json['id'] as int;
}

Map<String, dynamic> _$GiteePullToJson(GiteePull instance) => <String, dynamic>{
      'comments_url': instance.commentsUrl,
      'created_at': instance.createdAt,
      'html_url': instance.htmlUrl,
      'updated_at': instance.updatedAt,
      'body': instance.body,
      'body_html': instance.bodyHtml,
      'title': instance.title,
      'state': instance.state,
      'user': instance.user,
      'labels': instance.labels,
      'number': instance.number,
      'id': instance.id,
    };

GiteeComment _$GiteeCommentFromJson(Map<String, dynamic> json) {
  return GiteeComment()
    ..id = json['id'] as int
    ..body = json['body'] as String
    ..createdAt = json['created_at'] as String
    ..user = json['user'] == null
        ? null
        : GiteeRepoOwner.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GiteeCommentToJson(GiteeComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'created_at': instance.createdAt,
      'user': instance.user,
    };

GiteePatch _$GiteePatchFromJson(Map<String, dynamic> json) {
  return GiteePatch()..diff = json['diff'] as String;
}

Map<String, dynamic> _$GiteePatchToJson(GiteePatch instance) =>
    <String, dynamic>{
      'diff': instance.diff,
    };

GiteePullFile _$GiteePullFileFromJson(Map<String, dynamic> json) {
  return GiteePullFile()
    ..additions = json['additions'] as String
    ..deletions = json['deletions'] as String
    ..blobUrl = json['blob_url'] as String
    ..filename = json['filename'] as String
    ..sha = json['sha'] as String
    ..status = json['status'] as String
    ..patch = json['patch'] == null
        ? null
        : GiteePatch.fromJson(json['patch'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GiteePullFileToJson(GiteePullFile instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'deletions': instance.deletions,
      'blob_url': instance.blobUrl,
      'filename': instance.filename,
      'sha': instance.sha,
      'status': instance.status,
      'patch': instance.patch,
    };

GiteeCommitFile _$GiteeCommitFileFromJson(Map<String, dynamic> json) {
  return GiteeCommitFile()
    ..additions = json['additions'] as int
    ..deletions = json['deletions'] as int
    ..changes = json['changes'] as int
    ..blobUrl = json['blob_url'] as String
    ..filename = json['filename'] as String
    ..sha = json['sha'] as String
    ..status = json['status'] as String
    ..patch = json['patch'] as String;
}

Map<String, dynamic> _$GiteeCommitFileToJson(GiteeCommitFile instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'deletions': instance.deletions,
      'changes': instance.changes,
      'blob_url': instance.blobUrl,
      'filename': instance.filename,
      'sha': instance.sha,
      'status': instance.status,
      'patch': instance.patch,
    };

GiteeContributor _$GiteeContributorFromJson(Map<String, dynamic> json) {
  return GiteeContributor()
    ..name = json['name'] as String
    ..contributions = json['contributions'] as int;
}

Map<String, dynamic> _$GiteeContributorToJson(GiteeContributor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contributions': instance.contributions,
    };

GiteeBranch _$GiteeBranchFromJson(Map<String, dynamic> json) {
  return GiteeBranch()..name = json['name'] as String;
}

Map<String, dynamic> _$GiteeBranchToJson(GiteeBranch instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
