// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gh_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GhUser _$GhUserFromJson(Map<String, dynamic> json) {
  return GhUser()
    ..repositoryOwner = json['repositoryOwner'] == null
        ? null
        : RepositoryOwner.fromJson(
            json['repositoryOwner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GhUserToJson(GhUser instance) => <String, dynamic>{
      'repositoryOwner': instance.repositoryOwner?.toJson(),
    };

RepositoryOwner _$RepositoryOwnerFromJson(Map<String, dynamic> json) {
  return RepositoryOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$RepositoryOwnerToJson(RepositoryOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
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
        : StarredRepositoryConnection.fromJson(
            json['starredRepositories'] as Map<String, dynamic>)
    ..followers = json['followers'] == null
        ? null
        : FollowerConnection.fromJson(json['followers'] as Map<String, dynamic>)
    ..following = json['following'] == null
        ? null
        : FollowingConnection.fromJson(
            json['following'] as Map<String, dynamic>)
    ..repositories = json['repositories'] == null
        ? null
        : RepositoryConnection.fromJson(
            json['repositories'] as Map<String, dynamic>)
    ..pinnedItems = json['pinnedItems'] == null
        ? null
        : PinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..viewerCanFollow = json['viewerCanFollow'] as bool
    ..viewerIsFollowing = json['viewerIsFollowing'] as bool
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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

StarredRepositoryConnection _$StarredRepositoryConnectionFromJson(
    Map<String, dynamic> json) {
  return StarredRepositoryConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$StarredRepositoryConnectionToJson(
        StarredRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

FollowerConnection _$FollowerConnectionFromJson(Map<String, dynamic> json) {
  return FollowerConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$FollowerConnectionToJson(FollowerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

FollowingConnection _$FollowingConnectionFromJson(Map<String, dynamic> json) {
  return FollowingConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$FollowingConnectionToJson(
        FollowingConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

RepositoryConnection _$RepositoryConnectionFromJson(Map<String, dynamic> json) {
  return RepositoryConnection()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List)
        ?.map((e) =>
            e == null ? null : Repository.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RepositoryConnectionToJson(
        RepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository()
    ..owner = json['owner'] == null
        ? null
        : RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..stargazers = json['stargazers'] == null
        ? null
        : StargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..forks = json['forks'] == null
        ? null
        : RepositoryConnection.fromJson(json['forks'] as Map<String, dynamic>)
    ..primaryLanguage = json['primaryLanguage'] == null
        ? null
        : Language.fromJson(json['primaryLanguage'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
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

StargazerConnection _$StargazerConnectionFromJson(Map<String, dynamic> json) {
  return StargazerConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$StargazerConnectionToJson(
        StargazerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return Language()
    ..color = json['color'] as String
    ..name = json['name'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
      '__typename': instance.resolveType,
    };

Node _$NodeFromJson(Map<String, dynamic> json) {
  return Node()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      '__typename': instance.resolveType,
    };

PinnableItem _$PinnableItemFromJson(Map<String, dynamic> json) {
  return PinnableItem();
}

Map<String, dynamic> _$PinnableItemToJson(PinnableItem instance) =>
    <String, dynamic>{};

ProjectOwner _$ProjectOwnerFromJson(Map<String, dynamic> json) {
  return ProjectOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$ProjectOwnerToJson(ProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

RegistryPackageOwner _$RegistryPackageOwnerFromJson(Map<String, dynamic> json) {
  return RegistryPackageOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$RegistryPackageOwnerToJson(
        RegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

RegistryPackageSearch _$RegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return RegistryPackageSearch()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$RegistryPackageSearchToJson(
        RegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

Subscribable _$SubscribableFromJson(Map<String, dynamic> json) {
  return Subscribable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$SubscribableToJson(Subscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

Starrable _$StarrableFromJson(Map<String, dynamic> json) {
  return Starrable()
    ..stargazers = json['stargazers'] == null
        ? null
        : StargazerConnection.fromJson(
            json['stargazers'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$StarrableToJson(Starrable instance) => <String, dynamic>{
      'stargazers': instance.stargazers?.toJson(),
      '__typename': instance.resolveType,
    };

UniformResourceLocatable _$UniformResourceLocatableFromJson(
    Map<String, dynamic> json) {
  return UniformResourceLocatable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$UniformResourceLocatableToJson(
        UniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

RepositoryInfo _$RepositoryInfoFromJson(Map<String, dynamic> json) {
  return RepositoryInfo()
    ..owner = json['owner'] == null
        ? null
        : RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..isPrivate = json['isPrivate'] as bool
    ..isFork = json['isFork'] as bool
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$RepositoryInfoToJson(RepositoryInfo instance) =>
    <String, dynamic>{
      'owner': instance.owner?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'isPrivate': instance.isPrivate,
      'isFork': instance.isFork,
      '__typename': instance.resolveType,
    };

PinnableItemConnection _$PinnableItemConnectionFromJson(
    Map<String, dynamic> json) {
  return PinnableItemConnection()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List)
        ?.map((e) =>
            e == null ? null : PinnableItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PinnableItemConnectionToJson(
        PinnableItemConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson())?.toList(),
    };

AuditEntryActor _$AuditEntryActorFromJson(Map<String, dynamic> json) {
  return AuditEntryActor();
}

Map<String, dynamic> _$AuditEntryActorToJson(AuditEntryActor instance) =>
    <String, dynamic>{};

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      '__typename': instance.resolveType,
    };

ProfileOwner _$ProfileOwnerFromJson(Map<String, dynamic> json) {
  return ProfileOwner()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..pinnedItems = json['pinnedItems'] == null
        ? null
        : PinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$ProfileOwnerToJson(ProfileOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      'pinnedItems': instance.pinnedItems?.toJson(),
      '__typename': instance.resolveType,
    };

Sponsorable _$SponsorableFromJson(Map<String, dynamic> json) {
  return Sponsorable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$SponsorableToJson(Sponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization()
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
        : PinnableItemConnection.fromJson(
            json['pinnedItems'] as Map<String, dynamic>)
    ..pinnableItems = json['pinnableItems'] == null
        ? null
        : PinnableItemConnection.fromJson(
            json['pinnableItems'] as Map<String, dynamic>)
    ..membersWithRole = json['membersWithRole'] == null
        ? null
        : OrganizationMemberConnection.fromJson(
            json['membersWithRole'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
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

OrganizationMemberConnection _$OrganizationMemberConnectionFromJson(
    Map<String, dynamic> json) {
  return OrganizationMemberConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$OrganizationMemberConnectionToJson(
        OrganizationMemberConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

MemberStatusable _$MemberStatusableFromJson(Map<String, dynamic> json) {
  return MemberStatusable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$MemberStatusableToJson(MemberStatusable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GhUserArguments _$GhUserArgumentsFromJson(Map<String, dynamic> json) {
  return GhUserArguments(
    login: json['login'] as String,
  );
}

Map<String, dynamic> _$GhUserArgumentsToJson(GhUserArguments instance) =>
    <String, dynamic>{
      'login': instance.login,
    };
