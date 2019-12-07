// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_repositories.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubRepositories with EquatableMixin {
  GithubRepositories();

  factory GithubRepositories.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesFromJson(json);

  GithubRepositoriesRepositoryOwner repositoryOwner;

  @override
  List<Object> get props => [repositoryOwner];
  Map<String, dynamic> toJson() => _$GithubRepositoriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRepositoryOwner with EquatableMixin {
  GithubRepositoriesRepositoryOwner();

  factory GithubRepositoriesRepositoryOwner.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'User':
        return GithubRepositoriesUser.fromJson(json);
      case 'Organization':
        return GithubRepositoriesOrganization.fromJson(json);
      default:
    }
    return _$GithubRepositoriesRepositoryOwnerFromJson(json);
  }

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'User':
        return (this as GithubRepositoriesUser).toJson();
      case 'Organization':
        return (this as GithubRepositoriesOrganization).toJson();
      default:
    }
    return _$GithubRepositoriesRepositoryOwnerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesUser extends GithubRepositoriesAuditEntryActor
    with EquatableMixin
    implements
        GithubRepositoriesNode,
        GithubRepositoriesActor,
        GithubRepositoriesRegistryPackageOwner,
        GithubRepositoriesRegistryPackageSearch,
        GithubRepositoriesProjectOwner,
        GithubRepositoriesRepositoryOwner,
        GithubRepositoriesUniformResourceLocatable,
        GithubRepositoriesProfileOwner,
        GithubRepositoriesSponsorable {
  GithubRepositoriesUser();

  factory GithubRepositoriesUser.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesUserFromJson(json);

  GithubRepositoriesRepositoryConnection repositories;

  GithubRepositoriesStarredRepositoryConnection starredRepositories;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  String login;

  @override
  String avatarUrl;

  @override
  List<Object> get props =>
      [repositories, starredRepositories, resolveType, login, avatarUrl];
  Map<String, dynamic> toJson() => _$GithubRepositoriesUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRepositoryConnection with EquatableMixin {
  GithubRepositoriesRepositoryConnection();

  factory GithubRepositoriesRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesRepositoryConnectionFromJson(json);

  int totalCount;

  GithubRepositoriesPageInfo pageInfo;

  List<GithubRepositoriesRepository> nodes;

  @override
  List<Object> get props => [totalCount, pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesPageInfo with EquatableMixin {
  GithubRepositoriesPageInfo();

  factory GithubRepositoriesPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GithubRepositoriesPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRepository extends GithubRepositoriesPinnableItem
    with EquatableMixin
    implements
        GithubRepositoriesNode,
        GithubRepositoriesProjectOwner,
        GithubRepositoriesRegistryPackageOwner,
        GithubRepositoriesRegistryPackageSearch,
        GithubRepositoriesSubscribable,
        GithubRepositoriesStarrable,
        GithubRepositoriesUniformResourceLocatable,
        GithubRepositoriesRepositoryInfo {
  GithubRepositoriesRepository();

  factory GithubRepositoriesRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesRepositoryFromJson(json);

  @override
  GithubRepositoriesRepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  GithubRepositoriesStargazerConnection stargazers;

  GithubRepositoriesRepositoryConnection forks;

  GithubRepositoriesLanguage primaryLanguage;

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
  Map<String, dynamic> toJson() => _$GithubRepositoriesRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesStargazerConnection with EquatableMixin {
  GithubRepositoriesStargazerConnection();

  factory GithubRepositoriesStargazerConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesLanguage
    with EquatableMixin
    implements GithubRepositoriesNode {
  GithubRepositoriesLanguage();

  factory GithubRepositoriesLanguage.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesNode with EquatableMixin {
  GithubRepositoriesNode();

  factory GithubRepositoriesNode.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesPinnableItem with EquatableMixin {
  GithubRepositoriesPinnableItem();

  factory GithubRepositoriesPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubRepositoriesPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesProjectOwner with EquatableMixin {
  GithubRepositoriesProjectOwner();

  factory GithubRepositoriesProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRegistryPackageOwner with EquatableMixin {
  GithubRepositoriesRegistryPackageOwner();

  factory GithubRepositoriesRegistryPackageOwner.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRegistryPackageSearch with EquatableMixin {
  GithubRepositoriesRegistryPackageSearch();

  factory GithubRepositoriesRegistryPackageSearch.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesSubscribable with EquatableMixin {
  GithubRepositoriesSubscribable();

  factory GithubRepositoriesSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesStarrable with EquatableMixin {
  GithubRepositoriesStarrable();

  factory GithubRepositoriesStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesStarrableFromJson(json);

  GithubRepositoriesStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesUniformResourceLocatable with EquatableMixin {
  GithubRepositoriesUniformResourceLocatable();

  factory GithubRepositoriesUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesRepositoryInfo with EquatableMixin {
  GithubRepositoriesRepositoryInfo();

  factory GithubRepositoriesRepositoryInfo.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesRepositoryInfoFromJson(json);

  GithubRepositoriesRepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesStarredRepositoryConnection with EquatableMixin {
  GithubRepositoriesStarredRepositoryConnection();

  factory GithubRepositoriesStarredRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesStarredRepositoryConnectionFromJson(json);

  GithubRepositoriesPageInfo pageInfo;

  List<GithubRepositoriesRepository> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesStarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesAuditEntryActor with EquatableMixin {
  GithubRepositoriesAuditEntryActor();

  factory GithubRepositoriesAuditEntryActor.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesActor with EquatableMixin {
  GithubRepositoriesActor();

  factory GithubRepositoriesActor.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesActorFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesProfileOwner with EquatableMixin {
  GithubRepositoriesProfileOwner();

  factory GithubRepositoriesProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesProfileOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesSponsorable with EquatableMixin {
  GithubRepositoriesSponsorable();

  factory GithubRepositoriesSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoriesSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesOrganization extends GithubRepositoriesAuditEntryActor
    with EquatableMixin
    implements
        GithubRepositoriesNode,
        GithubRepositoriesActor,
        GithubRepositoriesRegistryPackageOwner,
        GithubRepositoriesRegistryPackageSearch,
        GithubRepositoriesProjectOwner,
        GithubRepositoriesRepositoryOwner,
        GithubRepositoriesUniformResourceLocatable,
        GithubRepositoriesMemberStatusable,
        GithubRepositoriesProfileOwner,
        GithubRepositoriesSponsorable {
  GithubRepositoriesOrganization();

  factory GithubRepositoriesOrganization.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesOrganizationFromJson(json);

  GithubRepositoriesPinnableItemConnection pinnableItems;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  String login;

  @override
  String avatarUrl;

  @override
  List<Object> get props => [pinnableItems, resolveType, login, avatarUrl];
  Map<String, dynamic> toJson() => _$GithubRepositoriesOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesPinnableItemConnection with EquatableMixin {
  GithubRepositoriesPinnableItemConnection();

  factory GithubRepositoriesPinnableItemConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesPinnableItemConnectionFromJson(json);

  GithubRepositoriesPageInfo pageInfo;

  List<GithubRepositoriesPinnableItem> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesPinnableItemConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesMemberStatusable with EquatableMixin {
  GithubRepositoriesMemberStatusable();

  factory GithubRepositoriesMemberStatusable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoriesMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoriesMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoriesArguments extends JsonSerializable with EquatableMixin {
  GithubRepositoriesArguments({this.owner, this.after, this.isStar});

  factory GithubRepositoriesArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesArgumentsFromJson(json);

  final String owner;

  final String after;

  final bool isStar;

  @override
  List<Object> get props => [owner, after, isStar];
  Map<String, dynamic> toJson() => _$GithubRepositoriesArgumentsToJson(this);
}

class GithubRepositoriesQuery
    extends GraphQLQuery<GithubRepositories, GithubRepositoriesArguments> {
  GithubRepositoriesQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: null,
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'owner')),
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
              variable: VariableNode(name: NameNode(value: 'isStar')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
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
                    value: VariableNode(name: NameNode(value: 'owner')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
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
                    selectionSet: null),
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'User'), isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'repositories'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '30')),
                            ArgumentNode(
                                name: NameNode(value: 'after'),
                                value: VariableNode(
                                    name: NameNode(value: 'after'))),
                            ArgumentNode(
                                name: NameNode(value: 'orderBy'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                      name: NameNode(value: 'field'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'UPDATED_AT'))),
                                  ObjectFieldNode(
                                      name: NameNode(value: 'direction'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'DESC')))
                                ]))
                          ],
                          directives: [
                            DirectiveNode(
                                name: NameNode(value: 'skip'),
                                arguments: [
                                  ArgumentNode(
                                      name: NameNode(value: 'if'),
                                      value: VariableNode(
                                          name: NameNode(value: 'isStar')))
                                ])
                          ],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'totalCount'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
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
                                      name: NameNode(value: 'owner'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
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
                          name: NameNode(value: 'starredRepositories'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '30')),
                            ArgumentNode(
                                name: NameNode(value: 'after'),
                                value: VariableNode(
                                    name: NameNode(value: 'after'))),
                            ArgumentNode(
                                name: NameNode(value: 'orderBy'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                      name: NameNode(value: 'field'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'STARRED_AT'))),
                                  ObjectFieldNode(
                                      name: NameNode(value: 'direction'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'DESC')))
                                ]))
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
                                      name: NameNode(value: 'owner'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
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
                          ]))
                    ])),
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'Organization'),
                            isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'pinnableItems'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '30')),
                            ArgumentNode(
                                name: NameNode(value: 'after'),
                                value: VariableNode(
                                    name: NameNode(value: 'after'))),
                            ArgumentNode(
                                name: NameNode(value: 'types'),
                                value: ListValueNode(values: [
                                  EnumValueNode(
                                      name: NameNode(value: 'REPOSITORY'))
                                ]))
                          ],
                          directives: [
                            DirectiveNode(
                                name: NameNode(value: 'skip'),
                                arguments: [
                                  ArgumentNode(
                                      name: NameNode(value: 'if'),
                                      value: VariableNode(
                                          name: NameNode(value: 'isStar')))
                                ])
                          ],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
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
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'github_repositories';

  @override
  final GithubRepositoriesArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubRepositories parse(Map<String, dynamic> json) =>
      GithubRepositories.fromJson(json);
}
