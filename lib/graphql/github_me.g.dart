// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubMe _$GithubMeFromJson(Map<String, dynamic> json) {
  return GithubMe()
    ..viewer = json['viewer'] == null
        ? null
        : GithubMeUser.fromJson(json['viewer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubMeToJson(GithubMe instance) => <String, dynamic>{
      'viewer': instance.viewer?.toJson(),
    };

GithubMeUser _$GithubMeUserFromJson(Map<String, dynamic> json) {
  return GithubMeUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..bio = json['bio'] as String
    ..company = json['company'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..starredRepositories = json['starredRepositories'] == null
        ? null
        : GithubMeStarredRepositoryConnection.fromJson(
            json['starredRepositories'] as Map<String, dynamic>)
    ..followers = json['followers'] == null
        ? null
        : GithubMeFollowerConnection.fromJson(
            json['followers'] as Map<String, dynamic>)
    ..following = json['following'] == null
        ? null
        : GithubMeFollowingConnection.fromJson(
            json['following'] as Map<String, dynamic>)
    ..repositories = json['repositories'] == null
        ? null
        : GithubMeRepositoryConnection.fromJson(
            json['repositories'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeUserToJson(GithubMeUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      'name': instance.name,
      'bio': instance.bio,
      'company': instance.company,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      'starredRepositories': instance.starredRepositories?.toJson(),
      'followers': instance.followers?.toJson(),
      'following': instance.following?.toJson(),
      'repositories': instance.repositories?.toJson(),
      '__typename': instance.resolveType,
    };

GithubMeStarredRepositoryConnection
    _$GithubMeStarredRepositoryConnectionFromJson(Map<String, dynamic> json) {
  return GithubMeStarredRepositoryConnection()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubMeStarredRepositoryConnectionToJson(
        GithubMeStarredRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubMeFollowerConnection _$GithubMeFollowerConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubMeFollowerConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubMeFollowerConnectionToJson(
        GithubMeFollowerConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubMeFollowingConnection _$GithubMeFollowingConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubMeFollowingConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubMeFollowingConnectionToJson(
        GithubMeFollowingConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubMeRepositoryConnection _$GithubMeRepositoryConnectionFromJson(
    Map<String, dynamic> json) {
  return GithubMeRepositoryConnection()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$GithubMeRepositoryConnectionToJson(
        GithubMeRepositoryConnection instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GithubMeAuditEntryActor _$GithubMeAuditEntryActorFromJson(
    Map<String, dynamic> json) {
  return GithubMeAuditEntryActor();
}

Map<String, dynamic> _$GithubMeAuditEntryActorToJson(
        GithubMeAuditEntryActor instance) =>
    <String, dynamic>{};

GithubMeNode _$GithubMeNodeFromJson(Map<String, dynamic> json) {
  return GithubMeNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeNodeToJson(GithubMeNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubMeActor _$GithubMeActorFromJson(Map<String, dynamic> json) {
  return GithubMeActor()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeActorToJson(GithubMeActor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      '__typename': instance.resolveType,
    };

GithubMeRegistryPackageOwner _$GithubMeRegistryPackageOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubMeRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeRegistryPackageOwnerToJson(
        GithubMeRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubMeRegistryPackageSearch _$GithubMeRegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return GithubMeRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeRegistryPackageSearchToJson(
        GithubMeRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubMeProjectOwner _$GithubMeProjectOwnerFromJson(Map<String, dynamic> json) {
  return GithubMeProjectOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeProjectOwnerToJson(
        GithubMeProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubMeRepositoryOwner _$GithubMeRepositoryOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubMeRepositoryOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..url = json['url'] as String
    ..repositories = json['repositories'] == null
        ? null
        : GithubMeRepositoryConnection.fromJson(
            json['repositories'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeRepositoryOwnerToJson(
        GithubMeRepositoryOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      'repositories': instance.repositories?.toJson(),
      '__typename': instance.resolveType,
    };

GithubMeUniformResourceLocatable _$GithubMeUniformResourceLocatableFromJson(
    Map<String, dynamic> json) {
  return GithubMeUniformResourceLocatable()
    ..url = json['url'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeUniformResourceLocatableToJson(
        GithubMeUniformResourceLocatable instance) =>
    <String, dynamic>{
      'url': instance.url,
      '__typename': instance.resolveType,
    };

GithubMeProfileOwner _$GithubMeProfileOwnerFromJson(Map<String, dynamic> json) {
  return GithubMeProfileOwner()
    ..login = json['login'] as String
    ..name = json['name'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..websiteUrl = json['websiteUrl'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeProfileOwnerToJson(
        GithubMeProfileOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
      '__typename': instance.resolveType,
    };

GithubMeSponsorable _$GithubMeSponsorableFromJson(Map<String, dynamic> json) {
  return GithubMeSponsorable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubMeSponsorableToJson(
        GithubMeSponsorable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };
