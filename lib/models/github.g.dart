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
    ..forkee = json['forkee'] as Map<String, dynamic>
    ..pages = (json['pages'] as List)
        ?.map((e) => e == null
            ? null
            : GithubPagesItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..securityAdvisory = json['security_advisory'] == null
        ? null
        : GithubSecurityItem.fromJson(
            json['security_advisory'] as Map<String, dynamic>)
    ..alert = json['alert'] == null
        ? null
        : GithubAlertItem.fromJson(json['alert'] as Map<String, dynamic>)
    ..project = json['project'] == null
        ? null
        : GithubProjectItem.fromJson(json['project'] as Map<String, dynamic>)
    ..projectColumn = json['project_column'] == null
        ? null
        : GithubProjectColumnItem.fromJson(
            json['project_column'] as Map<String, dynamic>)
    ..installation = json['installation'] == null
        ? null
        : GithubInstallationRepositoriesItem.fromJson(
            json['installation'] as Map<String, dynamic>)
    ..checkRun = json['check_run'] == null
        ? null
        : GithubCheckrunItem.fromJson(json['check_run'] as Map<String, dynamic>)
    ..checkSuite = json['check_suite'] == null
        ? null
        : GithubCheckSuiteItem.fromJson(
            json['check_suite'] as Map<String, dynamic>)
    ..contentReference = json['content_reference'] == null
        ? null
        : GithubContentReferenceItem.fromJson(
            json['content_reference'] as Map<String, dynamic>);
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
      'pages': instance.pages,
      'security_advisory': instance.securityAdvisory,
      'alert': instance.alert,
      'project': instance.project,
      'project_column': instance.projectColumn,
      'installation': instance.installation,
      'check_run': instance.checkRun,
      'check_suite': instance.checkSuite,
      'content_reference': instance.contentReference,
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
        : GithubEventUser.fromJson(json['user'] as Map<String, dynamic>)
    ..commitId = json['commit_id'] as String
    ..htmlUrl = json['html_url'] as String;
}

