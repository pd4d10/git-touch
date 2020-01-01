// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_repository.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubRepository with EquatableMixin {
  GithubRepository();

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);

  GithubRepositoryRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GithubRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepository extends GithubRepositoryPinnableItem
    with EquatableMixin
    implements
        GithubRepositoryNode,
        GithubRepositoryProjectOwner,
        GithubRepositoryRegistryPackageOwner,
        GithubRepositoryRegistryPackageSearch,
        GithubRepositorySubscribable,
        GithubRepositoryStarrable,
        GithubRepositoryUniformResourceLocatable,
        GithubRepositoryRepositoryInfo {
  GithubRepositoryRepository();

  factory GithubRepositoryRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryFromJson(json);

  @override
  GithubRepositoryRepositoryOwner owner;

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
  GithubRepositoryStargazerConnection stargazers;

  GithubRepositoryRepositoryConnection forks;

  GithubRepositoryLanguage primaryLanguage;

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
  String projectsResourcePath;

  GithubRepositoryUserConnection watchers;

  GithubRepositoryIssueConnection issues;

  GithubRepositoryPullRequestConnection pullRequests;

  @override
  GithubRepositoryProjectConnection projects;

  GithubRepositoryReleaseConnection releases;

  GithubRepositoryLanguageConnection languages;

  GithubRepositoryRef defaultBranchRef;

  GithubRepositoryRef ref;

  GithubRepositoryRefConnection refs;

  @override
  GithubRepositoryLicense licenseInfo;

  GithubRepositoryRepositoryTopicConnection repositoryTopics;

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
        projectsResourcePath,
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
  Map<String, dynamic> toJson() => _$GithubRepositoryRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepositoryOwner with EquatableMixin {
  GithubRepositoryRepositoryOwner();

  factory GithubRepositoryRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryStargazerConnection with EquatableMixin {
  GithubRepositoryStargazerConnection();

  factory GithubRepositoryStargazerConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepositoryConnection with EquatableMixin {
  GithubRepositoryRepositoryConnection();

  factory GithubRepositoryRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryLanguage
    with EquatableMixin
    implements GithubRepositoryNode {
  GithubRepositoryLanguage();

  factory GithubRepositoryLanguage.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryNode with EquatableMixin {
  GithubRepositoryNode();

  factory GithubRepositoryNode.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryUserConnection with EquatableMixin {
  GithubRepositoryUserConnection();

  factory GithubRepositoryUserConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryUserConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubRepositoryUserConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryIssueConnection with EquatableMixin {
  GithubRepositoryIssueConnection();

  factory GithubRepositoryIssueConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryIssueConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryIssueConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryPullRequestConnection with EquatableMixin {
  GithubRepositoryPullRequestConnection();

  factory GithubRepositoryPullRequestConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryPullRequestConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryPullRequestConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryProjectConnection with EquatableMixin {
  GithubRepositoryProjectConnection();

  factory GithubRepositoryProjectConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryProjectConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryProjectConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryReleaseConnection with EquatableMixin {
  GithubRepositoryReleaseConnection();

  factory GithubRepositoryReleaseConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryReleaseConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryReleaseConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryLanguageConnection with EquatableMixin {
  GithubRepositoryLanguageConnection();

  factory GithubRepositoryLanguageConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryLanguageConnectionFromJson(json);

  int totalSize;

  List<GithubRepositoryLanguageEdge> edges;

  @override
  List<Object> get props => [totalSize, edges];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryLanguageConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryLanguageEdge with EquatableMixin {
  GithubRepositoryLanguageEdge();

  factory GithubRepositoryLanguageEdge.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryLanguageEdgeFromJson(json);

  int size;

  GithubRepositoryLanguage node;

  @override
  List<Object> get props => [size, node];
  Map<String, dynamic> toJson() => _$GithubRepositoryLanguageEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRef with EquatableMixin implements GithubRepositoryNode {
  GithubRepositoryRef();

  factory GithubRepositoryRef.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRefFromJson(json);

  String name;

  GithubRepositoryGitObject target;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, target, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryGitObject with EquatableMixin {
  GithubRepositoryGitObject();

  factory GithubRepositoryGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Commit':
        return GithubRepositoryCommit.fromJson(json);
      default:
    }
    return _$GithubRepositoryGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Commit':
        return (this as GithubRepositoryCommit).toJson();
      default:
    }
    return _$GithubRepositoryGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryCommit extends GithubRepositoryPullRequestTimelineItem
    with EquatableMixin
    implements
        GithubRepositoryNode,
        GithubRepositoryGitObject,
        GithubRepositorySubscribable,
        GithubRepositoryUniformResourceLocatable {
  GithubRepositoryCommit();

  factory GithubRepositoryCommit.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryCommitFromJson(json);

  GithubRepositoryCommitHistoryConnection history;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [history, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryCommitHistoryConnection with EquatableMixin {
  GithubRepositoryCommitHistoryConnection();

  factory GithubRepositoryCommitHistoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryCommitHistoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryCommitHistoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryPullRequestTimelineItem with EquatableMixin {
  GithubRepositoryPullRequestTimelineItem();

  factory GithubRepositoryPullRequestTimelineItem.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryPullRequestTimelineItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryPullRequestTimelineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositorySubscribable with EquatableMixin {
  GithubRepositorySubscribable();

  factory GithubRepositorySubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositorySubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositorySubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryUniformResourceLocatable with EquatableMixin {
  GithubRepositoryUniformResourceLocatable();

  factory GithubRepositoryUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRefConnection with EquatableMixin {
  GithubRepositoryRefConnection();

  factory GithubRepositoryRefConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRefConnectionFromJson(json);

  int totalCount;

  List<GithubRepositoryRef> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$GithubRepositoryRefConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryLicense
    with EquatableMixin
    implements GithubRepositoryNode {
  GithubRepositoryLicense();

  factory GithubRepositoryLicense.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryLicenseFromJson(json);

  String name;

  String spdxId;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, spdxId, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryLicenseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepositoryTopicConnection with EquatableMixin {
  GithubRepositoryRepositoryTopicConnection();

  factory GithubRepositoryRepositoryTopicConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryTopicConnectionFromJson(json);

  List<GithubRepositoryRepositoryTopic> nodes;

  @override
  List<Object> get props => [nodes];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRepositoryTopicConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepositoryTopic
    with EquatableMixin
    implements GithubRepositoryNode, GithubRepositoryUniformResourceLocatable {
  GithubRepositoryRepositoryTopic();

  factory GithubRepositoryRepositoryTopic.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryTopicFromJson(json);

  @override
  String url;

  GithubRepositoryTopic topic;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [url, topic, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRepositoryTopicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryTopic
    with EquatableMixin
    implements GithubRepositoryNode, GithubRepositoryStarrable {
  GithubRepositoryTopic();

  factory GithubRepositoryTopic.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryTopicFromJson(json);

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryTopicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryStarrable with EquatableMixin {
  GithubRepositoryStarrable();

  factory GithubRepositoryStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryPinnableItem with EquatableMixin {
  GithubRepositoryPinnableItem();

  factory GithubRepositoryPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubRepositoryPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryProjectOwner with EquatableMixin {
  GithubRepositoryProjectOwner();

  factory GithubRepositoryProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryProjectOwnerFromJson(json);

  String id;

  String projectsResourcePath;

  GithubRepositoryProjectConnection projects;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, projectsResourcePath, projects, resolveType];
  Map<String, dynamic> toJson() => _$GithubRepositoryProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRegistryPackageOwner with EquatableMixin {
  GithubRepositoryRegistryPackageOwner();

  factory GithubRepositoryRegistryPackageOwner.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryRegistryPackageOwnerFromJson(json);

  String id;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRegistryPackageSearch with EquatableMixin {
  GithubRepositoryRegistryPackageSearch();

  factory GithubRepositoryRegistryPackageSearch.fromJson(
          Map<String, dynamic> json) =>
      _$GithubRepositoryRegistryPackageSearchFromJson(json);

  String id;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubRepositoryRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryRepositoryInfo with EquatableMixin {
  GithubRepositoryRepositoryInfo();

  factory GithubRepositoryRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryRepositoryInfoFromJson(json);

  GithubRepositoryRepositoryOwner owner;

  String name;

  String description;

  String homepageUrl;

  bool isPrivate;

  bool isFork;

  bool hasIssuesEnabled;

  String url;

  GithubRepositoryLicense licenseInfo;

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
  Map<String, dynamic> toJson() => _$GithubRepositoryRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubRepositoryArguments extends JsonSerializable with EquatableMixin {
  GithubRepositoryArguments(
      {this.owner, this.name, this.branchSpecified, this.branch});

  factory GithubRepositoryArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryArgumentsFromJson(json);

  final String owner;

  final String name;

  final bool branchSpecified;

  final String branch;

  @override
  List<Object> get props => [owner, name, branchSpecified, branch];
  Map<String, dynamic> toJson() => _$GithubRepositoryArgumentsToJson(this);
}

class GithubRepositoryQuery
    extends GraphQLQuery<GithubRepository, GithubRepositoryArguments> {
  GithubRepositoryQuery({this.variables});

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
                    name: NameNode(value: 'projectsResourcePath'),
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
  final String operationName = 'github_repository';

  @override
  final GithubRepositoryArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubRepository parse(Map<String, dynamic> json) =>
      GithubRepository.fromJson(json);
}
