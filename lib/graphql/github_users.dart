// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_users.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubUsers with EquatableMixin {
  GithubUsers();

  factory GithubUsers.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersFromJson(json);

  GithubUsersUser user;

  GithubUsersOrganization organization;

  GithubUsersRepository repository;

  @override
  List<Object> get props => [user, organization, repository];
  Map<String, dynamic> toJson() => _$GithubUsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersUser extends GithubUsersAuditEntryActor
    with EquatableMixin
    implements
        GithubUsersNode,
        GithubUsersActor,
        GithubUsersRegistryPackageOwner,
        GithubUsersRegistryPackageSearch,
        GithubUsersProjectOwner,
        GithubUsersRepositoryOwner,
        GithubUsersUniformResourceLocatable,
        GithubUsersProfileOwner,
        GithubUsersSponsorable {
  GithubUsersUser();

  factory GithubUsersUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersUserFromJson(json);

  @override
  String login;

  @override
  String name;

  @override
  String avatarUrl;

  String company;

  @override
  String location;

  DateTime createdAt;

  GithubUsersFollowerConnection followers;

  GithubUsersFollowingConnection following;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        login,
        name,
        avatarUrl,
        company,
        location,
        createdAt,
        followers,
        following,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GithubUsersUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersFollowerConnection with EquatableMixin {
  GithubUsersFollowerConnection();

  factory GithubUsersFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersFollowerConnectionFromJson(json);

  GithubUsersPageInfo pageInfo;

  List<GithubUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GithubUsersFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersPageInfo with EquatableMixin {
  GithubUsersPageInfo();

  factory GithubUsersPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GithubUsersPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersAuditEntryActor with EquatableMixin {
  GithubUsersAuditEntryActor();

  factory GithubUsersAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubUsersAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersNode with EquatableMixin {
  GithubUsersNode();

  factory GithubUsersNode.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersActor with EquatableMixin {
  GithubUsersActor();

  factory GithubUsersActor.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersActorFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersRegistryPackageOwner with EquatableMixin {
  GithubUsersRegistryPackageOwner();

  factory GithubUsersRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubUsersRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersRegistryPackageSearch with EquatableMixin {
  GithubUsersRegistryPackageSearch();

  factory GithubUsersRegistryPackageSearch.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUsersRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubUsersRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersProjectOwner with EquatableMixin {
  GithubUsersProjectOwner();

  factory GithubUsersProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersRepositoryOwner with EquatableMixin {
  GithubUsersRepositoryOwner();

  factory GithubUsersRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersUniformResourceLocatable with EquatableMixin {
  GithubUsersUniformResourceLocatable();

  factory GithubUsersUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUsersUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubUsersUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersProfileOwner with EquatableMixin {
  GithubUsersProfileOwner();

  factory GithubUsersProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersProfileOwnerFromJson(json);

  String login;

  String name;

  String location;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, name, location, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersSponsorable with EquatableMixin {
  GithubUsersSponsorable();

  factory GithubUsersSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersFollowingConnection with EquatableMixin {
  GithubUsersFollowingConnection();

  factory GithubUsersFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersFollowingConnectionFromJson(json);

  GithubUsersPageInfo pageInfo;

  List<GithubUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GithubUsersFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersOrganization extends GithubUsersAuditEntryActor
    with EquatableMixin
    implements
        GithubUsersNode,
        GithubUsersActor,
        GithubUsersRegistryPackageOwner,
        GithubUsersRegistryPackageSearch,
        GithubUsersProjectOwner,
        GithubUsersRepositoryOwner,
        GithubUsersUniformResourceLocatable,
        GithubUsersMemberStatusable,
        GithubUsersProfileOwner,
        GithubUsersSponsorable {
  GithubUsersOrganization();

  factory GithubUsersOrganization.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersOrganizationFromJson(json);

  @override
  String login;

  @override
  String name;

  @override
  String avatarUrl;

  @override
  String location;

  GithubUsersOrganizationMemberConnection membersWithRole;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [login, name, avatarUrl, location, membersWithRole, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersOrganizationMemberConnection with EquatableMixin {
  GithubUsersOrganizationMemberConnection();

  factory GithubUsersOrganizationMemberConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUsersOrganizationMemberConnectionFromJson(json);

  GithubUsersPageInfo pageInfo;

  List<GithubUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubUsersOrganizationMemberConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersMemberStatusable with EquatableMixin {
  GithubUsersMemberStatusable();

  factory GithubUsersMemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersRepository extends GithubUsersPinnableItem
    with EquatableMixin
    implements
        GithubUsersNode,
        GithubUsersProjectOwner,
        GithubUsersRegistryPackageOwner,
        GithubUsersRegistryPackageSearch,
        GithubUsersSubscribable,
        GithubUsersStarrable,
        GithubUsersUniformResourceLocatable,
        GithubUsersRepositoryInfo {
  GithubUsersRepository();

  factory GithubUsersRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersRepositoryFromJson(json);

  GithubUsersUserConnection watchers;

  @override
  GithubUsersStargazerConnection stargazers;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [watchers, stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersUserConnection with EquatableMixin {
  GithubUsersUserConnection();

  factory GithubUsersUserConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersUserConnectionFromJson(json);

  GithubUsersPageInfo pageInfo;

  List<GithubUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GithubUsersUserConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersStargazerConnection with EquatableMixin {
  GithubUsersStargazerConnection();

  factory GithubUsersStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersStargazerConnectionFromJson(json);

  GithubUsersPageInfo pageInfo;

  List<GithubUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GithubUsersStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersPinnableItem with EquatableMixin {
  GithubUsersPinnableItem();

  factory GithubUsersPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubUsersPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersSubscribable with EquatableMixin {
  GithubUsersSubscribable();

  factory GithubUsersSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersStarrable with EquatableMixin {
  GithubUsersStarrable();

  factory GithubUsersStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersStarrableFromJson(json);

  GithubUsersStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersRepositoryInfo with EquatableMixin {
  GithubUsersRepositoryInfo();

  factory GithubUsersRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUsersRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUsersArguments extends JsonSerializable with EquatableMixin {
  GithubUsersArguments(
      {this.login,
      this.repoName,
      this.after,
      this.isFollowers,
      this.isFollowing,
      this.isMember,
      this.isStar,
      this.isWatch});

  factory GithubUsersArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubUsersArgumentsFromJson(json);

  final String login;

  final String repoName;

  final String after;

  final bool isFollowers;

  final bool isFollowing;

  final bool isMember;

  final bool isStar;

  final bool isWatch;

  @override
  List<Object> get props => [
        login,
        repoName,
        after,
        isFollowers,
        isFollowing,
        isMember,
        isStar,
        isWatch
      ];
  Map<String, dynamic> toJson() => _$GithubUsersArgumentsToJson(this);
}

class GithubUsersQuery extends GraphQLQuery<GithubUsers, GithubUsersArguments> {
  GithubUsersQuery({this.variables});

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
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'repoName')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'after')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isFollowers')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isFollowing')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isMember')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isStar')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isWatch')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'user'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'login'),
                    value: VariableNode(name: NameNode(value: 'login')))
              ],
              directives: [
                DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'isMember')))
                ])
              ],
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
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'followers'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'isFollowers')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pageInfo'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'hasNextPage'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'endCursor'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'nodes'),
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
                                name: NameNode(value: 'createdAt'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'following'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'isFollowing')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pageInfo'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'hasNextPage'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'endCursor'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'nodes'),
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
                                name: NameNode(value: 'createdAt'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ])),
          FieldNode(
              name: NameNode(value: 'organization'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'login'),
                    value: VariableNode(name: NameNode(value: 'login')))
              ],
              directives: [
                DirectiveNode(name: NameNode(value: 'include'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'isMember')))
                ])
              ],
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
                    name: NameNode(value: 'location'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'membersWithRole'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after')))
                    ],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pageInfo'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'hasNextPage'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'endCursor'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'nodes'),
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
                                name: NameNode(value: 'createdAt'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ])),
          FieldNode(
              name: NameNode(value: 'repository'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'owner'),
                    value: VariableNode(name: NameNode(value: 'login'))),
                ArgumentNode(
                    name: NameNode(value: 'name'),
                    value: VariableNode(name: NameNode(value: 'repoName')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'watchers'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'isWatch')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pageInfo'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'hasNextPage'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'endCursor'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'nodes'),
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
                                name: NameNode(value: 'createdAt'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'stargazers'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'isStar')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pageInfo'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'hasNextPage'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'endCursor'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'nodes'),
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
                                name: NameNode(value: 'createdAt'),
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
  final String operationName = 'github_users';

  @override
  final GithubUsersArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubUsers parse(Map<String, dynamic> json) => GithubUsers.fromJson(json);
}
