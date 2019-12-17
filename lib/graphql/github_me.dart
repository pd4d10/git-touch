// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_me.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubMe with EquatableMixin {
  GithubMe();

  factory GithubMe.fromJson(Map<String, dynamic> json) =>
      _$GithubMeFromJson(json);

  GithubMeUser viewer;

  @override
  List<Object> get props => [viewer];
  Map<String, dynamic> toJson() => _$GithubMeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeUser extends GithubMeAuditEntryActor
    with EquatableMixin
    implements
        GithubMeNode,
        GithubMeActor,
        GithubMeRegistryPackageOwner,
        GithubMeRegistryPackageSearch,
        GithubMeProjectOwner,
        GithubMeRepositoryOwner,
        GithubMeUniformResourceLocatable,
        GithubMeProfileOwner,
        GithubMeSponsorable {
  GithubMeUser();

  factory GithubMeUser.fromJson(Map<String, dynamic> json) =>
      _$GithubMeUserFromJson(json);

  @override
  String login;

  @override
  String avatarUrl;

  @override
  String url;

  @override
  String name;

  String bio;

  String company;

  @override
  String location;

  @override
  String email;

  @override
  String websiteUrl;

  GithubMeStarredRepositoryConnection starredRepositories;

  GithubMeFollowerConnection followers;

  GithubMeFollowingConnection following;

  @override
  GithubMeRepositoryConnection repositories;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        login,
        avatarUrl,
        url,
        name,
        bio,
        company,
        location,
        email,
        websiteUrl,
        starredRepositories,
        followers,
        following,
        repositories,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GithubMeUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeStarredRepositoryConnection with EquatableMixin {
  GithubMeStarredRepositoryConnection();

  factory GithubMeStarredRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubMeStarredRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubMeStarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeFollowerConnection with EquatableMixin {
  GithubMeFollowerConnection();

  factory GithubMeFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubMeFollowerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubMeFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeFollowingConnection with EquatableMixin {
  GithubMeFollowingConnection();

  factory GithubMeFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubMeFollowingConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubMeFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeRepositoryConnection with EquatableMixin {
  GithubMeRepositoryConnection();

  factory GithubMeRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubMeRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubMeRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeAuditEntryActor with EquatableMixin {
  GithubMeAuditEntryActor();

  factory GithubMeAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GithubMeAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubMeAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeNode with EquatableMixin {
  GithubMeNode();

  factory GithubMeNode.fromJson(Map<String, dynamic> json) =>
      _$GithubMeNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubMeNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeActor with EquatableMixin {
  GithubMeActor();

  factory GithubMeActor.fromJson(Map<String, dynamic> json) =>
      _$GithubMeActorFromJson(json);

  String login;

  String avatarUrl;

  String url;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, url, resolveType];
  Map<String, dynamic> toJson() => _$GithubMeActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeRegistryPackageOwner with EquatableMixin {
  GithubMeRegistryPackageOwner();

  factory GithubMeRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubMeRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubMeRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeRegistryPackageSearch with EquatableMixin {
  GithubMeRegistryPackageSearch();

  factory GithubMeRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GithubMeRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubMeRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeProjectOwner with EquatableMixin {
  GithubMeProjectOwner();

  factory GithubMeProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubMeProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubMeProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeRepositoryOwner with EquatableMixin {
  GithubMeRepositoryOwner();

  factory GithubMeRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubMeRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  String url;

  GithubMeRepositoryConnection repositories;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, url, repositories, resolveType];
  Map<String, dynamic> toJson() => _$GithubMeRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeUniformResourceLocatable with EquatableMixin {
  GithubMeUniformResourceLocatable();

  factory GithubMeUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubMeUniformResourceLocatableFromJson(json);

  String url;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [url, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubMeUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeProfileOwner with EquatableMixin {
  GithubMeProfileOwner();

  factory GithubMeProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubMeProfileOwnerFromJson(json);

  String login;

  String name;

  String location;

  String email;

  String websiteUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [login, name, location, email, websiteUrl, resolveType];
  Map<String, dynamic> toJson() => _$GithubMeProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubMeSponsorable with EquatableMixin {
  GithubMeSponsorable();

  factory GithubMeSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GithubMeSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubMeSponsorableToJson(this);
}

class GithubMeQuery extends GraphQLQuery<GithubMe, JsonSerializable> {
  GithubMeQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: null,
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'viewer'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'login'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'avatarUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'bio'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'company'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'location'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'websiteUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'starredRepositories'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'totalCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'followers'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'totalCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'following'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'totalCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'repositories'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'totalCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'github_me';

  @override
  List<Object> get props => [document, operationName];
  @override
  GithubMe parse(Map<String, dynamic> json) => GithubMe.fromJson(json);
}
