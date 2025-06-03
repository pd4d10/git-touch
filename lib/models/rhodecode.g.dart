// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rhodecode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    GetUserResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = json['result'] == null
          ? null
          : RhodecodeUser.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhodecodeUser _$RhodecodeUserFromJson(Map<String, dynamic> json) =>
    RhodecodeUser()
      ..active = json['active'] as bool?
      ..username = json['username'] as String?
      ..userId = json['user_id'] as int?
      ..email = json['email'] as String?
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$RhodecodeUserToJson(RhodecodeUser instance) =>
    <String, dynamic>{
      'active': instance.active,
      'username': instance.username,
      'user_id': instance.userId,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'description': instance.description,
    };

RhRepoListResponse _$RhRepoListResponseFromJson(Map<String, dynamic> json) =>
    RhRepoListResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => RhRepo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RhRepoListResponseToJson(RhRepoListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhRepoResponse _$RhRepoResponseFromJson(Map<String, dynamic> json) =>
    RhRepoResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = json['result'] == null
          ? null
          : RhRepo.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$RhRepoResponseToJson(RhRepoResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhRepo _$RhRepoFromJson(Map<String, dynamic> json) => RhRepo()
  ..owner = json['owner'] as String?
  ..repoName = json['repo_name'] as String?
  ..url = json['url'] as String?
  ..private = json['private'] as bool?
  ..createdOn = json['created_on'] == null
      ? null
      : DateTime.parse(json['created_on'] as String)
  ..description = json['description'] as String?
  ..repoId = json['repo_id'] as int?
  ..forkOfId = json['fork_of_id'] as int?
  ..lastChangeset = json['last_changeset'] == null
      ? null
      : RhLastChangeset.fromJson(
          json['last_changeset'] as Map<String, dynamic>);

Map<String, dynamic> _$RhRepoToJson(RhRepo instance) => <String, dynamic>{
      'owner': instance.owner,
      'repo_name': instance.repoName,
      'url': instance.url,
      'private': instance.private,
      'created_on': instance.createdOn?.toIso8601String(),
      'description': instance.description,
      'repo_id': instance.repoId,
      'fork_of_id': instance.forkOfId,
    };

RhLastChangeset _$RhLastChangesetFromJson(Map<String, dynamic> json) =>
    RhLastChangeset()
      ..author = json['author'] as String?
      ..branch = json['branch'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..message = json['message'] as String?
      ..rawId = json['raw_id'] as String?
      ..repoCommitCount = json['repo_commit_count'] as int?
      ..revision = json['revision'] as int?
      ..shortId = json['short_id'] as String?;

Map<String, dynamic> _$RhLastChangesetToJson(RhLastChangeset instance) =>
    <String, dynamic>{
      'author': instance.author,
      'branch': instance.branch,
      'date': instance.date?.toIso8601String(),
      'message': instance.message,
      'raw_id': instance.rawId,
      'repo_commit_count': instance.repoCommitCount,
      'revision': instance.revision,
      'short_id': instance.shortId,
    };

RhRepoRefsResponse _$RhRepoRefsResponseFromJson(Map<String, dynamic> json) =>
    RhRepoRefsResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = json['result'] == null
          ? null
          : RhRepoRefs.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$RhRepoRefsResponseToJson(RhRepoRefsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhRepoRefs _$RhRepoRefsFromJson(Map<String, dynamic> json) => RhRepoRefs()
  ..branches = (json['branches'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  );

Map<String, dynamic> _$RhRepoRefsToJson(RhRepoRefs instance) =>
    <String, dynamic>{
      'branches': instance.branches,
    };

RhRepoNodesResponse _$RhRepoNodesResponseFromJson(Map<String, dynamic> json) =>
    RhRepoNodesResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => RhodecodeTreeItem.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RhRepoNodesResponseToJson(
        RhRepoNodesResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhodecodeTreeItem _$RhodecodeTreeItemFromJson(Map<String, dynamic> json) =>
    RhodecodeTreeItem(
      type: json['type'] as String,
      name: json['name'] as String,
    )
      ..binary = json['binary'] as bool?
      ..extension = json['extension'] as String?
      ..lines = json['lines'] as int?
      ..md5 = json['md5'] as String?
      ..mimetype = json['mimetype'] as String?
      ..size = json['size'] as int?;

Map<String, dynamic> _$RhodecodeTreeItemToJson(RhodecodeTreeItem instance) =>
    <String, dynamic>{
      'binary': instance.binary,
      'extension': instance.extension,
      'lines': instance.lines,
      'md5': instance.md5,
      'mimetype': instance.mimetype,
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
    };

RhCommitsResponse _$RhCommitsResponseFromJson(Map<String, dynamic> json) =>
    RhCommitsResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => RhodecodeCommit.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RhCommitsResponseToJson(RhCommitsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhodecodeCommit _$RhodecodeCommitFromJson(Map<String, dynamic> json) =>
    RhodecodeCommit(
      author: json['author'] as String,
      branch: json['branch'] as String?,
      rawId: json['raw_id'] as String,
      revision: json['revision'] as int,
      shortId: json['short_id'] as String,
    )
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..message = json['message'] as String?;

Map<String, dynamic> _$RhodecodeCommitToJson(RhodecodeCommit instance) =>
    <String, dynamic>{
      'author': instance.author,
      'branch': instance.branch,
      'date': instance.date?.toIso8601String(),
      'message': instance.message,
      'raw_id': instance.rawId,
      'revision': instance.revision,
      'short_id': instance.shortId,
    };

RhChangesetResponse _$RhChangesetResponseFromJson(Map<String, dynamic> json) =>
    RhChangesetResponse()
      ..error = json['error'] as String?
      ..id = json['id'] as int?
      ..result = json['result'] == null
          ? null
          : RhodecodeChangeset.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$RhChangesetResponseToJson(
        RhChangesetResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'result': instance.result,
    };

RhodecodeStats _$RhodecodeStatsFromJson(Map<String, dynamic> json) =>
    RhodecodeStats()
      ..added = json['added'] as int?
      ..binary = json['binary'] as bool?
      ..deleted = json['deleted'] as int?
      ..newMode = json['new_mode'] as String?
      ..oldMode = json['old_mode'] as String?;

Map<String, dynamic> _$RhodecodeStatsToJson(RhodecodeStats instance) =>
    <String, dynamic>{
      'added': instance.added,
      'binary': instance.binary,
      'deleted': instance.deleted,
      'new_mode': instance.newMode,
      'old_mode': instance.oldMode,
    };

RhodecodeDiff _$RhodecodeDiffFromJson(Map<String, dynamic> json) =>
    RhodecodeDiff()
      ..filename = json['filename'] as String?
      ..newRevision = json['new_revision'] as String?
      ..oldRevision = json['old_revision'] as String?
      ..op = json['op'] as String?
      ..rawDiff = json['raw_diff'] as String?
      ..stats = json['stats'] == null
          ? null
          : RhodecodeStats.fromJson(json['stats'] as Map<String, dynamic>);

Map<String, dynamic> _$RhodecodeDiffToJson(RhodecodeDiff instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'new_revision': instance.newRevision,
      'old_revision': instance.oldRevision,
      'op': instance.op,
      'raw_diff': instance.rawDiff,
      'stats': instance.stats,
    };

RhodecodeChangeset _$RhodecodeChangesetFromJson(Map<String, dynamic> json) =>
    RhodecodeChangeset()
      ..author = json['author'] as String?
      ..branch = json['branch'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..diff = (json['diff'] as List<dynamic>?)
          ?.map((e) => RhodecodeDiff.fromJson(e as Map<String, dynamic>))
          .toList()
      ..message = json['message'] as String?
      ..rawId = json['raw_id'] as String?
      ..revision = json['revision'] as int?
      ..shortId = json['short_id'] as String?;

Map<String, dynamic> _$RhodecodeChangesetToJson(RhodecodeChangeset instance) =>
    <String, dynamic>{
      'author': instance.author,
      'branch': instance.branch,
      'date': instance.date?.toIso8601String(),
      'diff': instance.diff,
      'message': instance.message,
      'raw_id': instance.rawId,
      'revision': instance.revision,
      'short_id': instance.shortId,
    };
