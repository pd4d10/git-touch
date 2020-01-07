// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'gh.g.dart';

@JsonSerializable(explicitToJson: true)
class GhRepo with EquatableMixin {
  GhRepo();

  factory GhRepo.fromJson(Map<String, dynamic> json) => _$GhRepoFromJson(json);

  GhRepoRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GhRepoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepository extends GhRepoPinnableItem
    with EquatableMixin
    implements
        GhRepoNode,
        GhRepoProjectOwner,
        GhRepoRegistryPackageOwner,
        GhRepoRegistryPackageSearch,
        GhRepoSubscribable,
        GhRepoStarrable,
        GhRepoUniformResourceLocatable,
        GhRepoRepositoryInfo {
  GhRepoRepository();

  factory GhRepoRepository.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryFromJson(json);

  @override
  GhRepoRepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  String homepageUrl;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  GhRepoStargazerConnection stargazers;

  GhRepoRepositoryConnection forks;

  GhRepoLanguage primaryLanguage;

  @override
  String id;

  int diskUsage;

  @override
  bool hasIssuesEnabled;

  @override
  String url;

  @override
  bool viewerHasStarred;

  @override
  String projectsUrl;

  GhRepoUserConnection watchers;

  GhRepoIssueConnection issues;

  GhRepoPullRequestConnection pullRequests;

  @override
  GhRepoProjectConnection projects;

  GhRepoReleaseConnection releases;

  GhRepoLanguageConnection languages;

  GhRepoRef defaultBranchRef;

  GhRepoRef ref;

  GhRepoRefConnection refs;

  @override
  GhRepoLicense licenseInfo;

  GhRepoRepositoryTopicConnection repositoryTopics;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        owner,
        name,
        description,
        homepageUrl,
        isPrivate,
        isFork,
        stargazers,
        forks,
        primaryLanguage,
        id,
        diskUsage,
        hasIssuesEnabled,
        url,
        viewerHasStarred,
        projectsUrl,
        watchers,
        issues,
        pullRequests,
        projects,
        releases,
        languages,
        defaultBranchRef,
        ref,
        refs,
        licenseInfo,
        repositoryTopics,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryOwner with EquatableMixin {
  GhRepoRepositoryOwner();

  factory GhRepoRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoStargazerConnection with EquatableMixin {
  GhRepoStargazerConnection();

  factory GhRepoStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryConnection with EquatableMixin {
  GhRepoRepositoryConnection();

  factory GhRepoRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLanguage with EquatableMixin implements GhRepoNode {
  GhRepoLanguage();

  factory GhRepoLanguage.fromJson(Map<String, dynamic> json) =>
      _$GhRepoLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoNode with EquatableMixin {
  GhRepoNode();

  factory GhRepoNode.fromJson(Map<String, dynamic> json) =>
      _$GhRepoNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhRepoNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoUserConnection with EquatableMixin {
  GhRepoUserConnection();

  factory GhRepoUserConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoUserConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoUserConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoIssueConnection with EquatableMixin {
  GhRepoIssueConnection();

  factory GhRepoIssueConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoIssueConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoIssueConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoPullRequestConnection with EquatableMixin {
  GhRepoPullRequestConnection();

  factory GhRepoPullRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoPullRequestConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoPullRequestConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoProjectConnection with EquatableMixin {
  GhRepoProjectConnection();

  factory GhRepoProjectConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoProjectConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoProjectConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoReleaseConnection with EquatableMixin {
  GhRepoReleaseConnection();

  factory GhRepoReleaseConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoReleaseConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoReleaseConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLanguageConnection with EquatableMixin {
  GhRepoLanguageConnection();

  factory GhRepoLanguageConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoLanguageConnectionFromJson(json);

  int totalSize;

  List<GhRepoLanguageEdge> edges;

  @override
  List<Object> get props => [totalSize, edges];
  Map<String, dynamic> toJson() => _$GhRepoLanguageConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLanguageEdge with EquatableMixin {
  GhRepoLanguageEdge();

  factory GhRepoLanguageEdge.fromJson(Map<String, dynamic> json) =>
      _$GhRepoLanguageEdgeFromJson(json);

  int size;

  GhRepoLanguage node;

  @override
  List<Object> get props => [size, node];
  Map<String, dynamic> toJson() => _$GhRepoLanguageEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRef with EquatableMixin implements GhRepoNode {
  GhRepoRef();

  factory GhRepoRef.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRefFromJson(json);

  String name;

  GhRepoGitObject target;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, target, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoGitObject with EquatableMixin {
  GhRepoGitObject();

  factory GhRepoGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Commit':
        return GhRepoCommit.fromJson(json);
      default:
    }
    return _$GhRepoGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Commit':
        return (this as GhRepoCommit).toJson();
      default:
    }
    return _$GhRepoGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GhRepoCommit extends GhRepoPullRequestTimelineItem
    with EquatableMixin
    implements
        GhRepoNode,
        GhRepoGitObject,
        GhRepoSubscribable,
        GhRepoUniformResourceLocatable {
  GhRepoCommit();

  factory GhRepoCommit.fromJson(Map<String, dynamic> json) =>
      _$GhRepoCommitFromJson(json);

  GhRepoCommitHistoryConnection history;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [history, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoCommitHistoryConnection with EquatableMixin {
  GhRepoCommitHistoryConnection();

  factory GhRepoCommitHistoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoCommitHistoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoCommitHistoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoPullRequestTimelineItem with EquatableMixin {
  GhRepoPullRequestTimelineItem();

  factory GhRepoPullRequestTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$GhRepoPullRequestTimelineItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhRepoPullRequestTimelineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoSubscribable with EquatableMixin {
  GhRepoSubscribable();

  factory GhRepoSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhRepoSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhRepoSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoUniformResourceLocatable with EquatableMixin {
  GhRepoUniformResourceLocatable();

  factory GhRepoUniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$GhRepoUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhRepoUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRefConnection with EquatableMixin {
  GhRepoRefConnection();

  factory GhRepoRefConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRefConnectionFromJson(json);

  int totalCount;

  List<GhRepoRef> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$GhRepoRefConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLicense with EquatableMixin implements GhRepoNode {
  GhRepoLicense();

  factory GhRepoLicense.fromJson(Map<String, dynamic> json) =>
      _$GhRepoLicenseFromJson(json);

  String name;

  String spdxId;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, spdxId, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoLicenseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryTopicConnection with EquatableMixin {
  GhRepoRepositoryTopicConnection();

  factory GhRepoRepositoryTopicConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryTopicConnectionFromJson(json);

  List<GhRepoRepositoryTopic> nodes;

  @override
  List<Object> get props => [nodes];
  Map<String, dynamic> toJson() =>
      _$GhRepoRepositoryTopicConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryTopic
    with EquatableMixin
    implements GhRepoNode, GhRepoUniformResourceLocatable {
  GhRepoRepositoryTopic();

  factory GhRepoRepositoryTopic.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryTopicFromJson(json);

  @override
  String url;

  GhRepoTopic topic;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [url, topic, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryTopicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoTopic with EquatableMixin implements GhRepoNode, GhRepoStarrable {
  GhRepoTopic();

  factory GhRepoTopic.fromJson(Map<String, dynamic> json) =>
      _$GhRepoTopicFromJson(json);

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoTopicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoStarrable with EquatableMixin {
  GhRepoStarrable();

  factory GhRepoStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhRepoStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhRepoStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoPinnableItem with EquatableMixin {
  GhRepoPinnableItem();

  factory GhRepoPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhRepoPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhRepoPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoProjectOwner with EquatableMixin {
  GhRepoProjectOwner();

  factory GhRepoProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhRepoProjectOwnerFromJson(json);

  String id;

  String projectsUrl;

  GhRepoProjectConnection projects;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, projectsUrl, projects, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRegistryPackageOwner with EquatableMixin {
  GhRepoRegistryPackageOwner();

  factory GhRepoRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRegistryPackageOwnerFromJson(json);

  String id;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRegistryPackageSearch with EquatableMixin {
  GhRepoRegistryPackageSearch();

  factory GhRepoRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRegistryPackageSearchFromJson(json);

  String id;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() => _$GhRepoRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryInfo with EquatableMixin {
  GhRepoRepositoryInfo();

  factory GhRepoRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryInfoFromJson(json);

  GhRepoRepositoryOwner owner;

  String name;

  String description;

  String homepageUrl;

  bool isPrivate;

  bool isFork;

  bool hasIssuesEnabled;

  String url;

  GhRepoLicense licenseInfo;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        owner,
        name,
        description,
        homepageUrl,
        isPrivate,
        isFork,
        hasIssuesEnabled,
        url,
        licenseInfo,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoArguments extends JsonSerializable with EquatableMixin {
  GhRepoArguments({this.owner, this.name, this.branchSpecified, this.branch});

  factory GhRepoArguments.fromJson(Map<String, dynamic> json) =>
      _$GhRepoArgumentsFromJson(json);

  final String owner;

  final String name;

  final bool branchSpecified;

  final String branch;

  @override
  List<Object> get props => [owner, name, branchSpecified, branch];
  Map<String, dynamic> toJson() => _$GhRepoArgumentsToJson(this);
}

class GhRepoQuery extends GraphQLQuery<GhRepo, GhRepoArguments> {
  GhRepoQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhRepo'),
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
              variable: VariableNode(name: NameNode(value: 'branchSpecified')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'branch')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
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
                    name: NameNode(value: 'owner'),
                    alias: null,
                    arguments: [],
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
                    name: NameNode(value: 'homepageUrl'),
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
                    selectionSet: SelectionSetNode(selections: [
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
                    selectionSet: SelectionSetNode(selections: [
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
                    selectionSet: SelectionSetNode(selections: [
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
                    ])),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'diskUsage'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'hasIssuesEnabled'),
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
                    name: NameNode(value: 'viewerHasStarred'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'projectsUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'watchers'),
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
                    name: NameNode(value: 'issues'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'states'),
                          value: EnumValueNode(name: NameNode(value: 'OPEN')))
                    ],
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
                    name: NameNode(value: 'pullRequests'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'states'),
                          value: EnumValueNode(name: NameNode(value: 'OPEN')))
                    ],
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
                    name: NameNode(value: 'projects'),
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
                    name: NameNode(value: 'releases'),
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
                    name: NameNode(value: 'languages'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '10')),
                      ArgumentNode(
                          name: NameNode(value: 'orderBy'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'field'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'SIZE'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'direction'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'DESC')))
                          ]))
                    ],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'totalSize'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'edges'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'size'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'node'),
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
                                      name: NameNode(value: 'color'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'defaultBranchRef'),
                    alias: null,
                    arguments: [],
                    directives: [
                      DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                        ArgumentNode(
                            name: NameNode(value: 'if'),
                            value: VariableNode(
                                name: NameNode(value: 'branchSpecified')))
                      ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'target'),
                          alias: null,
                          arguments: [],
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
                                        name: NameNode(value: 'Commit'),
                                        isNonNull: false)),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'history'),
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
                                      ]))
                                ]))
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'ref'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'qualifiedName'),
                          value: VariableNode(name: NameNode(value: 'branch')))
                    ],
                    directives: [
                      DirectiveNode(
                          name: NameNode(value: 'include'),
                          arguments: [
                            ArgumentNode(
                                name: NameNode(value: 'if'),
                                value: VariableNode(
                                    name: NameNode(value: 'branchSpecified')))
                          ])
                    ],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'target'),
                          alias: null,
                          arguments: [],
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
                                        name: NameNode(value: 'Commit'),
                                        isNonNull: false)),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'history'),
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
                                      ]))
                                ]))
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'refs'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '100')),
                      ArgumentNode(
                          name: NameNode(value: 'refPrefix'),
                          value: StringValueNode(
                              value: 'refs/heads/', isBlock: false))
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
                                name: NameNode(value: 'name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'licenseInfo'),
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
                          name: NameNode(value: 'spdxId'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'repositoryTopics'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '10'))
                    ],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'nodes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'url'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'topic'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
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
  ]);

  @override
  final String operationName = 'GhRepo';

  @override
  final GhRepoArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhRepo parse(Map<String, dynamic> json) => GhRepo.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhUsers with EquatableMixin {
  GhUsers();

  factory GhUsers.fromJson(Map<String, dynamic> json) =>
      _$GhUsersFromJson(json);

  GhUsersUser user;

  GhUsersOrganization organization;

  GhUsersRepository repository;

  @override
  List<Object> get props => [user, organization, repository];
  Map<String, dynamic> toJson() => _$GhUsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersUser extends GhUsersAuditEntryActor
    with EquatableMixin
    implements
        GhUsersNode,
        GhUsersActor,
        GhUsersRegistryPackageOwner,
        GhUsersRegistryPackageSearch,
        GhUsersProjectOwner,
        GhUsersRepositoryOwner,
        GhUsersUniformResourceLocatable,
        GhUsersProfileOwner,
        GhUsersSponsorable {
  GhUsersUser();

  factory GhUsersUser.fromJson(Map<String, dynamic> json) =>
      _$GhUsersUserFromJson(json);

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

  GhUsersFollowerConnection followers;

  GhUsersFollowingConnection following;

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
  Map<String, dynamic> toJson() => _$GhUsersUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersFollowerConnection with EquatableMixin {
  GhUsersFollowerConnection();

  factory GhUsersFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUsersFollowerConnectionFromJson(json);

  GhUsersPageInfo pageInfo;

  List<GhUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhUsersFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersPageInfo with EquatableMixin {
  GhUsersPageInfo();

  factory GhUsersPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GhUsersPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GhUsersPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersAuditEntryActor with EquatableMixin {
  GhUsersAuditEntryActor();

  factory GhUsersAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GhUsersAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhUsersAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersNode with EquatableMixin {
  GhUsersNode();

  factory GhUsersNode.fromJson(Map<String, dynamic> json) =>
      _$GhUsersNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersActor with EquatableMixin {
  GhUsersActor();

  factory GhUsersActor.fromJson(Map<String, dynamic> json) =>
      _$GhUsersActorFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersRegistryPackageOwner with EquatableMixin {
  GhUsersRegistryPackageOwner();

  factory GhUsersRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUsersRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersRegistryPackageSearch with EquatableMixin {
  GhUsersRegistryPackageSearch();

  factory GhUsersRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhUsersRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersProjectOwner with EquatableMixin {
  GhUsersProjectOwner();

  factory GhUsersProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUsersProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersRepositoryOwner with EquatableMixin {
  GhUsersRepositoryOwner();

  factory GhUsersRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUsersRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersUniformResourceLocatable with EquatableMixin {
  GhUsersUniformResourceLocatable();

  factory GhUsersUniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$GhUsersUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhUsersUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersProfileOwner with EquatableMixin {
  GhUsersProfileOwner();

  factory GhUsersProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUsersProfileOwnerFromJson(json);

  String login;

  String name;

  String location;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, name, location, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersSponsorable with EquatableMixin {
  GhUsersSponsorable();

  factory GhUsersSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GhUsersSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersFollowingConnection with EquatableMixin {
  GhUsersFollowingConnection();

  factory GhUsersFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUsersFollowingConnectionFromJson(json);

  GhUsersPageInfo pageInfo;

  List<GhUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhUsersFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersOrganization extends GhUsersAuditEntryActor
    with EquatableMixin
    implements
        GhUsersNode,
        GhUsersActor,
        GhUsersRegistryPackageOwner,
        GhUsersRegistryPackageSearch,
        GhUsersProjectOwner,
        GhUsersRepositoryOwner,
        GhUsersUniformResourceLocatable,
        GhUsersMemberStatusable,
        GhUsersProfileOwner,
        GhUsersSponsorable {
  GhUsersOrganization();

  factory GhUsersOrganization.fromJson(Map<String, dynamic> json) =>
      _$GhUsersOrganizationFromJson(json);

  @override
  String login;

  @override
  String name;

  @override
  String avatarUrl;

  @override
  String location;

  GhUsersOrganizationMemberConnection membersWithRole;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [login, name, avatarUrl, location, membersWithRole, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersOrganizationMemberConnection with EquatableMixin {
  GhUsersOrganizationMemberConnection();

  factory GhUsersOrganizationMemberConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GhUsersOrganizationMemberConnectionFromJson(json);

  GhUsersPageInfo pageInfo;

  List<GhUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GhUsersOrganizationMemberConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersMemberStatusable with EquatableMixin {
  GhUsersMemberStatusable();

  factory GhUsersMemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$GhUsersMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersRepository extends GhUsersPinnableItem
    with EquatableMixin
    implements
        GhUsersNode,
        GhUsersProjectOwner,
        GhUsersRegistryPackageOwner,
        GhUsersRegistryPackageSearch,
        GhUsersSubscribable,
        GhUsersStarrable,
        GhUsersUniformResourceLocatable,
        GhUsersRepositoryInfo {
  GhUsersRepository();

  factory GhUsersRepository.fromJson(Map<String, dynamic> json) =>
      _$GhUsersRepositoryFromJson(json);

  GhUsersUserConnection watchers;

  @override
  GhUsersStargazerConnection stargazers;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [watchers, stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersUserConnection with EquatableMixin {
  GhUsersUserConnection();

  factory GhUsersUserConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUsersUserConnectionFromJson(json);

  GhUsersPageInfo pageInfo;

  List<GhUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhUsersUserConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersStargazerConnection with EquatableMixin {
  GhUsersStargazerConnection();

  factory GhUsersStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUsersStargazerConnectionFromJson(json);

  GhUsersPageInfo pageInfo;

  List<GhUsersUser> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhUsersStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersPinnableItem with EquatableMixin {
  GhUsersPinnableItem();

  factory GhUsersPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhUsersPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhUsersPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersSubscribable with EquatableMixin {
  GhUsersSubscribable();

  factory GhUsersSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhUsersSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersStarrable with EquatableMixin {
  GhUsersStarrable();

  factory GhUsersStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhUsersStarrableFromJson(json);

  GhUsersStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GhUsersStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersRepositoryInfo with EquatableMixin {
  GhUsersRepositoryInfo();

  factory GhUsersRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhUsersRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUsersRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUsersArguments extends JsonSerializable with EquatableMixin {
  GhUsersArguments(
      {this.login,
      this.repoName,
      this.after,
      this.isFollowers,
      this.isFollowing,
      this.isMember,
      this.isStar,
      this.isWatch});

  factory GhUsersArguments.fromJson(Map<String, dynamic> json) =>
      _$GhUsersArgumentsFromJson(json);

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
  Map<String, dynamic> toJson() => _$GhUsersArgumentsToJson(this);
}

class GhUsersQuery extends GraphQLQuery<GhUsers, GhUsersArguments> {
  GhUsersQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhUsers'),
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
  final String operationName = 'GhUsers';

  @override
  final GhUsersArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhUsers parse(Map<String, dynamic> json) => GhUsers.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhRepos with EquatableMixin {
  GhRepos();

  factory GhRepos.fromJson(Map<String, dynamic> json) =>
      _$GhReposFromJson(json);

  GhReposRepositoryOwner repositoryOwner;

  @override
  List<Object> get props => [repositoryOwner];
  Map<String, dynamic> toJson() => _$GhReposToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepositoryOwner with EquatableMixin {
  GhReposRepositoryOwner();

  factory GhReposRepositoryOwner.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'User':
        return GhReposUser.fromJson(json);
      case 'Organization':
        return GhReposOrganization.fromJson(json);
      default:
    }
    return _$GhReposRepositoryOwnerFromJson(json);
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
        return (this as GhReposUser).toJson();
      case 'Organization':
        return (this as GhReposOrganization).toJson();
      default:
    }
    return _$GhReposRepositoryOwnerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GhReposUser extends GhReposAuditEntryActor
    with EquatableMixin
    implements
        GhReposNode,
        GhReposActor,
        GhReposRegistryPackageOwner,
        GhReposRegistryPackageSearch,
        GhReposProjectOwner,
        GhReposRepositoryOwner,
        GhReposUniformResourceLocatable,
        GhReposProfileOwner,
        GhReposSponsorable {
  GhReposUser();

  factory GhReposUser.fromJson(Map<String, dynamic> json) =>
      _$GhReposUserFromJson(json);

  GhReposRepositoryConnection repositories;

  GhReposStarredRepositoryConnection starredRepositories;

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
  Map<String, dynamic> toJson() => _$GhReposUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepositoryConnection with EquatableMixin {
  GhReposRepositoryConnection();

  factory GhReposRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GhReposRepositoryConnectionFromJson(json);

  int totalCount;

  GhReposPageInfo pageInfo;

  List<GhReposRepository> nodes;

  @override
  List<Object> get props => [totalCount, pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhReposRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposPageInfo with EquatableMixin {
  GhReposPageInfo();

  factory GhReposPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GhReposPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GhReposPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepository extends GhReposPinnableItem
    with EquatableMixin
    implements
        GhReposNode,
        GhReposProjectOwner,
        GhReposRegistryPackageOwner,
        GhReposRegistryPackageSearch,
        GhReposSubscribable,
        GhReposStarrable,
        GhReposUniformResourceLocatable,
        GhReposRepositoryInfo {
  GhReposRepository();

  factory GhReposRepository.fromJson(Map<String, dynamic> json) =>
      _$GhReposRepositoryFromJson(json);

  @override
  GhReposRepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  GhReposStargazerConnection stargazers;

  GhReposRepositoryConnection forks;

  GhReposLanguage primaryLanguage;

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
  Map<String, dynamic> toJson() => _$GhReposRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposStargazerConnection with EquatableMixin {
  GhReposStargazerConnection();

  factory GhReposStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhReposStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhReposStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposLanguage with EquatableMixin implements GhReposNode {
  GhReposLanguage();

  factory GhReposLanguage.fromJson(Map<String, dynamic> json) =>
      _$GhReposLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GhReposLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposNode with EquatableMixin {
  GhReposNode();

  factory GhReposNode.fromJson(Map<String, dynamic> json) =>
      _$GhReposNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposPinnableItem with EquatableMixin {
  GhReposPinnableItem();

  factory GhReposPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhReposPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhReposPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposProjectOwner with EquatableMixin {
  GhReposProjectOwner();

  factory GhReposProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhReposProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRegistryPackageOwner with EquatableMixin {
  GhReposRegistryPackageOwner();

  factory GhReposRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhReposRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRegistryPackageSearch with EquatableMixin {
  GhReposRegistryPackageSearch();

  factory GhReposRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhReposRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposSubscribable with EquatableMixin {
  GhReposSubscribable();

  factory GhReposSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhReposSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposStarrable with EquatableMixin {
  GhReposStarrable();

  factory GhReposStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhReposStarrableFromJson(json);

  GhReposStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GhReposStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposUniformResourceLocatable with EquatableMixin {
  GhReposUniformResourceLocatable();

  factory GhReposUniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$GhReposUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhReposUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepositoryInfo with EquatableMixin {
  GhReposRepositoryInfo();

  factory GhReposRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhReposRepositoryInfoFromJson(json);

  GhReposRepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, resolveType];
  Map<String, dynamic> toJson() => _$GhReposRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposStarredRepositoryConnection with EquatableMixin {
  GhReposStarredRepositoryConnection();

  factory GhReposStarredRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GhReposStarredRepositoryConnectionFromJson(json);

  GhReposPageInfo pageInfo;

  List<GhReposRepository> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GhReposStarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposAuditEntryActor with EquatableMixin {
  GhReposAuditEntryActor();

  factory GhReposAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GhReposAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhReposAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposActor with EquatableMixin {
  GhReposActor();

  factory GhReposActor.fromJson(Map<String, dynamic> json) =>
      _$GhReposActorFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposProfileOwner with EquatableMixin {
  GhReposProfileOwner();

  factory GhReposProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GhReposProfileOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposSponsorable with EquatableMixin {
  GhReposSponsorable();

  factory GhReposSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GhReposSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposOrganization extends GhReposAuditEntryActor
    with EquatableMixin
    implements
        GhReposNode,
        GhReposActor,
        GhReposRegistryPackageOwner,
        GhReposRegistryPackageSearch,
        GhReposProjectOwner,
        GhReposRepositoryOwner,
        GhReposUniformResourceLocatable,
        GhReposMemberStatusable,
        GhReposProfileOwner,
        GhReposSponsorable {
  GhReposOrganization();

  factory GhReposOrganization.fromJson(Map<String, dynamic> json) =>
      _$GhReposOrganizationFromJson(json);

  GhReposPinnableItemConnection pinnableItems;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  String login;

  @override
  String avatarUrl;

  @override
  List<Object> get props => [pinnableItems, resolveType, login, avatarUrl];
  Map<String, dynamic> toJson() => _$GhReposOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposPinnableItemConnection with EquatableMixin {
  GhReposPinnableItemConnection();

  factory GhReposPinnableItemConnection.fromJson(Map<String, dynamic> json) =>
      _$GhReposPinnableItemConnectionFromJson(json);

  GhReposPageInfo pageInfo;

  List<GhReposPinnableItem> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhReposPinnableItemConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposMemberStatusable with EquatableMixin {
  GhReposMemberStatusable();

  factory GhReposMemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$GhReposMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhReposMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposArguments extends JsonSerializable with EquatableMixin {
  GhReposArguments({this.owner, this.after, this.isStar});

  factory GhReposArguments.fromJson(Map<String, dynamic> json) =>
      _$GhReposArgumentsFromJson(json);

  final String owner;

  final String after;

  final bool isStar;

  @override
  List<Object> get props => [owner, after, isStar];
  Map<String, dynamic> toJson() => _$GhReposArgumentsToJson(this);
}

class GhReposQuery extends GraphQLQuery<GhRepos, GhReposArguments> {
  GhReposQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhRepos'),
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
  final String operationName = 'GhRepos';

  @override
  final GhReposArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhRepos parse(Map<String, dynamic> json) => GhRepos.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhUser with EquatableMixin {
  GhUser();

  factory GhUser.fromJson(Map<String, dynamic> json) => _$GhUserFromJson(json);

  GhUserRepositoryOwner repositoryOwner;

  GhUserUser viewer;

  @override
  List<Object> get props => [repositoryOwner, viewer];
  Map<String, dynamic> toJson() => _$GhUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepositoryOwner with EquatableMixin {
  GhUserRepositoryOwner();

  factory GhUserRepositoryOwner.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'User':
        return GhUserUser.fromJson(json);
      case 'Organization':
        return GhUserOrganization.fromJson(json);
      default:
    }
    return _$GhUserRepositoryOwnerFromJson(json);
  }

  String login;

  String avatarUrl;

  String url;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, url, resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'User':
        return (this as GhUserUser).toJson();
      case 'Organization':
        return (this as GhUserOrganization).toJson();
      default:
    }
    return _$GhUserRepositoryOwnerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GhUserUser extends GhUserAuditEntryActor
    with EquatableMixin
    implements
        GhUserNode,
        GhUserActor,
        GhUserRegistryPackageOwner,
        GhUserRegistryPackageSearch,
        GhUserProjectOwner,
        GhUserRepositoryOwner,
        GhUserUniformResourceLocatable,
        GhUserProfileOwner,
        GhUserSponsorable {
  GhUserUser();

  factory GhUserUser.fromJson(Map<String, dynamic> json) =>
      _$GhUserUserFromJson(json);

  String name;

  String bio;

  String company;

  String location;

  String email;

  DateTime createdAt;

  String websiteUrl;

  GhUserStarredRepositoryConnection starredRepositories;

  GhUserFollowerConnection followers;

  GhUserFollowingConnection following;

  GhUserContributionsCollection contributionsCollection;

  GhUserRepositoryConnection repositories;

  GhUserPinnableItemConnection pinnedItems;

  bool viewerCanFollow;

  bool viewerIsFollowing;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  String login;

  @override
  String avatarUrl;

  @override
  String url;

  @override
  List<Object> get props => [
        name,
        bio,
        company,
        location,
        email,
        createdAt,
        websiteUrl,
        starredRepositories,
        followers,
        following,
        contributionsCollection,
        repositories,
        pinnedItems,
        viewerCanFollow,
        viewerIsFollowing,
        resolveType,
        login,
        avatarUrl,
        url
      ];
  Map<String, dynamic> toJson() => _$GhUserUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserStarredRepositoryConnection with EquatableMixin {
  GhUserStarredRepositoryConnection();

  factory GhUserStarredRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GhUserStarredRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GhUserStarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserFollowerConnection with EquatableMixin {
  GhUserFollowerConnection();

  factory GhUserFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserFollowerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserFollowingConnection with EquatableMixin {
  GhUserFollowingConnection();

  factory GhUserFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserFollowingConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionsCollection with EquatableMixin {
  GhUserContributionsCollection();

  factory GhUserContributionsCollection.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionsCollectionFromJson(json);

  GhUserContributionCalendar contributionCalendar;

  @override
  List<Object> get props => [contributionCalendar];
  Map<String, dynamic> toJson() => _$GhUserContributionsCollectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendar with EquatableMixin {
  GhUserContributionCalendar();

  factory GhUserContributionCalendar.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarFromJson(json);

  List<GhUserContributionCalendarWeek> weeks;

  @override
  List<Object> get props => [weeks];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendarWeek with EquatableMixin {
  GhUserContributionCalendarWeek();

  factory GhUserContributionCalendarWeek.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarWeekFromJson(json);

  List<GhUserContributionCalendarDay> contributionDays;

  @override
  List<Object> get props => [contributionDays];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarWeekToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendarDay with EquatableMixin {
  GhUserContributionCalendarDay();

  factory GhUserContributionCalendarDay.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarDayFromJson(json);

  String color;

  @override
  List<Object> get props => [color];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarDayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepositoryConnection with EquatableMixin {
  GhUserRepositoryConnection();

  factory GhUserRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserRepositoryConnectionFromJson(json);

  int totalCount;

  List<GhUserRepository> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$GhUserRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepository extends GhUserPinnableItem
    with EquatableMixin
    implements
        GhUserNode,
        GhUserProjectOwner,
        GhUserRegistryPackageOwner,
        GhUserRegistryPackageSearch,
        GhUserSubscribable,
        GhUserStarrable,
        GhUserUniformResourceLocatable,
        GhUserRepositoryInfo {
  GhUserRepository();

  factory GhUserRepository.fromJson(Map<String, dynamic> json) =>
      _$GhUserRepositoryFromJson(json);

  @override
  GhUserRepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  GhUserStargazerConnection stargazers;

  GhUserRepositoryConnection forks;

  GhUserLanguage primaryLanguage;

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
  Map<String, dynamic> toJson() => _$GhUserRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserStargazerConnection with EquatableMixin {
  GhUserStargazerConnection();

  factory GhUserStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserLanguage with EquatableMixin implements GhUserNode {
  GhUserLanguage();

  factory GhUserLanguage.fromJson(Map<String, dynamic> json) =>
      _$GhUserLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GhUserLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserNode with EquatableMixin {
  GhUserNode();

  factory GhUserNode.fromJson(Map<String, dynamic> json) =>
      _$GhUserNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserPinnableItem with EquatableMixin {
  GhUserPinnableItem();

  factory GhUserPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhUserPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhUserPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserProjectOwner with EquatableMixin {
  GhUserProjectOwner();

  factory GhUserProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUserProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRegistryPackageOwner with EquatableMixin {
  GhUserRegistryPackageOwner();

  factory GhUserRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUserRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRegistryPackageSearch with EquatableMixin {
  GhUserRegistryPackageSearch();

  factory GhUserRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhUserRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserSubscribable with EquatableMixin {
  GhUserSubscribable();

  factory GhUserSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhUserSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserStarrable with EquatableMixin {
  GhUserStarrable();

  factory GhUserStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhUserStarrableFromJson(json);

  GhUserStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GhUserStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserUniformResourceLocatable with EquatableMixin {
  GhUserUniformResourceLocatable();

  factory GhUserUniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$GhUserUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepositoryInfo with EquatableMixin {
  GhUserRepositoryInfo();

  factory GhUserRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhUserRepositoryInfoFromJson(json);

  GhUserRepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, resolveType];
  Map<String, dynamic> toJson() => _$GhUserRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserPinnableItemConnection with EquatableMixin {
  GhUserPinnableItemConnection();

  factory GhUserPinnableItemConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserPinnableItemConnectionFromJson(json);

  int totalCount;

  List<GhUserPinnableItem> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$GhUserPinnableItemConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserAuditEntryActor with EquatableMixin {
  GhUserAuditEntryActor();

  factory GhUserAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GhUserAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhUserAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserActor with EquatableMixin {
  GhUserActor();

  factory GhUserActor.fromJson(Map<String, dynamic> json) =>
      _$GhUserActorFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserProfileOwner with EquatableMixin {
  GhUserProfileOwner();

  factory GhUserProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GhUserProfileOwnerFromJson(json);

  String name;

  String location;

  String email;

  String websiteUrl;

  GhUserPinnableItemConnection pinnedItems;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [name, location, email, websiteUrl, pinnedItems, resolveType];
  Map<String, dynamic> toJson() => _$GhUserProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserSponsorable with EquatableMixin {
  GhUserSponsorable();

  factory GhUserSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GhUserSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserOrganization extends GhUserAuditEntryActor
    with EquatableMixin
    implements
        GhUserNode,
        GhUserActor,
        GhUserRegistryPackageOwner,
        GhUserRegistryPackageSearch,
        GhUserProjectOwner,
        GhUserRepositoryOwner,
        GhUserUniformResourceLocatable,
        GhUserMemberStatusable,
        GhUserProfileOwner,
        GhUserSponsorable {
  GhUserOrganization();

  factory GhUserOrganization.fromJson(Map<String, dynamic> json) =>
      _$GhUserOrganizationFromJson(json);

  String name;

  String description;

  String location;

  String email;

  String websiteUrl;

  DateTime createdAt;

  GhUserPinnableItemConnection pinnedItems;

  GhUserPinnableItemConnection pinnableItems;

  GhUserOrganizationMemberConnection membersWithRole;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  String login;

  @override
  String avatarUrl;

  @override
  String url;

  @override
  List<Object> get props => [
        name,
        description,
        location,
        email,
        websiteUrl,
        createdAt,
        pinnedItems,
        pinnableItems,
        membersWithRole,
        resolveType,
        login,
        avatarUrl,
        url
      ];
  Map<String, dynamic> toJson() => _$GhUserOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserOrganizationMemberConnection with EquatableMixin {
  GhUserOrganizationMemberConnection();

  factory GhUserOrganizationMemberConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GhUserOrganizationMemberConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GhUserOrganizationMemberConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserMemberStatusable with EquatableMixin {
  GhUserMemberStatusable();

  factory GhUserMemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$GhUserMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhUserMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserArguments extends JsonSerializable with EquatableMixin {
  GhUserArguments({this.login, this.isViewer});

  factory GhUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GhUserArgumentsFromJson(json);

  final String login;

  final bool isViewer;

  @override
  List<Object> get props => [login, isViewer];
  Map<String, dynamic> toJson() => _$GhUserArgumentsToJson(this);
}

class GhUserQuery extends GraphQLQuery<GhUser, GhUserArguments> {
  GhUserQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'login')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isViewer')),
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
                    value: VariableNode(name: NameNode(value: 'login')))
              ],
              directives: [
                DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'isViewer')))
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
                InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                            name: NameNode(value: 'User'), isNonNull: false)),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
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
                          name: NameNode(value: 'createdAt'),
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
                          name: NameNode(value: 'contributionsCollection'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'contributionCalendar'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'weeks'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(
                                                value: 'contributionDays'),
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
                                                  selectionSet: null)
                                            ]))
                                      ]))
                                ]))
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
                                  FieldNode(
                                      name: NameNode(value: '__typename'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
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
                          name: NameNode(value: 'createdAt'),
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
                                  FieldNode(
                                      name: NameNode(value: '__typename'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
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
                                  FieldNode(
                                      name: NameNode(value: '__typename'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
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
              ])),
          FieldNode(
              name: NameNode(value: 'viewer'),
              alias: null,
              arguments: [],
              directives: [
                DirectiveNode(name: NameNode(value: 'include'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'isViewer')))
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
                    name: NameNode(value: 'createdAt'),
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
                    ])),
                FieldNode(
                    name: NameNode(value: 'contributionsCollection'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'contributionCalendar'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'weeks'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'contributionDays'),
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
                                            selectionSet: null)
                                      ]))
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GhUser';

  @override
  final GhUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhUser parse(Map<String, dynamic> json) => GhUser.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhObject with EquatableMixin {
  GhObject();

  factory GhObject.fromJson(Map<String, dynamic> json) =>
      _$GhObjectFromJson(json);

  GhObjectRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GhObjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectRepository extends GhObjectPinnableItem
    with EquatableMixin
    implements
        GhObjectNode,
        GhObjectProjectOwner,
        GhObjectRegistryPackageOwner,
        GhObjectRegistryPackageSearch,
        GhObjectSubscribable,
        GhObjectStarrable,
        GhObjectUniformResourceLocatable,
        GhObjectRepositoryInfo {
  GhObjectRepository();

  factory GhObjectRepository.fromJson(Map<String, dynamic> json) =>
      _$GhObjectRepositoryFromJson(json);

  GhObjectGitObject object;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [object, resolveType];
  Map<String, dynamic> toJson() => _$GhObjectRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectGitObject with EquatableMixin {
  GhObjectGitObject();

  factory GhObjectGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Tree':
        return GhObjectTree.fromJson(json);
      case 'Blob':
        return GhObjectBlob.fromJson(json);
      default:
    }
    return _$GhObjectGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Tree':
        return (this as GhObjectTree).toJson();
      case 'Blob':
        return (this as GhObjectBlob).toJson();
      default:
    }
    return _$GhObjectGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GhObjectTree
    with EquatableMixin
    implements GhObjectNode, GhObjectGitObject {
  GhObjectTree();

  factory GhObjectTree.fromJson(Map<String, dynamic> json) =>
      _$GhObjectTreeFromJson(json);

  List<GhObjectTreeEntry> entries;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [entries, resolveType];
  Map<String, dynamic> toJson() => _$GhObjectTreeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectTreeEntry with EquatableMixin {
  GhObjectTreeEntry();

  factory GhObjectTreeEntry.fromJson(Map<String, dynamic> json) =>
      _$GhObjectTreeEntryFromJson(json);

  String type;

  String name;

  @override
  List<Object> get props => [type, name];
  Map<String, dynamic> toJson() => _$GhObjectTreeEntryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectNode with EquatableMixin {
  GhObjectNode();

  factory GhObjectNode.fromJson(Map<String, dynamic> json) =>
      _$GhObjectNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectBlob
    with EquatableMixin
    implements GhObjectNode, GhObjectGitObject {
  GhObjectBlob();

  factory GhObjectBlob.fromJson(Map<String, dynamic> json) =>
      _$GhObjectBlobFromJson(json);

  String text;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [text, resolveType];
  Map<String, dynamic> toJson() => _$GhObjectBlobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectPinnableItem with EquatableMixin {
  GhObjectPinnableItem();

  factory GhObjectPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhObjectPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhObjectPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectProjectOwner with EquatableMixin {
  GhObjectProjectOwner();

  factory GhObjectProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhObjectProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectRegistryPackageOwner with EquatableMixin {
  GhObjectRegistryPackageOwner();

  factory GhObjectRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhObjectRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectRegistryPackageSearch with EquatableMixin {
  GhObjectRegistryPackageSearch();

  factory GhObjectRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhObjectRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectSubscribable with EquatableMixin {
  GhObjectSubscribable();

  factory GhObjectSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhObjectSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectStarrable with EquatableMixin {
  GhObjectStarrable();

  factory GhObjectStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhObjectStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectUniformResourceLocatable with EquatableMixin {
  GhObjectUniformResourceLocatable();

  factory GhObjectUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GhObjectUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhObjectUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectRepositoryInfo with EquatableMixin {
  GhObjectRepositoryInfo();

  factory GhObjectRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhObjectRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhObjectRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhObjectArguments extends JsonSerializable with EquatableMixin {
  GhObjectArguments({this.owner, this.name, this.expression});

  factory GhObjectArguments.fromJson(Map<String, dynamic> json) =>
      _$GhObjectArgumentsFromJson(json);

  final String owner;

  final String name;

  final String expression;

  @override
  List<Object> get props => [owner, name, expression];
  Map<String, dynamic> toJson() => _$GhObjectArgumentsToJson(this);
}

class GhObjectQuery extends GraphQLQuery<GhObject, GhObjectArguments> {
  GhObjectQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhObject'),
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
              variable: VariableNode(name: NameNode(value: 'expression')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
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
                    name: NameNode(value: 'object'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'expression'),
                          value:
                              VariableNode(name: NameNode(value: 'expression')))
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
                                  name: NameNode(value: 'Tree'),
                                  isNonNull: false)),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'entries'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'type'),
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
                          ])),
                      InlineFragmentNode(
                          typeCondition: TypeConditionNode(
                              on: NamedTypeNode(
                                  name: NameNode(value: 'Blob'),
                                  isNonNull: false)),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'text'),
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
  final String operationName = 'GhObject';

  @override
  final GhObjectArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhObject parse(Map<String, dynamic> json) => GhObject.fromJson(json);
}

mixin TMixin {
  GhCommitsGitObject target;
}

@JsonSerializable(explicitToJson: true)
class GhCommits with EquatableMixin {
  GhCommits();

  factory GhCommits.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsFromJson(json);

  GhCommitsRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GhCommitsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRepository extends GhCommitsPinnableItem
    with EquatableMixin
    implements
        GhCommitsNode,
        GhCommitsProjectOwner,
        GhCommitsRegistryPackageOwner,
        GhCommitsRegistryPackageSearch,
        GhCommitsSubscribable,
        GhCommitsStarrable,
        GhCommitsUniformResourceLocatable,
        GhCommitsRepositoryInfo {
  GhCommitsRepository();

  factory GhCommitsRepository.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRepositoryFromJson(json);

  GhCommitsRef defaultBranchRef;

  GhCommitsRef ref;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [defaultBranchRef, ref, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRef with EquatableMixin, TMixin implements GhCommitsNode {
  GhCommitsRef();

  factory GhCommitsRef.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRefFromJson(json);

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [target, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsGitObject with EquatableMixin {
  GhCommitsGitObject();

  factory GhCommitsGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Commit':
        return GhCommitsCommit.fromJson(json);
      default:
    }
    return _$GhCommitsGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Commit':
        return (this as GhCommitsCommit).toJson();
      default:
    }
    return _$GhCommitsGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GhCommitsCommit extends GhCommitsPullRequestTimelineItem
    with EquatableMixin
    implements
        GhCommitsNode,
        GhCommitsGitObject,
        GhCommitsSubscribable,
        GhCommitsUniformResourceLocatable {
  GhCommitsCommit();

  factory GhCommitsCommit.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsCommitFromJson(json);

  String oid;

  String url;

  String messageHeadline;

  DateTime committedDate;

  GhCommitsGitActor author;

  GhCommitsStatus status;

  GhCommitsCommitHistoryConnection history;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        oid,
        url,
        messageHeadline,
        committedDate,
        author,
        status,
        history,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhCommitsCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsGitActor with EquatableMixin {
  GhCommitsGitActor();

  factory GhCommitsGitActor.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsGitActorFromJson(json);

  String name;

  String avatarUrl;

  GhCommitsUser user;

  @override
  List<Object> get props => [name, avatarUrl, user];
  Map<String, dynamic> toJson() => _$GhCommitsGitActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsUser extends GhCommitsAuditEntryActor
    with EquatableMixin
    implements
        GhCommitsNode,
        GhCommitsActor,
        GhCommitsRegistryPackageOwner,
        GhCommitsRegistryPackageSearch,
        GhCommitsProjectOwner,
        GhCommitsRepositoryOwner,
        GhCommitsUniformResourceLocatable,
        GhCommitsProfileOwner,
        GhCommitsSponsorable {
  GhCommitsUser();

  factory GhCommitsUser.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsUserFromJson(json);

  @override
  String login;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsAuditEntryActor with EquatableMixin {
  GhCommitsAuditEntryActor();

  factory GhCommitsAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhCommitsAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsNode with EquatableMixin {
  GhCommitsNode();

  factory GhCommitsNode.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsActor with EquatableMixin {
  GhCommitsActor();

  factory GhCommitsActor.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsActorFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRegistryPackageOwner with EquatableMixin {
  GhCommitsRegistryPackageOwner();

  factory GhCommitsRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRegistryPackageSearch with EquatableMixin {
  GhCommitsRegistryPackageSearch();

  factory GhCommitsRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsProjectOwner with EquatableMixin {
  GhCommitsProjectOwner();

  factory GhCommitsProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRepositoryOwner with EquatableMixin {
  GhCommitsRepositoryOwner();

  factory GhCommitsRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRepositoryOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsUniformResourceLocatable with EquatableMixin {
  GhCommitsUniformResourceLocatable();

  factory GhCommitsUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GhCommitsUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhCommitsUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsProfileOwner with EquatableMixin {
  GhCommitsProfileOwner();

  factory GhCommitsProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsProfileOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsSponsorable with EquatableMixin {
  GhCommitsSponsorable();

  factory GhCommitsSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsStatus with EquatableMixin implements GhCommitsNode {
  GhCommitsStatus();

  factory GhCommitsStatus.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsStatusFromJson(json);

  GhCommitsStatusState state;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [state, resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsCommitHistoryConnection with EquatableMixin {
  GhCommitsCommitHistoryConnection();

  factory GhCommitsCommitHistoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GhCommitsCommitHistoryConnectionFromJson(json);

  GhCommitsPageInfo pageInfo;

  List<GhCommitsCommit> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() =>
      _$GhCommitsCommitHistoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsPageInfo with EquatableMixin {
  GhCommitsPageInfo();

  factory GhCommitsPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GhCommitsPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsPullRequestTimelineItem with EquatableMixin {
  GhCommitsPullRequestTimelineItem();

  factory GhCommitsPullRequestTimelineItem.fromJson(
          Map<String, dynamic> json) =>
      _$GhCommitsPullRequestTimelineItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() =>
      _$GhCommitsPullRequestTimelineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsSubscribable with EquatableMixin {
  GhCommitsSubscribable();

  factory GhCommitsSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsPinnableItem with EquatableMixin {
  GhCommitsPinnableItem();

  factory GhCommitsPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhCommitsPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsStarrable with EquatableMixin {
  GhCommitsStarrable();

  factory GhCommitsStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhCommitsRepositoryInfo with EquatableMixin {
  GhCommitsRepositoryInfo();

  factory GhCommitsRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhCommitsRepositoryInfoToJson(this);
}

enum GhCommitsStatusState {
  EXPECTED,
  ERROR,
  FAILURE,
  PENDING,
  SUCCESS,
}

@JsonSerializable(explicitToJson: true)
class GhCommitsArguments extends JsonSerializable with EquatableMixin {
  GhCommitsArguments(
      {this.owner, this.name, this.ref, this.hasRef, this.after});

  factory GhCommitsArguments.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsArgumentsFromJson(json);

  final String owner;

  final String name;

  final String ref;

  final bool hasRef;

  final String after;

  @override
  List<Object> get props => [owner, name, ref, hasRef, after];
  Map<String, dynamic> toJson() => _$GhCommitsArgumentsToJson(this);
}

class GhCommitsQuery extends GraphQLQuery<GhCommits, GhCommitsArguments> {
  GhCommitsQuery({this.variables});

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
                FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
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
                          name: NameNode(value: 'status'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'state'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
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
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'status'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'state'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ]))
                          ]))
                    ]))
              ]))
        ])),
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhCommits'),
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
  final String operationName = 'GhCommits';

  @override
  final GhCommitsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhCommits parse(Map<String, dynamic> json) => GhCommits.fromJson(json);
}
