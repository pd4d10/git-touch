// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepository _$GithubRepositoryFromJson(Map<String, dynamic> json) {
  return GithubRepository()
    ..repository = json['repository'] == null
        ? null
        : GithubRepositoryRepository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubRepositoryToJson(GithubRepository instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

GithubRepositoryRepository _$GithubRepositoryRepositoryFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryRepository()
    ..owner = json['owner'] == null
        ? null
        : GithubRepositoryRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..homepageUrl = json['homepageUrl'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubRepositoryStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..forks = json['forks'] == null
        ? null
        : GithubRepositoryRepositoryConnection.fromJson(
            json['forks'] as Map<String, dynamic>)
    ..primaryLanguage = json['primaryLanguage'] == null
        ? null
        : GithubRepositoryLanguage.fromJson(
            json['primaryLanguage'] as Map<String, dynamic>)
    ..id = json['id'] as String
    ..diskUsage = json['diskUsage'] as int
    ..hasIssuesEnabled = json['hasIssuesEnabled'] as bool
    ..url = json['url'] as String
    ..viewerHasStarred = json['viewerHasStarred'] as bool
    ..projectsResourcePath = json['projectsResourcePath'] as String
    ..watchers = json['watchers'] == null
        ? null
        : GithubRepositoryUserConnection.fromJson(
            json['watchers'] as Map<String, dynamic>)
    ..issues = json['issues'] == null
        ? null
        : GithubRepositoryIssueConnection.fromJson(
            json['issues'] as Map<String, dynamic>)
    ..pullRequests = json['pullRequests'] == null
        ? null
        : GithubRepositoryPullRequestConnection.fromJson(
            json['pullRequests'] as Map<String, dynamic>)
    ..projects = json['projects'] == null
        ? null
        : GithubRepositoryProjectConnection.fromJson(json['projects'] as Map<String, dynamic>)
    ..releases = json['releases'] == null ? null : GithubRepositoryReleaseConnection.fromJson(json['releases'] as Map<String, dynamic>)
    ..languages = json['languages'] == null ? null : GithubRepositoryLanguageConnection.fromJson(json['languages'] as Map<String, dynamic>)
    ..defaultBranchRef = json['defaultBranchRef'] == null ? null : GithubRepositoryRef.fromJson(json['defaultBranchRef'] as Map<String, dynamic>)
    ..ref = json['ref'] == null ? null : GithubRepositoryRef.fromJson(json['ref'] as Map<String, dynamic>)
    ..refs = json['refs'] == null ? null : GithubRepositoryRefConnection.fromJson(json['refs'] as Map<String, dynamic>)
    ..licenseInfo = json['licenseInfo'] == null ? null : GithubRepositoryLicense.fromJson(json['licenseInfo'] as Map<String, dynamic>)
    ..repositoryTopics = json['repositoryTopics'] == null ? null : GithubRepositoryRepositoryTopicConnection.fromJson(json['repositoryTopics'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRepositoryToJson(
        GithubRepositoryRepository instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'homepageUrl': instance.homepageUrl,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      'stargazers': instance.stargazers?.toJson(),
      'forks': instance.forks?.toJson(),
      'primaryLanguage': instance.primaryLanguage?.toJson(),
      'id': instance.id,
      'diskUsage': instance.diskUsage,
      'hasIssuesEnabled': instance.hasIssuesEnabled,
      'url': instance.url,
      'viewerHasStarred': instance.viewerHasStarred,
      'projectsResourcePath': instance.projectsResourcePath,
      'watchers': instance.watchers?.toJson(),
      'issues': instance.issues?.toJson(),
      'pullRequests': instance.pullRequests?.toJson(),
      'projects': instance.projects?.toJson(),
      'releases': instance.releases?.toJson(),
      'languages': instance.languages?.toJson(),
      'defaultBranchRef': instance.defaultBranchRef?.toJson(),
      'ref': instance.ref?.toJson(),
      'refs': instance.refs?.toJson(),
      'licenseInfo': instance.licenseInfo?.toJson(),
      'repositoryTopics': instance.repositoryTopics?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryRepositoryOwner _$GithubRepositoryRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryRepositoryOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRepositoryOwnerToJson(
        GithubRepositoryRepositoryOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      '__typename': instance.resolveType,
    };

GithubRepositoryStargazerConnection
    _$GithubRepositoryStargazerConnectionFromJson(Map<String, dynamic> json) {
  return GithubRepositoryStargazerConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryStargazerConnectionToJson(
        GithubRepositoryStargazerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryRepositoryConnection
    _$GithubRepositoryRepositoryConnectionFromJson(Map<String, dynamic> json) {
  return GithubRepositoryRepositoryConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryRepositoryConnectionToJson(
        GithubRepositoryRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryLanguage _$GithubRepositoryLanguageFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryLanguage()
    ..color = json['color'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryLanguageToJson(
        GithubRepositoryLanguage instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

GithubRepositoryNode _$GithubRepositoryNodeFromJson(Map<String, dynamic> json) {
  return GithubRepositoryNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryNodeToJson(
        GithubRepositoryNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoryUserConnection _$GithubRepositoryUserConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryUserConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryUserConnectionToJson(
        GithubRepositoryUserConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryIssueConnection _$GithubRepositoryIssueConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryIssueConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryIssueConnectionToJson(
        GithubRepositoryIssueConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryPullRequestConnection
    _$GithubRepositoryPullRequestConnectionFromJson(Map<String, dynamic> json) {
  return GithubRepositoryPullRequestConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryPullRequestConnectionToJson(
        GithubRepositoryPullRequestConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryProjectConnection _$GithubRepositoryProjectConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryProjectConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryProjectConnectionToJson(
        GithubRepositoryProjectConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryReleaseConnection _$GithubRepositoryReleaseConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryReleaseConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryReleaseConnectionToJson(
        GithubRepositoryReleaseConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryLanguageConnection _$GithubRepositoryLanguageConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryLanguageConnection()
    ..totalSize = json['totalSize'] as int
    ..edges = (json['edges'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoryLanguageEdge.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoryLanguageConnectionToJson(
        GithubRepositoryLanguageConnection instance) =>
    <String, dynamic>{
      'totalSize': instance.totalSize,
      'edges': instance.edges?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoryLanguageEdge _$GithubRepositoryLanguageEdgeFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryLanguageEdge()
    ..size = json['size'] as int
    ..node = json['node'] == null
        ? null
        : GithubRepositoryLanguage.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubRepositoryLanguageEdgeToJson(
        GithubRepositoryLanguageEdge instance) =>
    <String, dynamic>{
      'size': instance.size,
      'node': instance.node?.toJson(),
    };

GithubRepositoryRef _$GithubRepositoryRefFromJson(Map<String, dynamic> json) {
  return GithubRepositoryRef()
    ..name = json['name'] as String
    ..target = json['target'] == null
        ? null
        : GithubRepositoryGitObject.fromJson(
            json['target'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRefToJson(
        GithubRepositoryRef instance) =>
    <String, dynamic>{
      'name': instance.name,
      'target': instance.target?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryGitObject _$GithubRepositoryGitObjectFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryGitObject()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryGitObjectToJson(
        GithubRepositoryGitObject instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoryCommit _$GithubRepositoryCommitFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryCommit()
    ..history = json['history'] == null
        ? null
        : GithubRepositoryCommitHistoryConnection.fromJson(
            json['history'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryCommitToJson(
        GithubRepositoryCommit instance) =>
    <String, dynamic>{
      'history': instance.history?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryCommitHistoryConnection
    _$GithubRepositoryCommitHistoryConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoryCommitHistoryConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoryCommitHistoryConnectionToJson(
        GithubRepositoryCommitHistoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoryPullRequestTimelineItem
    _$GithubRepositoryPullRequestTimelineItemFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoryPullRequestTimelineItem();
}

Map<String, dynamic> _$GithubRepositoryPullRequestTimelineItemToJson(
        GithubRepositoryPullRequestTimelineItem instance) =>
    <String, dynamic>{};

GithubRepositorySubscribable _$GithubRepositorySubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositorySubscribable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositorySubscribableToJson(
        GithubRepositorySubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoryUniformResourceLocatable
    _$GithubRepositoryUniformResourceLocatableFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoryUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryUniformResourceLocatableToJson(
        GithubRepositoryUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoryRefConnection _$GithubRepositoryRefConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryRefConnection()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoryRef.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoryRefConnectionToJson(
        GithubRepositoryRefConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoryLicense _$GithubRepositoryLicenseFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryLicense()
    ..name = json['name'] as String
    ..spdxId = json['spdxId'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryLicenseToJson(
        GithubRepositoryLicense instance) =>
    <String, dynamic>{
      'name': instance.name,
      'spdxId': instance.spdxId,
      '__typename': instance.resolveType,
    };

GithubRepositoryRepositoryTopicConnection
    _$GithubRepositoryRepositoryTopicConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoryRepositoryTopicConnection()
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoryRepositoryTopic.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoryRepositoryTopicConnectionToJson(
        GithubRepositoryRepositoryTopicConnection instance) =>
    <String, dynamic>{
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoryRepositoryTopic _$GithubRepositoryRepositoryTopicFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryRepositoryTopic()
    ..url = json['url'] as String
    ..topic = json['topic'] == null
        ? null
        : GithubRepositoryTopic.fromJson(json['topic'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRepositoryTopicToJson(
        GithubRepositoryRepositoryTopic instance) =>
    <String, dynamic>{
      'url': instance.url,
      'topic': instance.topic?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryTopic _$GithubRepositoryTopicFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryTopic()
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryTopicToJson(
        GithubRepositoryTopic instance) =>
    <String, dynamic>{
      'name': instance.name,
      '__typename': instance.resolveType,
    };

GithubRepositoryStarrable _$GithubRepositoryStarrableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryStarrable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryStarrableToJson(
        GithubRepositoryStarrable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoryPinnableItem _$GithubRepositoryPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryPinnableItem();
}

Map<String, dynamic> _$GithubRepositoryPinnableItemToJson(
        GithubRepositoryPinnableItem instance) =>
    <String, dynamic>{};

GithubRepositoryProjectOwner _$GithubRepositoryProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryProjectOwner()
    ..id = json['id'] as String
    ..projectsResourcePath = json['projectsResourcePath'] as String
    ..projects = json['projects'] == null
        ? null
        : GithubRepositoryProjectConnection.fromJson(
            json['projects'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryProjectOwnerToJson(
        GithubRepositoryProjectOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectsResourcePath': instance.projectsResourcePath,
      'projects': instance.projects?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryRegistryPackageOwner
    _$GithubRepositoryRegistryPackageOwnerFromJson(Map<String, dynamic> json) {
  return GithubRepositoryRegistryPackageOwner()
    ..id = json['id'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRegistryPackageOwnerToJson(
        GithubRepositoryRegistryPackageOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      '__typename': instance.resolveType,
    };

GithubRepositoryRegistryPackageSearch
    _$GithubRepositoryRegistryPackageSearchFromJson(Map<String, dynamic> json) {
  return GithubRepositoryRegistryPackageSearch()
    ..id = json['id'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRegistryPackageSearchToJson(
        GithubRepositoryRegistryPackageSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      '__typename': instance.resolveType,
    };

GithubRepositoryRepositoryInfo _$GithubRepositoryRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryRepositoryInfo()
    ..owner = json['owner'] == null
        ? null
        : GithubRepositoryRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..homepageUrl = json['homepageUrl'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..hasIssuesEnabled = json['hasIssuesEnabled'] as bool
    ..url = json['url'] as String
    ..licenseInfo = json['licenseInfo'] == null
        ? null
        : GithubRepositoryLicense.fromJson(
            json['licenseInfo'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoryRepositoryInfoToJson(
        GithubRepositoryRepositoryInfo instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'homepageUrl': instance.homepageUrl,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      'hasIssuesEnabled': instance.hasIssuesEnabled,
      'url': instance.url,
      'licenseInfo': instance.licenseInfo?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoryArguments _$GithubRepositoryArgumentsFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryArguments(
    owner: json['owner'] as String,
    name: json['name'] as String,
    branchSpecified: json['branchSpecified'] as bool,
    branch: json['branch'] as String,
  );
}

Map<String, dynamic> _$GithubRepositoryArgumentsToJson(
        GithubRepositoryArguments instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'branchSpecified': instance.branchSpecified,
      'branch': instance.branch,
    };
