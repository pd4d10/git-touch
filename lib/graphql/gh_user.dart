// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'gh_user.g.dart';

@JsonSerializable(explicitToJson: true)
class GhUser with EquatableMixin {
  GhUser();

  factory GhUser.fromJson(Map<String, dynamic> json) => _$GhUserFromJson(json);

  RepositoryOwner repositoryOwner;

  @override
  List<Object> get props => [repositoryOwner];
  Map<String, dynamic> toJson() => _$GhUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepositoryOwner with EquatableMixin {
  RepositoryOwner();

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'User':
        return User.fromJson(json);
      case 'Organization':
        return Organization.fromJson(json);
      default:
    }
    return _$RepositoryOwnerFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'User':
        return (this as User).toJson();
      case 'Organization':
        return (this as Organization).toJson();
      default:
    }
    return _$RepositoryOwnerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class User extends AuditEntryActor
    with EquatableMixin
    implements
        Node,
        Actor,
        RegistryPackageOwner,
        RegistryPackageSearch,
        ProjectOwner,
        RepositoryOwner,
        UniformResourceLocatable,
        ProfileOwner,
        Sponsorable {
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String login;

  String name;

  String avatarUrl;

  String bio;

  String company;

  String location;

  String email;

  String websiteUrl;

  StarredRepositoryConnection starredRepositories;

  FollowerConnection followers;

  FollowingConnection following;

  RepositoryConnection repositories;

  PinnableItemConnection pinnedItems;

  bool viewerCanFollow;

  bool viewerIsFollowing;

  String url;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        login,
        name,
        avatarUrl,
        bio,
        company,
        location,
        email,
        websiteUrl,
        starredRepositories,
        followers,
        following,
        repositories,
        pinnedItems,
        viewerCanFollow,
        viewerIsFollowing,
        url,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StarredRepositoryConnection with EquatableMixin {
  StarredRepositoryConnection();

  factory StarredRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$StarredRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$StarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowerConnection with EquatableMixin {
  FollowerConnection();

  factory FollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$FollowerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$FollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowingConnection with EquatableMixin {
  FollowingConnection();

  factory FollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$FollowingConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$FollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepositoryConnection with EquatableMixin {
  RepositoryConnection();

  factory RepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$RepositoryConnectionFromJson(json);

  int totalCount;

  List<Repository> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$RepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Repository extends PinnableItem
    with EquatableMixin
    implements
        Node,
        ProjectOwner,
        RegistryPackageOwner,
        RegistryPackageSearch,
        Subscribable,
        Starrable,
        UniformResourceLocatable,
        RepositoryInfo {
  Repository();

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  @override
  RepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  StargazerConnection stargazers;

  RepositoryConnection forks;

  Language primaryLanguage;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        owner,
        name,
        description,
        isPrivate,
        isFork,
        stargazers,
        forks,
        primaryLanguage,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StargazerConnection with EquatableMixin {
  StargazerConnection();

  factory StargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$StargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$StargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Language with EquatableMixin implements Node {
  Language();

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Node with EquatableMixin {
  Node();

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnableItem with EquatableMixin {
  PinnableItem();

  factory PinnableItem.fromJson(Map<String, dynamic> json) =>
      _$PinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$PinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProjectOwner with EquatableMixin {
  ProjectOwner();

  factory ProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$ProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$ProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegistryPackageOwner with EquatableMixin {
  RegistryPackageOwner();

  factory RegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$RegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$RegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegistryPackageSearch with EquatableMixin {
  RegistryPackageSearch();

  factory RegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$RegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$RegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subscribable with EquatableMixin {
  Subscribable();

  factory Subscribable.fromJson(Map<String, dynamic> json) =>
      _$SubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$SubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Starrable with EquatableMixin {
  Starrable();

  factory Starrable.fromJson(Map<String, dynamic> json) =>
      _$StarrableFromJson(json);

  StargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$StarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UniformResourceLocatable with EquatableMixin {
  UniformResourceLocatable();

  factory UniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$UniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$UniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepositoryInfo with EquatableMixin {
  RepositoryInfo();

  factory RepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$RepositoryInfoFromJson(json);

  RepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, resolveType];
  Map<String, dynamic> toJson() => _$RepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnableItemConnection with EquatableMixin {
  PinnableItemConnection();

  factory PinnableItemConnection.fromJson(Map<String, dynamic> json) =>
      _$PinnableItemConnectionFromJson(json);

  int totalCount;

  List<PinnableItem> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$PinnableItemConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuditEntryActor with EquatableMixin {
  AuditEntryActor();

  factory AuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$AuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$AuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Actor with EquatableMixin {
  Actor();

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  String login;

  String avatarUrl;

  String url;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, url, resolveType];
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProfileOwner with EquatableMixin {
  ProfileOwner();

  factory ProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$ProfileOwnerFromJson(json);

  String login;

  String name;

  String location;

  String email;

  String websiteUrl;

  PinnableItemConnection pinnedItems;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [login, name, location, email, websiteUrl, pinnedItems, resolveType];
  Map<String, dynamic> toJson() => _$ProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Sponsorable with EquatableMixin {
  Sponsorable();

  factory Sponsorable.fromJson(Map<String, dynamic> json) =>
      _$SponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$SponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Organization extends AuditEntryActor
    with EquatableMixin
    implements
        Node,
        Actor,
        RegistryPackageOwner,
        RegistryPackageSearch,
        ProjectOwner,
        RepositoryOwner,
        UniformResourceLocatable,
        MemberStatusable,
        ProfileOwner,
        Sponsorable {
  Organization();

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  String login;

  String name;

  String avatarUrl;

  String description;

  String location;

  String email;

  String websiteUrl;

  String url;

  PinnableItemConnection pinnedItems;

  PinnableItemConnection pinnableItems;

  OrganizationMemberConnection membersWithRole;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        login,
        name,
        avatarUrl,
        description,
        location,
        email,
        websiteUrl,
        url,
        pinnedItems,
        pinnableItems,
        membersWithRole,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrganizationMemberConnection with EquatableMixin {
  OrganizationMemberConnection();

  factory OrganizationMemberConnection.fromJson(Map<String, dynamic> json) =>
      _$OrganizationMemberConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$OrganizationMemberConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MemberStatusable with EquatableMixin {
  MemberStatusable();

  factory MemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$MemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$MemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserArguments extends JsonSerializable with EquatableMixin {
  GhUserArguments({this.login});

  factory GhUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GhUserArgumentsFromJson(json);

  final String login;

  @override
  List<Object> get props => [login];
  Map<String, dynamic> toJson() => _$GhUserArgumentsToJson(this);
}

class GhUserQuery extends GraphQLQuery<GhUser, GhUserArguments> {
  GhUserQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: null,
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'login')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'repositoryOwner'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'login'),
                    value: VariableNode(name: NameNode(value: 'login')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'User'), isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'login'),
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
                          name: NameNode(value: 'avatarUrl'),
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
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '6')),
                            ArgumentNode(
                                name: NameNode(value: 'ownerAffiliations'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'OWNER'))),
                            ArgumentNode(
                                name: NameNode(value: 'orderBy'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                      name: NameNode(value: 'field'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'STARGAZERS'))),
                                  ObjectFieldNode(
                                      name: NameNode(value: 'direction'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'DESC')))
                                ]))
                          ],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'totalCount'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'nodes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'owner'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: '__typename'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
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
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'description'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'isPrivate'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'isFork'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'stargazers'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'totalCount'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'forks'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'totalCount'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'primaryLanguage'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'color'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'pinnedItems'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '6'))
                          ],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'totalCount'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'nodes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  InlineFragmentNode(
                                      typeCondition: TypeConditionNode(
                                          on: NamedTypeNode(
                                              name:
                                                  NameNode(value: 'Repository'),
                                              isNonNull: false)),
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'owner'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: '__typename'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'login'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'avatarUrl'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name:
                                                NameNode(value: 'description'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isPrivate'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isFork'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'stargazers'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'forks'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(
                                                value: 'primaryLanguage'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'color'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(value: 'name'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ]))
                                      ]))
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'viewerCanFollow'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'viewerIsFollowing'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'url'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'Organization'),
                            isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'login'),
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
                          name: NameNode(value: 'avatarUrl'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'description'),
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
                          name: NameNode(value: 'url'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'pinnedItems'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '6'))
                          ],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'nodes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  InlineFragmentNode(
                                      typeCondition: TypeConditionNode(
                                          on: NamedTypeNode(
                                              name:
                                                  NameNode(value: 'Repository'),
                                              isNonNull: false)),
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'owner'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: '__typename'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'login'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'avatarUrl'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name:
                                                NameNode(value: 'description'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isPrivate'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isFork'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'stargazers'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'forks'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(
                                                value: 'primaryLanguage'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'color'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(value: 'name'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ]))
                                      ]))
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'pinnableItems'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '6')),
                            ArgumentNode(
                                name: NameNode(value: 'types'),
                                value: ListValueNode(values: [
                                  EnumValueNode(
                                      name: NameNode(value: 'REPOSITORY'))
                                ]))
                          ],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'totalCount'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'nodes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  InlineFragmentNode(
                                      typeCondition: TypeConditionNode(
                                          on: NamedTypeNode(
                                              name:
                                                  NameNode(value: 'Repository'),
                                              isNonNull: false)),
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'owner'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: '__typename'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'login'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'avatarUrl'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name:
                                                NameNode(value: 'description'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isPrivate'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'isFork'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'stargazers'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(value: 'forks'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name: NameNode(
                                                      value: 'totalCount'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ])),
                                        FieldNode(
                                            name: NameNode(
                                                value: 'primaryLanguage'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                  name:
                                                      NameNode(value: 'color'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null),
                                              FieldNode(
                                                  name: NameNode(value: 'name'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null)
                                            ]))
                                      ]))
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'membersWithRole'),
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
        ]))
  ]);

  @override
  final String operationName = 'gh_user';

  @override
  final GhUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhUser parse(Map<String, dynamic> json) => GhUser.fromJson(json);
}
