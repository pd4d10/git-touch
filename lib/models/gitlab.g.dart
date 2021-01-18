// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitlab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitlabUser _$GitlabUserFromJson(Map<String, dynamic> json) {
  return GitlabUser()
    ..id = json['id'] as int
    ..username = json['username'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..bio = json['bio'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..accessLevel = json['access_level'] as int;
}

Map<String, dynamic> _$GitlabUserToJson(GitlabUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'created_at': instance.createdAt?.toIso8601String(),
      'access_level': instance.accessLevel,
    };

GitlabGroup _$GitlabGroupFromJson(Map<String, dynamic> json) {
  return GitlabGroup()
    ..id = json['id'] as int
    ..path = json['path'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..description = json['description'] as String
    ..projects = (json['projects'] as List)
        ?.map((e) => e == null
            ? null
            : GitlabProject.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GitlabGroupToJson(GitlabGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'projects': instance.projects,
    };

GitlabTodoProject _$GitlabTodoProjectFromJson(Map<String, dynamic> json) {
  return GitlabTodoProject()
    ..pathWithNamespace = json['path_with_namespace'] as String;
}

Map<String, dynamic> _$GitlabTodoProjectToJson(GitlabTodoProject instance) =>
    <String, dynamic>{
      'path_with_namespace': instance.pathWithNamespace,
    };

GitlabTodo _$GitlabTodoFromJson(Map<String, dynamic> json) {
  return GitlabTodo()
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..project = json['project'] == null
        ? null
        : GitlabTodoProject.fromJson(json['project'] as Map<String, dynamic>)
    ..actionName = json['action_name'] as String
    ..targetType = json['target_type'] as String
    ..target = json['target'] == null
        ? null
        : GitlabTodoTarget.fromJson(json['target'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GitlabTodoToJson(GitlabTodo instance) =>
    <String, dynamic>{
      'author': instance.author,
      'project': instance.project,
      'action_name': instance.actionName,
      'target_type': instance.targetType,
      'target': instance.target,
    };

GitlabTodoTarget _$GitlabTodoTargetFromJson(Map<String, dynamic> json) {
  return GitlabTodoTarget()
    ..iid = json['iid'] as int
    ..projectId = json['project_id'] as int
    ..title = json['title'] as String
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..description = json['description'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$GitlabTodoTargetToJson(GitlabTodoTarget instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'project_id': instance.projectId,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
    };

GitlabIssueNote _$GitlabIssueNoteFromJson(Map<String, dynamic> json) {
  return GitlabIssueNote()
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..body = json['body'] as String
    ..system = json['system'] as bool
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$GitlabIssueNoteToJson(GitlabIssueNote instance) =>
    <String, dynamic>{
      'author': instance.author,
      'body': instance.body,
      'system': instance.system,
      'created_at': instance.createdAt?.toIso8601String(),
    };

GitlabProject _$GitlabProjectFromJson(Map<String, dynamic> json) {
  return GitlabProject()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..description = json['description'] as String
    ..starCount = json['star_count'] as int
    ..forksCount = json['forks_count'] as int
    ..visibility = json['visibility'] as String
    ..readmeUrl = json['readme_url'] as String
    ..webUrl = json['web_url'] as String
    ..namespace = json['namespace'] == null
        ? null
        : GitlabProjectNamespace.fromJson(
            json['namespace'] as Map<String, dynamic>)
    ..owner = json['owner'] == null
        ? null
        : GitlabUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..issuesEnabled = json['issues_enabled'] as bool
    ..openIssuesCount = json['open_issues_count'] as int
    ..mergeRequestsEnabled = json['merge_requests_enabled'] as bool
    ..statistics = json['statistics'] == null
        ? null
        : GitlabProjectStatistics.fromJson(
            json['statistics'] as Map<String, dynamic>)
    ..lastActivityAt = json['last_activity_at'] == null
        ? null
        : DateTime.parse(json['last_activity_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..defaultBranch = json['default_branch'] as String;
}

Map<String, dynamic> _$GitlabProjectToJson(GitlabProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'star_count': instance.starCount,
      'forks_count': instance.forksCount,
      'visibility': instance.visibility,
      'readme_url': instance.readmeUrl,
      'web_url': instance.webUrl,
      'namespace': instance.namespace,
      'owner': instance.owner,
      'issues_enabled': instance.issuesEnabled,
      'open_issues_count': instance.openIssuesCount,
      'merge_requests_enabled': instance.mergeRequestsEnabled,
      'statistics': instance.statistics,
      'last_activity_at': instance.lastActivityAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'default_branch': instance.defaultBranch,
    };

GitlabProjectBadge _$GitlabProjectBadgeFromJson(Map<String, dynamic> json) {
  return GitlabProjectBadge()
    ..renderedImageUrl = json['rendered_image_url'] as String;
}

Map<String, dynamic> _$GitlabProjectBadgeToJson(GitlabProjectBadge instance) =>
    <String, dynamic>{
      'rendered_image_url': instance.renderedImageUrl,
    };

GitlabProjectStatistics _$GitlabProjectStatisticsFromJson(
    Map<String, dynamic> json) {
  return GitlabProjectStatistics()
    ..commitCount = json['commit_count'] as int
    ..repositorySize = json['repository_size'] as int;
}

Map<String, dynamic> _$GitlabProjectStatisticsToJson(
        GitlabProjectStatistics instance) =>
    <String, dynamic>{
      'commit_count': instance.commitCount,
      'repository_size': instance.repositorySize,
    };

GitlabProjectNamespace _$GitlabProjectNamespaceFromJson(
    Map<String, dynamic> json) {
  return GitlabProjectNamespace()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..path = json['path'] as String
    ..kind = json['kind'] as String;
}

Map<String, dynamic> _$GitlabProjectNamespaceToJson(
        GitlabProjectNamespace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'kind': instance.kind,
    };

GitlabTreeItem _$GitlabTreeItemFromJson(Map<String, dynamic> json) {
  return GitlabTreeItem()
    ..type = json['type'] as String
    ..path = json['path'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GitlabTreeItemToJson(GitlabTreeItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'path': instance.path,
      'name': instance.name,
    };

GitlabBlob _$GitlabBlobFromJson(Map<String, dynamic> json) {
  return GitlabBlob()..content = json['content'] as String;
}

Map<String, dynamic> _$GitlabBlobToJson(GitlabBlob instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

GitlabEvent _$GitlabEventFromJson(Map<String, dynamic> json) {
  return GitlabEvent()
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..actionName = json['action_name'] as String
    ..targetType = json['target_type'] as String
    ..note = json['note'] == null
        ? null
        : GitlabEventNote.fromJson(json['note'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GitlabEventToJson(GitlabEvent instance) =>
    <String, dynamic>{
      'author': instance.author,
      'action_name': instance.actionName,
      'target_type': instance.targetType,
      'note': instance.note,
    };

GitlabEventNote _$GitlabEventNoteFromJson(Map<String, dynamic> json) {
  return GitlabEventNote()
    ..body = json['body'] as String
    ..noteableType = json['noteable_type'] as String
    ..noteableIid = json['noteable_iid'] as int;
}

Map<String, dynamic> _$GitlabEventNoteToJson(GitlabEventNote instance) =>
    <String, dynamic>{
      'body': instance.body,
      'noteable_type': instance.noteableType,
      'noteable_iid': instance.noteableIid,
    };

GitlabCommit _$GitlabCommitFromJson(Map<String, dynamic> json) {
  return GitlabCommit()
    ..id = json['id'] as String
    ..shortId = json['short_id'] as String
    ..title = json['title'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..authorName = json['author_name'] as String
    ..message = json['message'] as String;
}

Map<String, dynamic> _$GitlabCommitToJson(GitlabCommit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'short_id': instance.shortId,
      'title': instance.title,
      'created_at': instance.createdAt?.toIso8601String(),
      'author_name': instance.authorName,
      'message': instance.message,
    };

GitlabDiff _$GitlabDiffFromJson(Map<String, dynamic> json) {
  return GitlabDiff()
    ..diff = json['diff'] as String
    ..newPath = json['new_path'] as String
    ..oldPath = json['old_path'] as String;
}

Map<String, dynamic> _$GitlabDiffToJson(GitlabDiff instance) =>
    <String, dynamic>{
      'diff': instance.diff,
      'new_path': instance.newPath,
      'old_path': instance.oldPath,
    };

GitlabIssue _$GitlabIssueFromJson(Map<String, dynamic> json) {
  return GitlabIssue()
    ..title = json['title'] as String
    ..iid = json['iid'] as int
    ..projectId = json['project_id'] as int
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..userNotesCount = json['user_notes_count'] as int
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..labels = (json['labels'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$GitlabIssueToJson(GitlabIssue instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iid': instance.iid,
      'project_id': instance.projectId,
      'author': instance.author,
      'user_notes_count': instance.userNotesCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'labels': instance.labels,
    };

GitlabStarrer _$GitlabStarrerFromJson(Map<String, dynamic> json) {
  return GitlabStarrer()
    ..starredSince = json['starred_since'] == null
        ? null
        : DateTime.parse(json['starred_since'] as String)
    ..user = json['user'] == null
        ? null
        : GitlabUser.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GitlabStarrerToJson(GitlabStarrer instance) =>
    <String, dynamic>{
      'starred_since': instance.starredSince?.toIso8601String(),
      'user': instance.user,
    };

GitlabBranch _$GitlabBranchFromJson(Map<String, dynamic> json) {
  return GitlabBranch()
    ..name = json['name'] as String
    ..merged = json['merged'] as bool;
}

Map<String, dynamic> _$GitlabBranchToJson(GitlabBranch instance) =>
    <String, dynamic>{
      'name': instance.name,
      'merged': instance.merged,
    };
