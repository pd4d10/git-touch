// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_commits.g.dart';

mixin TMixin {
  GithubCommitsGitObject target;
}

@JsonSerializable(explicitToJson: true)
class GithubCommits with EquatableMixin {
  GithubCommits();

  factory GithubCommits.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsFromJson(json);

  GithubCommitsRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GithubCommitsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRepository extends GithubCommitsPinnableItem
    with EquatableMixin
    implements
        GithubCommitsNode,
        GithubCommitsProjectOwner,
        GithubCommitsRegistryPackageOwner,
        GithubCommitsRegistryPackageSearch,
        GithubCommitsSubscribable,
        GithubCommitsStarrable,
        GithubCommitsUniformResourceLocatable,
        GithubCommitsRepositoryInfo {
  GithubCommitsRepository();

  factory GithubCommitsRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsRepositoryFromJson(json);

  GithubCommitsRef defaultBranchRef;

  GithubCommitsRef ref;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [defaultBranchRef, ref, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRef
    with EquatableMixin, TMixin
    implements GithubCommitsNode {
  GithubCommitsRef();

  factory GithubCommitsRef.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsRefFromJson(json);

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [target, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsGitObject with EquatableMixin {
  GithubCommitsGitObject();

  factory GithubCommitsGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Commit':
        return GithubCommitsCommit.fromJson(json);
      default:
    }
    return _$GithubCommitsGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Commit':
        return (this as GithubCommitsCommit).toJson();
      default:
    }
    return _$GithubCommitsGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsCommit extends GithubCommitsPullRequestTimelineItem
    with EquatableMixin
    implements
        GithubCommitsNode,
        GithubCommitsGitObject,
        GithubCommitsSubscribable,
        GithubCommitsUniformResourceLocatable {
  GithubCommitsCommit();

  factory GithubCommitsCommit.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsCommitFromJson(json);

  String oid;

  String url;

  String messageHeadline;

  DateTime committedDate;

  GithubCommitsGitActor author;

  GithubCommitsCommitHistoryConnection history;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [oid, url, messageHeadline, committedDate, author, history, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsGitActor with EquatableMixin {
  GithubCommitsGitActor();

  factory GithubCommitsGitActor.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsGitActorFromJson(json);

  String name;

  String avatarUrl;

  GithubCommitsUser user;

  @override
  List<Object> get props => [name, avatarUrl, user];
  Map<String, dynamic> toJson() => _$GithubCommitsGitActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsUser extends GithubCommitsAuditEntryActor
    with EquatableMixin
    implements
        GithubCommitsNode,
        GithubCommitsActor,
        GithubCommitsRegistryPackageOwner,
        GithubCommitsRegistryPackageSearch,
        GithubCommitsProjectOwner,
        GithubCommitsRepositoryOwner,
        GithubCommitsUniformResourceLocatable,
        GithubCommitsProfileOwner,
        GithubCommitsSponsorable {
  GithubCommitsUser();

  factory GithubCommitsUser.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsUserFromJson(json);

  @override
  String login;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsAuditEntryActor with EquatableMixin {
  GithubCommitsAuditEntryActor();

  factory GithubCommitsAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubCommitsAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsNode with EquatableMixin {
  GithubCommitsNode();

  factory GithubCommitsNode.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsActor with EquatableMixin {
  GithubCommitsActor();

  factory GithubCommitsActor.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsActorFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRegistryPackageOwner with EquatableMixin {
  GithubCommitsRegistryPackageOwner();

  factory GithubCommitsRegistryPackageOwner.fromJson(
          Map<String, dynamic> json) =>
      _$GithubCommitsRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubCommitsRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRegistryPackageSearch with EquatableMixin {
  GithubCommitsRegistryPackageSearch();

  factory GithubCommitsRegistryPackageSearch.fromJson(
          Map<String, dynamic> json) =>
      _$GithubCommitsRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubCommitsRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsProjectOwner with EquatableMixin {
  GithubCommitsProjectOwner();

  factory GithubCommitsProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRepositoryOwner with EquatableMixin {
  GithubCommitsRepositoryOwner();

  factory GithubCommitsRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsRepositoryOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsUniformResourceLocatable with EquatableMixin {
  GithubCommitsUniformResourceLocatable();

  factory GithubCommitsUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubCommitsUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubCommitsUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsProfileOwner with EquatableMixin {
  GithubCommitsProfileOwner();

  factory GithubCommitsProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsProfileOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsSponsorable with EquatableMixin {
  GithubCommitsSponsorable();

  factory GithubCommitsSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsCommitHistoryConnection with EquatableMixin {
  GithubCommitsCommitHistoryConnection();

  factory GithubCommitsCommitHistoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubCommitsCommitHistoryConnectionFromJson(json);

  GithubCommitsPageInfo pageInfo;

  List<GithubCommitsCommit> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubCommitsCommitHistoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsPageInfo with EquatableMixin {
  GithubCommitsPageInfo();

  factory GithubCommitsPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GithubCommitsPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsPullRequestTimelineItem with EquatableMixin {
  GithubCommitsPullRequestTimelineItem();

  factory GithubCommitsPullRequestTimelineItem.fromJson(
          Map<String, dynamic> json) =>
      _$GithubCommitsPullRequestTimelineItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() =>
      _$GithubCommitsPullRequestTimelineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsSubscribable with EquatableMixin {
  GithubCommitsSubscribable();

  factory GithubCommitsSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsPinnableItem with EquatableMixin {
  GithubCommitsPinnableItem();

  factory GithubCommitsPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubCommitsPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsStarrable with EquatableMixin {
  GithubCommitsStarrable();

  factory GithubCommitsStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsRepositoryInfo with EquatableMixin {
  GithubCommitsRepositoryInfo();

  factory GithubCommitsRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubCommitsRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubCommitsArguments extends JsonSerializable with EquatableMixin {
  GithubCommitsArguments(
      {this.owner, this.name, this.ref, this.hasRef, this.after});

  factory GithubCommitsArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitsArgumentsFromJson(json);

  final String owner;

  final String name;

  final String ref;

  final bool hasRef;

  final String after;

  @override
  List<Object> get props => [owner, name, ref, hasRef, after];
  Map<String, dynamic> toJson() => _$GithubCommitsArgumentsToJson(this);
}

class GithubCommitsQuery
    extends GraphQLQuery<GithubCommits, GithubCommitsArguments> {
  GithubCommitsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    FragmentDefinitionNode(
        name: NameNode(value: 'T'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(name: NameNode(value: 'Ref'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'target'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'Commit'), isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'oid'),
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
                          name: NameNode(value: 'messageHeadline'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'committedDate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'author'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
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
                                name: NameNode(value: 'user'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'login'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: '__typename'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'history'),
                          alias: null,
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '30')),
                            ArgumentNode(
                                name: NameNode(value: 'after'),
                                value: VariableNode(
                                    name: NameNode(value: 'after')))
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
                                      name: NameNode(value: 'oid'),
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
                                      name: NameNode(value: 'messageHeadline'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'committedDate'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'author'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
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
                                            name: NameNode(value: 'user'),
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
                                                  selectionSet: null)
                                            ]))
                                      ]))
                                ]))
                          ]))
                    ]))
              ]))
        ])),
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
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'ref')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'hasRef')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'after')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'repository'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'owner'),
                    value: VariableNode(name: NameNode(value: 'owner'))),
                ArgumentNode(
                    name: NameNode(value: 'name'),
                    value: VariableNode(name: NameNode(value: 'name')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'defaultBranchRef'),
                    alias: null,
                    arguments: [],
                    directives: [
                      DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                        ArgumentNode(
                            name: NameNode(value: 'if'),
                            value:
                                VariableNode(name: NameNode(value: 'hasRef')))
                      ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'T'), directives: [])
                    ])),
                FieldNode(
                    name: NameNode(value: 'ref'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'qualifiedName'),
                          value: VariableNode(name: NameNode(value: 'ref')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'hasRef')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'T'), directives: [])
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'github_commits';

  @override
  final GithubCommitsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubCommits parse(Map<String, dynamic> json) =>
      GithubCommits.fromJson(json);
}
