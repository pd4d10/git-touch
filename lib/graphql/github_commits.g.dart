// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_commits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubCommits _$GithubCommitsFromJson(Map<String, dynamic> json) {
  return GithubCommits()
    ..repository = json['repository'] == null
        ? null
        : GithubCommitsRepository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubCommitsToJson(GithubCommits instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

GithubCommitsRepository _$GithubCommitsRepositoryFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsRepository()
    ..defaultBranchRef = json['defaultBranchRef'] == null
        ? null
        : GithubCommitsRef.fromJson(
            json['defaultBranchRef'] as Map<String, dynamic>)
    ..ref = json['ref'] == null
        ? null
        : GithubCommitsRef.fromJson(json['ref'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRepositoryToJson(
        GithubCommitsRepository instance) =>
    <String, dynamic>{
      'defaultBranchRef': instance.defaultBranchRef?.toJson(),
      'ref': instance.ref?.toJson(),
      '__typename': instance.resolveType,
    };

GithubCommitsRef _$GithubCommitsRefFromJson(Map<String, dynamic> json) {
  return GithubCommitsRef()
    ..target = json['target'] == null
        ? null
        : GithubCommitsGitObject.fromJson(
            json['target'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRefToJson(GithubCommitsRef instance) =>
    <String, dynamic>{
      'target': instance.target?.toJson(),
      '__typename': instance.resolveType,
    };

GithubCommitsGitObject _$GithubCommitsGitObjectFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsGitObject()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsGitObjectToJson(
        GithubCommitsGitObject instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsCommit _$GithubCommitsCommitFromJson(Map<String, dynamic> json) {
  return GithubCommitsCommit()
    ..oid = json['oid'] as String
    ..url = json['url'] as String
    ..messageHeadline = json['messageHeadline'] as String
    ..committedDate = json['committedDate'] == null
        ? null
        : DateTime.parse(json['committedDate'] as String)
    ..author = json['author'] == null
        ? null
        : GithubCommitsGitActor.fromJson(json['author'] as Map<String, dynamic>)
    ..status = json['status'] == null
        ? null
        : GithubCommitsStatus.fromJson(json['status'] as Map<String, dynamic>)
    ..history = json['history'] == null
        ? null
        : GithubCommitsCommitHistoryConnection.fromJson(
            json['history'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsCommitToJson(
        GithubCommitsCommit instance) =>
    <String, dynamic>{
      'oid': instance.oid,
      'url': instance.url,
      'messageHeadline': instance.messageHeadline,
      'committedDate': instance.committedDate?.toIso8601String(),
      'author': instance.author?.toJson(),
      'status': instance.status?.toJson(),
      'history': instance.history?.toJson(),
      '__typename': instance.resolveType,
    };

GithubCommitsGitActor _$GithubCommitsGitActorFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsGitActor()
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..user = json['user'] == null
        ? null
        : GithubCommitsUser.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubCommitsGitActorToJson(
        GithubCommitsGitActor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'user': instance.user?.toJson(),
    };

GithubCommitsUser _$GithubCommitsUserFromJson(Map<String, dynamic> json) {
  return GithubCommitsUser()
    ..login = json['login'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsUserToJson(GithubCommitsUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      '__typename': instance.resolveType,
    };

GithubCommitsAuditEntryActor _$GithubCommitsAuditEntryActorFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsAuditEntryActor();
}

Map<String, dynamic> _$GithubCommitsAuditEntryActorToJson(
        GithubCommitsAuditEntryActor instance) =>
    <String, dynamic>{};

GithubCommitsNode _$GithubCommitsNodeFromJson(Map<String, dynamic> json) {
  return GithubCommitsNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsNodeToJson(GithubCommitsNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsActor _$GithubCommitsActorFromJson(Map<String, dynamic> json) {
  return GithubCommitsActor()
    ..login = json['login'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsActorToJson(GithubCommitsActor instance) =>
    <String, dynamic>{
      'login': instance.login,
      '__typename': instance.resolveType,
    };

GithubCommitsRegistryPackageOwner _$GithubCommitsRegistryPackageOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRegistryPackageOwnerToJson(
        GithubCommitsRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsRegistryPackageSearch _$GithubCommitsRegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRegistryPackageSearchToJson(
        GithubCommitsRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsProjectOwner _$GithubCommitsProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsProjectOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsProjectOwnerToJson(
        GithubCommitsProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsRepositoryOwner _$GithubCommitsRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsRepositoryOwner()
    ..login = json['login'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRepositoryOwnerToJson(
        GithubCommitsRepositoryOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      '__typename': instance.resolveType,
    };

GithubCommitsUniformResourceLocatable
    _$GithubCommitsUniformResourceLocatableFromJson(Map<String, dynamic> json) {
  return GithubCommitsUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsUniformResourceLocatableToJson(
        GithubCommitsUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsProfileOwner _$GithubCommitsProfileOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsProfileOwner()
    ..login = json['login'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsProfileOwnerToJson(
        GithubCommitsProfileOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      '__typename': instance.resolveType,
    };

GithubCommitsSponsorable _$GithubCommitsSponsorableFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsSponsorable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsSponsorableToJson(
        GithubCommitsSponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsStatus _$GithubCommitsStatusFromJson(Map<String, dynamic> json) {
  return GithubCommitsStatus()
    ..state =
        _$enumDecodeNullable(_$GithubCommitsStatusStateEnumMap, json['state'])
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsStatusToJson(
        GithubCommitsStatus instance) =>
    <String, dynamic>{
      'state': _$GithubCommitsStatusStateEnumMap[instance.state],
      '__typename': instance.resolveType,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GithubCommitsStatusStateEnumMap = {
  GithubCommitsStatusState.EXPECTED: 'EXPECTED',
  GithubCommitsStatusState.ERROR: 'ERROR',
  GithubCommitsStatusState.FAILURE: 'FAILURE',
  GithubCommitsStatusState.PENDING: 'PENDING',
  GithubCommitsStatusState.SUCCESS: 'SUCCESS',
};

GithubCommitsCommitHistoryConnection
    _$GithubCommitsCommitHistoryConnectionFromJson(Map<String, dynamic> json) {
  return GithubCommitsCommitHistoryConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubCommitsPageInfo.fromJson(
            json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubCommitsCommit.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubCommitsCommitHistoryConnectionToJson(
        GithubCommitsCommitHistoryConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubCommitsPageInfo _$GithubCommitsPageInfoFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsPageInfo()
    ..hasNextPage = json['hasNextPage'] as bool
    ..endCursor = json['endCursor'] as String;
}

Map<String, dynamic> _$GithubCommitsPageInfoToJson(
        GithubCommitsPageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'endCursor': instance.endCursor,
    };

GithubCommitsPullRequestTimelineItem
    _$GithubCommitsPullRequestTimelineItemFromJson(Map<String, dynamic> json) {
  return GithubCommitsPullRequestTimelineItem();
}

Map<String, dynamic> _$GithubCommitsPullRequestTimelineItemToJson(
        GithubCommitsPullRequestTimelineItem instance) =>
    <String, dynamic>{};

GithubCommitsSubscribable _$GithubCommitsSubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsSubscribable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsSubscribableToJson(
        GithubCommitsSubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsPinnableItem _$GithubCommitsPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsPinnableItem();
}

Map<String, dynamic> _$GithubCommitsPinnableItemToJson(
        GithubCommitsPinnableItem instance) =>
    <String, dynamic>{};

GithubCommitsStarrable _$GithubCommitsStarrableFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsStarrable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsStarrableToJson(
        GithubCommitsStarrable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsRepositoryInfo _$GithubCommitsRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsRepositoryInfo()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubCommitsRepositoryInfoToJson(
        GithubCommitsRepositoryInfo instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubCommitsArguments _$GithubCommitsArgumentsFromJson(
    Map<String, dynamic> json) {
  return GithubCommitsArguments(
    owner: json['owner'] as String,
    name: json['name'] as String,
    ref: json['ref'] as String,
    hasRef: json['hasRef'] as bool,
    after: json['after'] as String,
  );
}

Map<String, dynamic> _$GithubCommitsArgumentsToJson(
        GithubCommitsArguments instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'ref': instance.ref,
      'hasRef': instance.hasRef,
      'after': instance.after,
    };
