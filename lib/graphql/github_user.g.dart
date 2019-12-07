// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) {
  return GithubUser()
    ..repositoryOwner = json['repositoryOwner'] == null
        ? null
        : GithubUserRepositoryOwner.fromJson(
            json['repositoryOwner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubUserToJson(GithubUser instance) =>
    <String, dynamic>{
      'repositoryOwner': instance.repositoryOwner?.toJson(),
    };

GithubUserRepositoryOwner _$GithubUserRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUserRepositoryOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserRepositoryOwnerToJson(
        GithubUserRepositoryOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserUser _$GithubUserUserFromJson(Map<String, dynamic> json) {
  return GithubUserUser()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..bio = json['bio'] as String
    ..company = json['company'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..starredRepositories = json['starredRepositories'] == null
        ? null
        : GithubUserStarredRepositoryConnection.fromJson(
            json['starredRepositories'] as Map<String, dynamic>)
    ..followers = json['followers'] == null
        ? null
        : GithubUserFollowerConnection.fromJson(
            json['followers'] as Map<String, dynamic>)
    ..following = json['following'] == null
        ? null
        : GithubUserFollowingConnection.fromJson(
            json['following'] as Map<String, dynamic>)
    ..repositories = json['repositories'] == null
        ? null
        : GithubUserRepositoryConnection.fromJson(
            json['repositories'] as Map<String, dynamic>)
    ..pinnedItems = json['pinnedItems'] == null
        ? null
        : GithubUserPinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..viewerCanFollow = json['viewerCanFollow'] as bool
    ..viewerIsFollowing = json['viewerIsFollowing'] as bool
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserUserToJson(GithubUserUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'company': instance.company,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      'starredRepositories': instance.starredRepositories?.toJson(),
      'followers': instance.followers?.toJson(),
      'following': instance.following?.toJson(),
      'repositories': instance.repositories?.toJson(),
      'pinnedItems': instance.pinnedItems?.toJson(),
      'viewerCanFollow': instance.viewerCanFollow,
      'viewerIsFollowing': instance.viewerIsFollowing,
      'url': instance.url,
      '__typename': instance.resolveType,
    };

GithubUserStarredRepositoryConnection
    _$GithubUserStarredRepositoryConnectionFromJson(Map<String, dynamic> json) {
  return GithubUserStarredRepositoryConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubUserStarredRepositoryConnectionToJson(
        GithubUserStarredRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubUserFollowerConnection _$GithubUserFollowerConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUserFollowerConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubUserFollowerConnectionToJson(
        GithubUserFollowerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubUserFollowingConnection _$GithubUserFollowingConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUserFollowingConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubUserFollowingConnectionToJson(
        GithubUserFollowingConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubUserRepositoryConnection _$GithubUserRepositoryConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUserRepositoryConnection()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUserRepository.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUserRepositoryConnectionToJson(
        GithubUserRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUserRepository _$GithubUserRepositoryFromJson(Map<String, dynamic> json) {
  return GithubUserRepository()
    ..owner = json['owner'] == null
        ? null
        : GithubUserRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubUserStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..forks = json['forks'] == null
        ? null
        : GithubUserRepositoryConnection.fromJson(
            json['forks'] as Map<String, dynamic>)
    ..primaryLanguage = json['primaryLanguage'] == null
        ? null
        : GithubUserLanguage.fromJson(
            json['primaryLanguage'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserRepositoryToJson(
        GithubUserRepository instance) =>
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

GithubUserStargazerConnection _$GithubUserStargazerConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUserStargazerConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubUserStargazerConnectionToJson(
        GithubUserStargazerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubUserLanguage _$GithubUserLanguageFromJson(Map<String, dynamic> json) {
  return GithubUserLanguage()
    ..color = json['color'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserLanguageToJson(GithubUserLanguage instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

GithubUserNode _$GithubUserNodeFromJson(Map<String, dynamic> json) {
  return GithubUserNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserNodeToJson(GithubUserNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserPinnableItem _$GithubUserPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubUserPinnableItem();
}

Map<String, dynamic> _$GithubUserPinnableItemToJson(
        GithubUserPinnableItem instance) =>
    <String, dynamic>{};

GithubUserProjectOwner _$GithubUserProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUserProjectOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserProjectOwnerToJson(
        GithubUserProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserRegistryPackageOwner _$GithubUserRegistryPackageOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUserRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserRegistryPackageOwnerToJson(
        GithubUserRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserRegistryPackageSearch _$GithubUserRegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return GithubUserRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserRegistryPackageSearchToJson(
        GithubUserRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserSubscribable _$GithubUserSubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubUserSubscribable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserSubscribableToJson(
        GithubUserSubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserStarrable _$GithubUserStarrableFromJson(Map<String, dynamic> json) {
  return GithubUserStarrable()
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubUserStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserStarrableToJson(
        GithubUserStarrable instance) =>
    <String, dynamic>{
      'stargazers': instance.stargazers?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUserUniformResourceLocatable _$GithubUserUniformResourceLocatableFromJson(
    Map<String, dynamic> json) {
  return GithubUserUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserUniformResourceLocatableToJson(
        GithubUserUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserRepositoryInfo _$GithubUserRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubUserRepositoryInfo()
    ..owner = json['owner'] == null
        ? null
        : GithubUserRepositoryOwner.fromJson(
            json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserRepositoryInfoToJson(
        GithubUserRepositoryInfo instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      '__typename': instance.resolveType,
    };

GithubUserPinnableItemConnection _$GithubUserPinnableItemConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUserPinnableItemConnection()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUserPinnableItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUserPinnableItemConnectionToJson(
        GithubUserPinnableItemConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUserAuditEntryActor _$GithubUserAuditEntryActorFromJson(
    Map<String, dynamic> json) {
  return GithubUserAuditEntryActor();
}

Map<String, dynamic> _$GithubUserAuditEntryActorToJson(
        GithubUserAuditEntryActor instance) =>
    <String, dynamic>{};

GithubUserActor _$GithubUserActorFromJson(Map<String, dynamic> json) {
  return GithubUserActor()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserActorToJson(GithubUserActor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      '__typename': instance.resolveType,
    };

GithubUserProfileOwner _$GithubUserProfileOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUserProfileOwner()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..pinnedItems = json['pinnedItems'] == null
        ? null
        : GithubUserPinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserProfileOwnerToJson(
        GithubUserProfileOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      'pinnedItems': instance.pinnedItems?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUserSponsorable _$GithubUserSponsorableFromJson(
    Map<String, dynamic> json) {
  return GithubUserSponsorable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserSponsorableToJson(
        GithubUserSponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserOrganization _$GithubUserOrganizationFromJson(
    Map<String, dynamic> json) {
  return GithubUserOrganization()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..description = json['description'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..url = json['url'] as String
    ..pinnedItems = json['pinnedItems'] == null
        ? null
        : GithubUserPinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..pinnableItems = json['pinnableItems'] == null
        ? null
        : GithubUserPinnableItemConnection.fromJson(
            json['pinnableItems'] as Map<String, dynamic>)
    ..membersWithRole = json['membersWithRole'] == null
        ? null
        : GithubUserOrganizationMemberConnection.fromJson(
            json['membersWithRole'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserOrganizationToJson(
        GithubUserOrganization instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      'url': instance.url,
      'pinnedItems': instance.pinnedItems?.toJson(),
      'pinnableItems': instance.pinnableItems?.toJson(),
      'membersWithRole': instance.membersWithRole?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUserOrganizationMemberConnection
    _$GithubUserOrganizationMemberConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubUserOrganizationMemberConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubUserOrganizationMemberConnectionToJson(
        GithubUserOrganizationMemberConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubUserMemberStatusable _$GithubUserMemberStatusableFromJson(
    Map<String, dynamic> json) {
  return GithubUserMemberStatusable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUserMemberStatusableToJson(
        GithubUserMemberStatusable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUserArguments _$GithubUserArgumentsFromJson(Map<String, dynamic> json) {
  return GithubUserArguments(
    login: json['login'] as String,
  );
}

Map<String, dynamic> _$GithubUserArgumentsToJson(
        GithubUserArguments instance) =>
    <String, dynamic>{
      'login': instance.login,
    };