Map<String, dynamic> _$GithubEventCommentToJson(GithubEventComment instance) =>
    <String, dynamic>{
      'body': instance.body,
      'user': instance.user,
      'commit_id': instance.commitId,
      'html_url': instance.htmlUrl,
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

GithubPagesItem _$GithubPagesItemFromJson(Map<String, dynamic> json) {
  return GithubPagesItem()
    ..pageName = json['page_name'] as String
    ..title = json['title'] as String
    ..action = json['action'] as String;
}

Map<String, dynamic> _$GithubPagesItemToJson(GithubPagesItem instance) =>
    <String, dynamic>{
      'page_name': instance.pageName,
      'title': instance.title,
      'action': instance.action,
    };

GithubSecurityItem _$GithubSecurityItemFromJson(Map<String, dynamic> json) {
  return GithubSecurityItem()
    ..summary = json['summary'] as String
    ..description = json['description'] as String
    ..severity = json['severity'] as String;
}

Map<String, dynamic> _$GithubSecurityItemToJson(GithubSecurityItem instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'severity': instance.severity,
    };

GithubAlertItem _$GithubAlertItemFromJson(Map<String, dynamic> json) {
  return GithubAlertItem()
    ..affectedPackageName = json['affected_package_name'] as String
    ..affectedRange = json['affected_range'] as String;
}

Map<String, dynamic> _$GithubAlertItemToJson(GithubAlertItem instance) =>
    <String, dynamic>{
      'affected_package_name': instance.affectedPackageName,
      'affected_range': instance.affectedRange,
    };

GithubProjectItem _$GithubProjectItemFromJson(Map<String, dynamic> json) {
  return GithubProjectItem()
    ..name = json['name'] as String
    ..state = json['state'] as String
    ..body = json['body'] as String
    ..htmlUrl = json['html_url'] as String;
}

Map<String, dynamic> _$GithubProjectItemToJson(GithubProjectItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': instance.state,
      'body': instance.body,
      'html_url': instance.htmlUrl,
    };

GithubProjectColumnItem _$GithubProjectColumnItemFromJson(
    Map<String, dynamic> json) {
  return GithubProjectColumnItem()
    ..htmlUrl = json['html_url'] as String
    ..columnsUrl = json['columns_url'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GithubProjectColumnItemToJson(
        GithubProjectColumnItem instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'columns_url': instance.columnsUrl,
      'name': instance.name,
    };

GithubInstallationRepositoriesItem _$GithubInstallationRepositoriesItemFromJson(
    Map<String, dynamic> json) {
  return GithubInstallationRepositoriesItem()
    ..repositoriesAdded = (json['repositories_added'] as List)
        ?.map((e) => e == null
            ? null
            : GithubNotificationItemRepo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..repositoriesRemoved = (json['repositories_removed'] as List)
        ?.map((e) => e == null
            ? null
            : GithubNotificationItemRepo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..repositoriesSelection = json['repositories_selection'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$GithubInstallationRepositoriesItemToJson(
        GithubInstallationRepositoriesItem instance) =>
    <String, dynamic>{
      'repositories_added': instance.repositoriesAdded,
      'repositories_removed': instance.repositoriesRemoved,
      'repositories_selection': instance.repositoriesSelection,
      'id': instance.id,
    };

GithubCheckrunItem _$GithubCheckrunItemFromJson(Map<String, dynamic> json) {
  return GithubCheckrunItem()
    ..status = json['status'] as String
    ..name = json['name'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$GithubCheckrunItemToJson(GithubCheckrunItem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'id': instance.id,
    };

GithubCheckSuiteItem _$GithubCheckSuiteItemFromJson(Map<String, dynamic> json) {
  return GithubCheckSuiteItem()
    ..status = json['status'] as String
    ..conclusion = json['conclusion'] as String;
}

Map<String, dynamic> _$GithubCheckSuiteItemToJson(
        GithubCheckSuiteItem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'conclusion': instance.conclusion,
    };

GithubContentReferenceItem _$GithubContentReferenceItemFromJson(
    Map<String, dynamic> json) {
  return GithubContentReferenceItem()
    ..id = json['id'] as int
    ..reference = json['reference'] as String;
}

Map<String, dynamic> _$GithubContentReferenceItemToJson(
        GithubContentReferenceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
    };

GithubContributorItem _$GithubContributorItemFromJson(
    Map<String, dynamic> json) {
  return GithubContributorItem()
    ..id = json['id'] as int
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..htmlUrl = json['html_url'] as String
    ..contributions = json['contributions'] as int;
}

Map<String, dynamic> _$GithubContributorItemToJson(
        GithubContributorItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'contributions': instance.contributions,
    };

GithubUserOrganizationItem _$GithubUserOrganizationItemFromJson(
    Map<String, dynamic> json) {
  return GithubUserOrganizationItem()
    ..id = json['id'] as int
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..description = json['description'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$GithubUserOrganizationItemToJson(
        GithubUserOrganizationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'url': instance.url,
    };

GistFiles _$GistFilesFromJson(Map<String, dynamic> json) {
  return GistFiles(
    filename: json['filename'] as String,
    size: json['size'] as int,
    rawUrl: json['raw_url'] as String,
    type: json['type'] as String,
    language: json['language'] as String,
    truncated: json['truncated'] as bool,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$GistFilesToJson(GistFiles instance) => <String, dynamic>{
      'filename': instance.filename,
      'size': instance.size,
      'raw_url': instance.rawUrl,
      'type': instance.type,
      'language': instance.language,
      'truncated': instance.truncated,
      'content': instance.content,
    };

GithubGistsItem _$GithubGistsItemFromJson(Map<String, dynamic> json) {
  return GithubGistsItem()
    ..id = json['id'] as String
    ..description = json['description'] as String
    ..public = json['public'] as bool
    ..files = (json['files'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : GistFiles.fromJson(e as Map<String, dynamic>)),
    )
    ..owner = json['owner'] == null
        ? null
        : GithubEventUser.fromJson(json['owner'] as Map<String, dynamic>)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$GithubGistsItemToJson(GithubGistsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'public': instance.public,
      'files': instance.files,
      'owner': instance.owner,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

GithubFilesItem _$GithubFilesItemFromJson(Map<String, dynamic> json) {
  return GithubFilesItem()
    ..filename = json['filename'] as String
    ..status = json['status'] as String
    ..additions = json['additions'] as int
    ..deletions = json['deletions'] as int
    ..changes = json['changes'] as int
    ..patch = json['patch'] as String;
}

Map<String, dynamic> _$GithubFilesItemToJson(GithubFilesItem instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'status': instance.status,
      'additions': instance.additions,
      'deletions': instance.deletions,
      'changes': instance.changes,
      'patch': instance.patch,
    };

GithubComparisonItem _$GithubComparisonItemFromJson(Map<String, dynamic> json) {
  return GithubComparisonItem()
    ..files = (json['files'] as List)
        ?.map((e) => e == null
            ? null
            : GithubFilesItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..status = json['status'] as String
    ..aheadBy = json['ahead_by'] as int
    ..behindBy = json['behind_by'] as int;
}

Map<String, dynamic> _$GithubComparisonItemToJson(
        GithubComparisonItem instance) =>
    <String, dynamic>{
      'files': instance.files,
      'status': instance.status,
      'ahead_by': instance.aheadBy,
      'behind_by': instance.behindBy,
    };
