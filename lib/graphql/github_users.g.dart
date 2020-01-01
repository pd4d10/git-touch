// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUsers _$GithubUsersFromJson(Map<String, dynamic> json) {
  return GithubUsers()
    ..user = json['user'] == null
        ? null
        : GithubUsersUser.fromJson(json['user'] as Map<String, dynamic>)
    ..organization = json['organization'] == null
        ? null
        : GithubUsersOrganization.fromJson(
            json['organization'] as Map<String, dynamic>)
    ..repository = json['repository'] == null
        ? null
        : GithubUsersRepository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubUsersToJson(GithubUsers instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'organization': instance.organization?.toJson(),
      'repository': instance.repository?.toJson(),
    };

GithubUsersUser _$GithubUsersUserFromJson(Map<String, dynamic> json) {
  return GithubUsersUser()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..company = json['company'] as String
    ..location = json['location'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..followers = json['followers'] == null
        ? null
        : GithubUsersFollowerConnection.fromJson(
            json['followers'] as Map<String, dynamic>)
    ..following = json['following'] == null
        ? null
        : GithubUsersFollowingConnection.fromJson(
            json['following'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersUserToJson(GithubUsersUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'company': instance.company,
      'location': instance.location,
      'createdAt': instance.createdAt?.toIso8601String(),
      'followers': instance.followers?.toJson(),
      'following': instance.following?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUsersFollowerConnection _$GithubUsersFollowerConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUsersFollowerConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubUsersPageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUsersUser.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUsersFollowerConnectionToJson(
        GithubUsersFollowerConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUsersPageInfo _$GithubUsersPageInfoFromJson(Map<String, dynamic> json) {
  return GithubUsersPageInfo()
    ..hasNextPage = json['hasNextPage'] as bool
    ..endCursor = json['endCursor'] as String;
}

Map<String, dynamic> _$GithubUsersPageInfoToJson(
        GithubUsersPageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'endCursor': instance.endCursor,
    };

GithubUsersAuditEntryActor _$GithubUsersAuditEntryActorFromJson(
    Map<String, dynamic> json) {
  return GithubUsersAuditEntryActor();
}

Map<String, dynamic> _$GithubUsersAuditEntryActorToJson(
        GithubUsersAuditEntryActor instance) =>
    <String, dynamic>{};

GithubUsersNode _$GithubUsersNodeFromJson(Map<String, dynamic> json) {
  return GithubUsersNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersNodeToJson(GithubUsersNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersActor _$GithubUsersActorFromJson(Map<String, dynamic> json) {
  return GithubUsersActor()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersActorToJson(GithubUsersActor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      '__typename': instance.resolveType,
    };

GithubUsersRegistryPackageOwner _$GithubUsersRegistryPackageOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUsersRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersRegistryPackageOwnerToJson(
        GithubUsersRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersRegistryPackageSearch _$GithubUsersRegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return GithubUsersRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersRegistryPackageSearchToJson(
        GithubUsersRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersProjectOwner _$GithubUsersProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUsersProjectOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersProjectOwnerToJson(
        GithubUsersProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersRepositoryOwner _$GithubUsersRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUsersRepositoryOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersRepositoryOwnerToJson(
        GithubUsersRepositoryOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      '__typename': instance.resolveType,
    };

GithubUsersUniformResourceLocatable
    _$GithubUsersUniformResourceLocatableFromJson(Map<String, dynamic> json) {
  return GithubUsersUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersUniformResourceLocatableToJson(
        GithubUsersUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersProfileOwner _$GithubUsersProfileOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubUsersProfileOwner()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..location = json['location'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersProfileOwnerToJson(
        GithubUsersProfileOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      '__typename': instance.resolveType,
    };

GithubUsersSponsorable _$GithubUsersSponsorableFromJson(
    Map<String, dynamic> json) {
  return GithubUsersSponsorable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersSponsorableToJson(
        GithubUsersSponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersFollowingConnection _$GithubUsersFollowingConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUsersFollowingConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubUsersPageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUsersUser.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUsersFollowingConnectionToJson(
        GithubUsersFollowingConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUsersOrganization _$GithubUsersOrganizationFromJson(
    Map<String, dynamic> json) {
  return GithubUsersOrganization()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..location = json['location'] as String
    ..membersWithRole = json['membersWithRole'] == null
        ? null
        : GithubUsersOrganizationMemberConnection.fromJson(
            json['membersWithRole'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersOrganizationToJson(
        GithubUsersOrganization instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'location': instance.location,
      'membersWithRole': instance.membersWithRole?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUsersOrganizationMemberConnection
    _$GithubUsersOrganizationMemberConnectionFromJson(
        Map<String, dynamic> json) {
  return GithubUsersOrganizationMemberConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubUsersPageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUsersUser.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUsersOrganizationMemberConnectionToJson(
        GithubUsersOrganizationMemberConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUsersMemberStatusable _$GithubUsersMemberStatusableFromJson(
    Map<String, dynamic> json) {
  return GithubUsersMemberStatusable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersMemberStatusableToJson(
        GithubUsersMemberStatusable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersRepository _$GithubUsersRepositoryFromJson(
    Map<String, dynamic> json) {
  return GithubUsersRepository()
    ..watchers = json['watchers'] == null
        ? null
        : GithubUsersUserConnection.fromJson(
            json['watchers'] as Map<String, dynamic>)
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubUsersStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersRepositoryToJson(
        GithubUsersRepository instance) =>
    <String, dynamic>{
      'watchers': instance.watchers?.toJson(),
      'stargazers': instance.stargazers?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUsersUserConnection _$GithubUsersUserConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUsersUserConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubUsersPageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUsersUser.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUsersUserConnectionToJson(
        GithubUsersUserConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUsersStargazerConnection _$GithubUsersStargazerConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubUsersStargazerConnection()
    ..pageInfo = json['pageInfo'] == null
        ? null
        : GithubUsersPageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>)
    ..nodes = (json['nodes'] as List)
        ?.map((e) => e == null
            ? null
            : GithubUsersUser.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GithubUsersStargazerConnectionToJson(
        GithubUsersStargazerConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

GithubUsersPinnableItem _$GithubUsersPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubUsersPinnableItem();
}

Map<String, dynamic> _$GithubUsersPinnableItemToJson(
        GithubUsersPinnableItem instance) =>
    <String, dynamic>{};

GithubUsersSubscribable _$GithubUsersSubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubUsersSubscribable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersSubscribableToJson(
        GithubUsersSubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersStarrable _$GithubUsersStarrableFromJson(Map<String, dynamic> json) {
  return GithubUsersStarrable()
    ..stargazers = json['stargazers'] == null
        ? null
        : GithubUsersStargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersStarrableToJson(
        GithubUsersStarrable instance) =>
    <String, dynamic>{
      'stargazers': instance.stargazers?.toJson(),
      '__typename': instance.resolveType,
    };

GithubUsersRepositoryInfo _$GithubUsersRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubUsersRepositoryInfo()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubUsersRepositoryInfoToJson(
        GithubUsersRepositoryInfo instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubUsersArguments _$GithubUsersArgumentsFromJson(Map<String, dynamic> json) {
  return GithubUsersArguments(
    login: json['login'] as String,
    repoName: json['repoName'] as String,
    after: json['after'] as String,
    isFollowers: json['isFollowers'] as bool,
    isFollowing: json['isFollowing'] as bool,
    isMember: json['isMember'] as bool,
    isStar: json['isStar'] as bool,
    isWatch: json['isWatch'] as bool,
  );
}

Map<String, dynamic> _$GithubUsersArgumentsToJson(
        GithubUsersArguments instance) =>
    <String, dynamic>{
      'login': instance.login,
      'repoName': instance.repoName,
      'after': instance.after,
      'isFollowers': instance.isFollowers,
      'isFollowing': instance.isFollowing,
      'isMember': instance.isMember,
      'isStar': instance.isStar,
      'isWatch': instance.isWatch,
    };
