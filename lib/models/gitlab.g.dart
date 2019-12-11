// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitlab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitlabUserProject _$GitlabUserProjectFromJson(Map<String, dynamic> json) {
  return GitlabUserProject()
    ..id = json['id'] as int
    ..owner = json['owner'] == null
        ? null
        : GitlabUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..starCount = json['star_count'] as int
    ..forksCount = json['forks_count'] as int
    ..visibility = json['visibility'] as String;
}

Map<String, dynamic> _$GitlabUserProjectToJson(GitlabUserProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'star_count': instance.starCount,
      'forks_count': instance.forksCount,
      'visibility': instance.visibility,
    };

GitlabUser _$GitlabUserFromJson(Map<String, dynamic> json) {
  return GitlabUser()
    ..id = json['id'] as int
    ..username = json['username'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GitlabUserToJson(GitlabUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
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
        : GitlabIssue.fromJson(json['target'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GitlabTodoToJson(GitlabTodo instance) =>
    <String, dynamic>{
      'author': instance.author,
      'project': instance.project,
      'action_name': instance.actionName,
      'target_type': instance.targetType,
      'target': instance.target,
    };

GitlabIssue _$GitlabIssueFromJson(Map<String, dynamic> json) {
  return GitlabIssue()
    ..iid = json['iid'] as int
    ..projectId = json['project_id'] as int
    ..title = json['title'] as String
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..description = json['description'] as String
    ..createdAt = json['created_at'] as String;
}

Map<String, dynamic> _$GitlabIssueToJson(GitlabIssue instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'project_id': instance.projectId,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

GitlabIssueNote _$GitlabIssueNoteFromJson(Map<String, dynamic> json) {
  return GitlabIssueNote()
    ..author = json['author'] == null
        ? null
        : GitlabUser.fromJson(json['author'] as Map<String, dynamic>)
    ..body = json['body'] as String;
}

Map<String, dynamic> _$GitlabIssueNoteToJson(GitlabIssueNote instance) =>
    <String, dynamic>{
      'author': instance.author,
      'body': instance.body,
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
    ..issuesEnabled = json['issues_enabled'] as bool
    ..openIssuesCount = json['open_issues_count'] as int
    ..mergeRequestsEnabled = json['merge_requests_enabled'] as bool;
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
      'issues_enabled': instance.issuesEnabled,
      'open_issues_count': instance.openIssuesCount,
      'merge_requests_enabled': instance.mergeRequestsEnabled,
    };

GitlabProjectNamespace _$GitlabProjectNamespaceFromJson(
    Map<String, dynamic> json) {
  return GitlabProjectNamespace()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GitlabProjectNamespaceToJson(
        GitlabProjectNamespace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GitlabTreeItem _$GitlabTreeItemFromJson(Map<String, dynamic> json) {
  return GitlabTreeItem()
    ..type = json['type'] as String
    ..path = json['path'] as String;
}

Map<String, dynamic> _$GitlabTreeItemToJson(GitlabTreeItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'path': instance.path,
    };

GitlabBlob _$GitlabBlobFromJson(Map<String, dynamic> json) {
  return GitlabBlob()..content = json['content'] as String;
}

Map<String, dynamic> _$GitlabBlobToJson(GitlabBlob instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
