// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repositories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositories _$GithubRepositoriesFromJson(Map<String, dynamic> json) {
  return GithubRepositories()
    ..repositoryOwner = json['repositoryOwner'] == null
        ? null
        : GithubRepositoriesRepositoryOwner.fromJson(
            json['repositoryOwner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubRepositoriesToJson(GithubRepositories instance) =>
    <String, dynamic>{
      'repositoryOwner': instance.repositoryOwner?.toJson(),
    };

GithubRepositoriesRepositoryOwner _$GithubRepositoriesRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesRepositoryOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesRepositoryOwnerToJson(
        GithubRepositoriesRepositoryOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      '__typename': instance.resolveType,
    };

GithubRepositoriesUser _$GithubRepositoriesUserFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesUser()
    ..repositories = json['repositories'] == null
        ? null
        : GithubRepositoriesRepositoryConnection.fromJson(
            json['repositories'] as Map<String, dynamic>)
    ..starredRepositories = json['starredRepositories'] == null
        ? null
        : GithubRepositoriesStarredRepositoryConnection.fromJson(
            json['starredRepositories'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String;
}

Map<String, dynamic> _$GithubRepositoriesUserToJson(
        GithubRepositoriesUser instance) =>
    <String, dynamic>{
      'repositories': instance.repositories?.toJson(),
      'starredRepositories': instance.starredRepositories?.toJson(),
      '__typename': instance.resolveType,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
    };

GithubRepositoriesRepositoryConnection
    _$GithubRepositoriesRepositoryConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesRepositoryConnection()
    ..totalCount = json['totalCount'] as int
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubRepositoriesPageInfo.fromJson(
            json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoriesRepository.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoriesRepositoryConnectionToJson(
        GithubRepositoriesRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoriesPageInfo _$GithubRepositoriesPageInfoFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesPageInfo()
    ..hasNextPage = json['hasNextPage'] as bool
    ..endCursor = json['endCursor'] as String;
}

Map<String, dynamic> _$GithubRepositoriesPageInfoToJson(
        GithubRepositoriesPageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'endCursor': instance.endCursor,
    };

GithubRepositoriesRepository _$GithubRepositoriesRepositoryFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesRepository()
    ..owner = json['owner'] == null
        ? null
        : GithubRepositoriesRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubRepositoriesStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..forks = json['forks'] == null
        ? null
        : GithubRepositoriesRepositoryConnection.fromJson(
            json['forks'] as Map<String, dynamic>)
    ..primaryLanguage = json['primaryLanguage'] == null
        ? null
        : GithubRepositoriesLanguage.fromJson(
            json['primaryLanguage'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesRepositoryToJson(
        GithubRepositoriesRepository instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      'stargazers': instance.stargazers?.toJson(),
      'forks': instance.forks?.toJson(),
      'primaryLanguage': instance.primaryLanguage?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoriesStargazerConnection
    _$GithubRepositoriesStargazerConnectionFromJson(Map<String, dynamic> json) {
  return GithubRepositoriesStargazerConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubRepositoriesStargazerConnectionToJson(
        GithubRepositoriesStargazerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubRepositoriesLanguage _$GithubRepositoriesLanguageFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesLanguage()
    ..color = json['color'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesLanguageToJson(
        GithubRepositoriesLanguage instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

GithubRepositoriesNode _$GithubRepositoriesNodeFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesNodeToJson(
        GithubRepositoriesNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesPinnableItem _$GithubRepositoriesPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesPinnableItem();
}

Map<String, dynamic> _$GithubRepositoriesPinnableItemToJson(
        GithubRepositoriesPinnableItem instance) =>
    <String, dynamic>{};

GithubRepositoriesProjectOwner _$GithubRepositoriesProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesProjectOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesProjectOwnerToJson(
        GithubRepositoriesProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesRegistryPackageOwner
    _$GithubRepositoriesRegistryPackageOwnerFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesRegistryPackageOwnerToJson(
        GithubRepositoriesRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesRegistryPackageSearch
    _$GithubRepositoriesRegistryPackageSearchFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesRegistryPackageSearchToJson(
        GithubRepositoriesRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesSubscribable _$GithubRepositoriesSubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesSubscribable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesSubscribableToJson(
        GithubRepositoriesSubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesStarrable _$GithubRepositoriesStarrableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesStarrable()
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubRepositoriesStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesStarrableToJson(
        GithubRepositoriesStarrable instance) =>
    <String, dynamic>{
      'stargazers': instance.stargazers?.toJson(),
      '__typename': instance.resolveType,
    };

GithubRepositoriesUniformResourceLocatable
    _$GithubRepositoriesUniformResourceLocatableFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesUniformResourceLocatableToJson(
        GithubRepositoriesUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesRepositoryInfo _$GithubRepositoriesRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesRepositoryInfo()
    ..owner = json['owner'] == null
        ? null
        : GithubRepositoriesRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesRepositoryInfoToJson(
        GithubRepositoriesRepositoryInfo instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      '__typename': instance.resolveType,
    };

GithubRepositoriesStarredRepositoryConnection
    _$GithubRepositoriesStarredRepositoryConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesStarredRepositoryConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubRepositoriesPageInfo.fromJson(
            json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoriesRepository.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoriesStarredRepositoryConnectionToJson(
        GithubRepositoriesStarredRepositoryConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoriesAuditEntryActor _$GithubRepositoriesAuditEntryActorFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesAuditEntryActor();
}

Map<String, dynamic> _$GithubRepositoriesAuditEntryActorToJson(
        GithubRepositoriesAuditEntryActor instance) =>
    <String, dynamic>{};

GithubRepositoriesActor _$GithubRepositoriesActorFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesActor()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesActorToJson(
        GithubRepositoriesActor instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesProfileOwner _$GithubRepositoriesProfileOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesProfileOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesProfileOwnerToJson(
        GithubRepositoriesProfileOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesSponsorable _$GithubRepositoriesSponsorableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesSponsorable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesSponsorableToJson(
        GithubRepositoriesSponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesOrganization _$GithubRepositoriesOrganizationFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesOrganization()
    ..pinnableItems = json['pinnableItems'] == null
        ? null
        : GithubRepositoriesPinnableItemConnection.fromJson(
            json['pinnableItems'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String;
}

Map<String, dynamic> _$GithubRepositoriesOrganizationToJson(
        GithubRepositoriesOrganization instance) =>
    <String, dynamic>{
      'pinnableItems': instance.pinnableItems?.toJson(),
      '__typename': instance.resolveType,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
    };

GithubRepositoriesPinnableItemConnection
    _$GithubRepositoriesPinnableItemConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubRepositoriesPinnableItemConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubRepositoriesPageInfo.fromJson(
            json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubRepositoriesPinnableItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubRepositoriesPinnableItemConnectionToJson(
        GithubRepositoriesPinnableItemConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubRepositoriesMemberStatusable _$GithubRepositoriesMemberStatusableFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesMemberStatusable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubRepositoriesMemberStatusableToJson(
        GithubRepositoriesMemberStatusable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubRepositoriesArguments _$GithubRepositoriesArgumentsFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoriesArguments(
    owner: json['owner'] as String,
    after: json['after'] as String,
    isStar: json['isStar'] as bool,
  );
}

Map<String, dynamic> _$GithubRepositoriesArgumentsToJson(
        GithubRepositoriesArguments instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'after': instance.after,
      'isStar': instance.isStar,
    };
