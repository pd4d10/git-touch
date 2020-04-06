// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'gh.g.dart';

@JsonSerializable(explicitToJson: true)
class GhRepo with EquatableMixin {
  GhRepo({this.repository});

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
  GhRepoRepository(
      {this.forks,
      this.primaryLanguage,
      this.diskUsage,
      this.watchers,
      this.issues,
      this.pullRequests,
      this.releases,
      this.languages,
      this.defaultBranchRef,
      this.ref,
      this.refs,
      this.repositoryTopics});

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
  @JsonKey(unknownEnumValue: GhRepoSubscriptionState.ARTEMIS_UNKNOWN)
  GhRepoSubscriptionState viewerSubscription;

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
        viewerSubscription,
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
  GhRepoRepositoryOwner({this.login, this.avatarUrl});

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
  GhRepoStargazerConnection({this.totalCount});

  factory GhRepoStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoRepositoryConnection with EquatableMixin {
  GhRepoRepositoryConnection({this.totalCount});

  factory GhRepoRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLanguage with EquatableMixin implements GhRepoNode {
  GhRepoLanguage({this.color, this.name});

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
  GhRepoUserConnection({this.totalCount});

  factory GhRepoUserConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoUserConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoUserConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoIssueConnection with EquatableMixin {
  GhRepoIssueConnection({this.totalCount});

  factory GhRepoIssueConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoIssueConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoIssueConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoPullRequestConnection with EquatableMixin {
  GhRepoPullRequestConnection({this.totalCount});

  factory GhRepoPullRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoPullRequestConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoPullRequestConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoProjectConnection with EquatableMixin {
  GhRepoProjectConnection({this.totalCount});

  factory GhRepoProjectConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoProjectConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoProjectConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoReleaseConnection with EquatableMixin {
  GhRepoReleaseConnection({this.totalCount});

  factory GhRepoReleaseConnection.fromJson(Map<String, dynamic> json) =>
      _$GhRepoReleaseConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhRepoReleaseConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhRepoLanguageConnection with EquatableMixin {
  GhRepoLanguageConnection({this.totalSize, this.edges});

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
  GhRepoLanguageEdge({this.size, this.node});

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
  GhRepoRef({this.name, this.target});

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
  GhRepoCommit({this.history});

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
  GhRepoCommitHistoryConnection({this.totalCount});

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
  GhRepoRefConnection({this.totalCount, this.nodes});

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
  GhRepoLicense({this.name, this.spdxId});

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
  GhRepoRepositoryTopicConnection({this.nodes});

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
  GhRepoRepositoryTopic({this.topic});

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
  GhRepoTopic({this.name});

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
  GhRepoProjectOwner({this.id, this.projectsUrl, this.projects});

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
  GhRepoRegistryPackageOwner({this.id});

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
  GhRepoRegistryPackageSearch({this.id});

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
  GhRepoRepositoryInfo(
      {this.owner,
      this.name,
      this.description,
      this.homepageUrl,
      this.isPrivate,
      this.isFork,
      this.hasIssuesEnabled,
      this.url,
      this.licenseInfo});

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

enum GhRepoSubscriptionState {
  UNSUBSCRIBED,
  SUBSCRIBED,
  IGNORED,
  ARTEMIS_UNKNOWN,
}

@JsonSerializable(explicitToJson: true)
class GhRepoArguments extends JsonSerializable with EquatableMixin {
  GhRepoArguments(
      {@required this.owner,
      @required this.name,
      @required this.branchSpecified,
      @required this.branch});

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
                    name: NameNode(value: 'viewerSubscription'),
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
  GhUsers({this.user, this.organization, this.repository});

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
  GhUsersUser({this.company, this.createdAt, this.followers, this.following});

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
  GhUsersFollowerConnection({this.pageInfo, this.nodes});

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
  GhUsersPageInfo({this.hasNextPage, this.endCursor});

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
  GhUsersActor({this.login, this.avatarUrl});

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
  GhUsersRepositoryOwner({this.login, this.avatarUrl});

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
  GhUsersProfileOwner({this.login, this.name, this.location});

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
  GhUsersFollowingConnection({this.pageInfo, this.nodes});

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
  GhUsersOrganization({this.membersWithRole});

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
  GhUsersOrganizationMemberConnection({this.pageInfo, this.nodes});

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
  GhUsersRepository({this.watchers});

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
  GhUsersUserConnection({this.pageInfo, this.nodes});

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
  GhUsersStargazerConnection({this.pageInfo, this.nodes});

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
  GhUsersStarrable({this.stargazers});

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
      {@required this.login,
      @required this.repoName,
      this.after,
      @required this.isFollowers,
      @required this.isFollowing,
      @required this.isMember,
      @required this.isStar,
      @required this.isWatch});

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
                          value: VariableNode(name: NameNode(value: 'after'))),
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
class GhPulls with EquatableMixin {
  GhPulls({this.repository});

  factory GhPulls.fromJson(Map<String, dynamic> json) =>
      _$GhPullsFromJson(json);

  GhPullsRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GhPullsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRepository extends GhPullsPinnableItem
    with EquatableMixin
    implements
        GhPullsNode,
        GhPullsProjectOwner,
        GhPullsRegistryPackageOwner,
        GhPullsRegistryPackageSearch,
        GhPullsSubscribable,
        GhPullsStarrable,
        GhPullsUniformResourceLocatable,
        GhPullsRepositoryInfo {
  GhPullsRepository({this.pullRequests});

  factory GhPullsRepository.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRepositoryFromJson(json);

  @override
  GhPullsRepositoryOwner owner;

  @override
  String name;

  GhPullsPullRequestConnection pullRequests;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [owner, name, pullRequests, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRepositoryOwner with EquatableMixin {
  GhPullsRepositoryOwner({this.login});

  factory GhPullsRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRepositoryOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsPullRequestConnection with EquatableMixin {
  GhPullsPullRequestConnection({this.pageInfo, this.nodes});

  factory GhPullsPullRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$GhPullsPullRequestConnectionFromJson(json);

  GhPullsPageInfo pageInfo;

  List<GhPullsPullRequest> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhPullsPullRequestConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsPageInfo with EquatableMixin {
  GhPullsPageInfo({this.hasNextPage, this.endCursor});

  factory GhPullsPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GhPullsPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GhPullsPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsPullRequest extends GhPullsProjectCardItem
    with EquatableMixin
    implements
        GhPullsNode,
        GhPullsAssignable,
        GhPullsClosable,
        GhPullsComment,
        GhPullsUpdatable,
        GhPullsUpdatableComment,
        GhPullsLabelable,
        GhPullsLockable,
        GhPullsReactable,
        GhPullsRepositoryNode,
        GhPullsSubscribable,
        GhPullsUniformResourceLocatable {
  GhPullsPullRequest({this.number, this.title, this.comments});

  factory GhPullsPullRequest.fromJson(Map<String, dynamic> json) =>
      _$GhPullsPullRequestFromJson(json);

  @override
  GhPullsRepository repository;

  int number;

  String title;

  @override
  DateTime updatedAt;

  @override
  GhPullsActor author;

  @override
  GhPullsLabelConnection labels;

  GhPullsIssueCommentConnection comments;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        repository,
        number,
        title,
        updatedAt,
        author,
        labels,
        comments,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhPullsPullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsPinnableItem with EquatableMixin {
  GhPullsPinnableItem();

  factory GhPullsPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhPullsPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhPullsPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsNode with EquatableMixin {
  GhPullsNode();

  factory GhPullsNode.fromJson(Map<String, dynamic> json) =>
      _$GhPullsNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsProjectOwner with EquatableMixin {
  GhPullsProjectOwner();

  factory GhPullsProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhPullsProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRegistryPackageOwner with EquatableMixin {
  GhPullsRegistryPackageOwner();

  factory GhPullsRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRegistryPackageSearch with EquatableMixin {
  GhPullsRegistryPackageSearch();

  factory GhPullsRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsSubscribable with EquatableMixin {
  GhPullsSubscribable();

  factory GhPullsSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsStarrable with EquatableMixin {
  GhPullsStarrable();

  factory GhPullsStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsUniformResourceLocatable with EquatableMixin {
  GhPullsUniformResourceLocatable();

  factory GhPullsUniformResourceLocatable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhPullsUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRepositoryInfo with EquatableMixin {
  GhPullsRepositoryInfo({this.owner, this.name});

  factory GhPullsRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRepositoryInfoFromJson(json);

  GhPullsRepositoryOwner owner;

  String name;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [owner, name, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsActor with EquatableMixin {
  GhPullsActor({this.login, this.avatarUrl});

  factory GhPullsActor.fromJson(Map<String, dynamic> json) =>
      _$GhPullsActorFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsLabelConnection with EquatableMixin {
  GhPullsLabelConnection({this.nodes});

  factory GhPullsLabelConnection.fromJson(Map<String, dynamic> json) =>
      _$GhPullsLabelConnectionFromJson(json);

  List<GhPullsLabel> nodes;

  @override
  List<Object> get props => [nodes];
  Map<String, dynamic> toJson() => _$GhPullsLabelConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsLabel with EquatableMixin implements GhPullsNode {
  GhPullsLabel({this.name, this.color});

  factory GhPullsLabel.fromJson(Map<String, dynamic> json) =>
      _$GhPullsLabelFromJson(json);

  String name;

  String color;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, color, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsLabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsIssueCommentConnection with EquatableMixin {
  GhPullsIssueCommentConnection({this.totalCount});

  factory GhPullsIssueCommentConnection.fromJson(Map<String, dynamic> json) =>
      _$GhPullsIssueCommentConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhPullsIssueCommentConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsProjectCardItem with EquatableMixin {
  GhPullsProjectCardItem();

  factory GhPullsProjectCardItem.fromJson(Map<String, dynamic> json) =>
      _$GhPullsProjectCardItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhPullsProjectCardItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsAssignable with EquatableMixin {
  GhPullsAssignable();

  factory GhPullsAssignable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsAssignableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsAssignableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsClosable with EquatableMixin {
  GhPullsClosable();

  factory GhPullsClosable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsClosableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsClosableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsComment with EquatableMixin {
  GhPullsComment({this.updatedAt, this.author});

  factory GhPullsComment.fromJson(Map<String, dynamic> json) =>
      _$GhPullsCommentFromJson(json);

  DateTime updatedAt;

  GhPullsActor author;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [updatedAt, author, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsUpdatable with EquatableMixin {
  GhPullsUpdatable();

  factory GhPullsUpdatable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsUpdatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsUpdatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsUpdatableComment with EquatableMixin {
  GhPullsUpdatableComment();

  factory GhPullsUpdatableComment.fromJson(Map<String, dynamic> json) =>
      _$GhPullsUpdatableCommentFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsUpdatableCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsLabelable with EquatableMixin {
  GhPullsLabelable({this.labels});

  factory GhPullsLabelable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsLabelableFromJson(json);

  GhPullsLabelConnection labels;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [labels, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsLabelableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsLockable with EquatableMixin {
  GhPullsLockable();

  factory GhPullsLockable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsLockableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsLockableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsReactable with EquatableMixin {
  GhPullsReactable();

  factory GhPullsReactable.fromJson(Map<String, dynamic> json) =>
      _$GhPullsReactableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhPullsReactableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsRepositoryNode with EquatableMixin {
  GhPullsRepositoryNode({this.repository});

  factory GhPullsRepositoryNode.fromJson(Map<String, dynamic> json) =>
      _$GhPullsRepositoryNodeFromJson(json);

  GhPullsRepository repository;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [repository, resolveType];
  Map<String, dynamic> toJson() => _$GhPullsRepositoryNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhPullsArguments extends JsonSerializable with EquatableMixin {
  GhPullsArguments({@required this.owner, @required this.name, this.cursor});

  factory GhPullsArguments.fromJson(Map<String, dynamic> json) =>
      _$GhPullsArgumentsFromJson(json);

  final String owner;

  final String name;

  final String cursor;

  @override
  List<Object> get props => [owner, name, cursor];
  Map<String, dynamic> toJson() => _$GhPullsArgumentsToJson(this);
}

class GhPullsQuery extends GraphQLQuery<GhPulls, GhPullsArguments> {
  GhPullsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhPulls'),
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
              variable: VariableNode(name: NameNode(value: 'cursor')),
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
                    name: NameNode(value: 'owner'),
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
                    ])),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'pullRequests'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'states'),
                          value: EnumValueNode(name: NameNode(value: 'OPEN'))),
                      ArgumentNode(
                          name: NameNode(value: 'orderBy'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'field'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'CREATED_AT'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'direction'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'DESC')))
                          ])),
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'cursor')))
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
                                name: NameNode(value: 'repository'),
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
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'title'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'updatedAt'),
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
                                name: NameNode(value: 'labels'),
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
                                      selectionSet:
                                          SelectionSetNode(selections: [
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
                                ])),
                            FieldNode(
                                name: NameNode(value: 'comments'),
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
        ]))
  ]);

  @override
  final String operationName = 'GhPulls';

  @override
  final GhPullsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhPulls parse(Map<String, dynamic> json) => GhPulls.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssue with EquatableMixin {
  GhOpenIssue({this.reopenIssue, this.closeIssue});

  factory GhOpenIssue.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueFromJson(json);

  GhOpenIssueReopenIssuePayload reopenIssue;

  GhOpenIssueCloseIssuePayload closeIssue;

  @override
  List<Object> get props => [reopenIssue, closeIssue];
  Map<String, dynamic> toJson() => _$GhOpenIssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueReopenIssuePayload with EquatableMixin {
  GhOpenIssueReopenIssuePayload({this.issue});

  factory GhOpenIssueReopenIssuePayload.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueReopenIssuePayloadFromJson(json);

  GhOpenIssueIssue issue;

  @override
  List<Object> get props => [issue];
  Map<String, dynamic> toJson() => _$GhOpenIssueReopenIssuePayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueIssue extends GhOpenIssueProjectCardItem
    with EquatableMixin
    implements
        GhOpenIssueNode,
        GhOpenIssueAssignable,
        GhOpenIssueClosable,
        GhOpenIssueComment,
        GhOpenIssueUpdatable,
        GhOpenIssueUpdatableComment,
        GhOpenIssueLabelable,
        GhOpenIssueLockable,
        GhOpenIssueReactable,
        GhOpenIssueRepositoryNode,
        GhOpenIssueSubscribable,
        GhOpenIssueUniformResourceLocatable {
  GhOpenIssueIssue();

  factory GhOpenIssueIssue.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueIssueFromJson(json);

  @override
  bool closed;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [closed, resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueIssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueProjectCardItem with EquatableMixin {
  GhOpenIssueProjectCardItem();

  factory GhOpenIssueProjectCardItem.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueProjectCardItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhOpenIssueProjectCardItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueNode with EquatableMixin {
  GhOpenIssueNode();

  factory GhOpenIssueNode.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueAssignable with EquatableMixin {
  GhOpenIssueAssignable();

  factory GhOpenIssueAssignable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueAssignableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueAssignableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueClosable with EquatableMixin {
  GhOpenIssueClosable({this.closed});

  factory GhOpenIssueClosable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueClosableFromJson(json);

  bool closed;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [closed, resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueClosableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueComment with EquatableMixin {
  GhOpenIssueComment();

  factory GhOpenIssueComment.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueCommentFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueUpdatable with EquatableMixin {
  GhOpenIssueUpdatable();

  factory GhOpenIssueUpdatable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueUpdatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueUpdatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueUpdatableComment with EquatableMixin {
  GhOpenIssueUpdatableComment();

  factory GhOpenIssueUpdatableComment.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueUpdatableCommentFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueUpdatableCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueLabelable with EquatableMixin {
  GhOpenIssueLabelable();

  factory GhOpenIssueLabelable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueLabelableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueLabelableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueLockable with EquatableMixin {
  GhOpenIssueLockable();

  factory GhOpenIssueLockable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueLockableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueLockableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueReactable with EquatableMixin {
  GhOpenIssueReactable();

  factory GhOpenIssueReactable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueReactableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueReactableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueRepositoryNode with EquatableMixin {
  GhOpenIssueRepositoryNode();

  factory GhOpenIssueRepositoryNode.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueRepositoryNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueRepositoryNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueSubscribable with EquatableMixin {
  GhOpenIssueSubscribable();

  factory GhOpenIssueSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhOpenIssueSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueUniformResourceLocatable with EquatableMixin {
  GhOpenIssueUniformResourceLocatable();

  factory GhOpenIssueUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GhOpenIssueUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhOpenIssueUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueCloseIssuePayload with EquatableMixin {
  GhOpenIssueCloseIssuePayload({this.issue});

  factory GhOpenIssueCloseIssuePayload.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueCloseIssuePayloadFromJson(json);

  GhOpenIssueIssue issue;

  @override
  List<Object> get props => [issue];
  Map<String, dynamic> toJson() => _$GhOpenIssueCloseIssuePayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhOpenIssueArguments extends JsonSerializable with EquatableMixin {
  GhOpenIssueArguments({@required this.id, @required this.open});

  factory GhOpenIssueArguments.fromJson(Map<String, dynamic> json) =>
      _$GhOpenIssueArgumentsFromJson(json);

  final String id;

  final bool open;

  @override
  List<Object> get props => [id, open];
  Map<String, dynamic> toJson() => _$GhOpenIssueArgumentsToJson(this);
}

class GhOpenIssueQuery extends GraphQLQuery<GhOpenIssue, GhOpenIssueArguments> {
  GhOpenIssueQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'GhOpenIssue'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'open')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'reopenIssue'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'issueId'),
                          value: VariableNode(name: NameNode(value: 'id')))
                    ]))
              ],
              directives: [
                DirectiveNode(name: NameNode(value: 'include'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'open')))
                ])
              ],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'issue'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'closed'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ])),
          FieldNode(
              name: NameNode(value: 'closeIssue'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'issueId'),
                          value: VariableNode(name: NameNode(value: 'id')))
                    ]))
              ],
              directives: [
                DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                  ArgumentNode(
                      name: NameNode(value: 'if'),
                      value: VariableNode(name: NameNode(value: 'open')))
                ])
              ],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'issue'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'closed'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GhOpenIssue';

  @override
  final GhOpenIssueArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhOpenIssue parse(Map<String, dynamic> json) => GhOpenIssue.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhIssues with EquatableMixin {
  GhIssues({this.repository});

  factory GhIssues.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesFromJson(json);

  GhIssuesRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GhIssuesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRepository extends GhIssuesPinnableItem
    with EquatableMixin
    implements
        GhIssuesNode,
        GhIssuesProjectOwner,
        GhIssuesRegistryPackageOwner,
        GhIssuesRegistryPackageSearch,
        GhIssuesSubscribable,
        GhIssuesStarrable,
        GhIssuesUniformResourceLocatable,
        GhIssuesRepositoryInfo {
  GhIssuesRepository({this.issues});

  factory GhIssuesRepository.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRepositoryFromJson(json);

  @override
  GhIssuesRepositoryOwner owner;

  @override
  String name;

  GhIssuesIssueConnection issues;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [owner, name, issues, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRepositoryOwner with EquatableMixin {
  GhIssuesRepositoryOwner({this.login});

  factory GhIssuesRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRepositoryOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesIssueConnection with EquatableMixin {
  GhIssuesIssueConnection({this.pageInfo, this.nodes});

  factory GhIssuesIssueConnection.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesIssueConnectionFromJson(json);

  GhIssuesPageInfo pageInfo;

  List<GhIssuesIssue> nodes;

  @override
  List<Object> get props => [pageInfo, nodes];
  Map<String, dynamic> toJson() => _$GhIssuesIssueConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesPageInfo with EquatableMixin {
  GhIssuesPageInfo({this.hasNextPage, this.endCursor});

  factory GhIssuesPageInfo.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesPageInfoFromJson(json);

  bool hasNextPage;

  String endCursor;

  @override
  List<Object> get props => [hasNextPage, endCursor];
  Map<String, dynamic> toJson() => _$GhIssuesPageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesIssue extends GhIssuesProjectCardItem
    with EquatableMixin
    implements
        GhIssuesNode,
        GhIssuesAssignable,
        GhIssuesClosable,
        GhIssuesComment,
        GhIssuesUpdatable,
        GhIssuesUpdatableComment,
        GhIssuesLabelable,
        GhIssuesLockable,
        GhIssuesReactable,
        GhIssuesRepositoryNode,
        GhIssuesSubscribable,
        GhIssuesUniformResourceLocatable {
  GhIssuesIssue({this.number, this.title, this.comments});

  factory GhIssuesIssue.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesIssueFromJson(json);

  @override
  GhIssuesRepository repository;

  int number;

  String title;

  @override
  DateTime updatedAt;

  @override
  GhIssuesActor author;

  @override
  GhIssuesLabelConnection labels;

  GhIssuesIssueCommentConnection comments;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [
        repository,
        number,
        title,
        updatedAt,
        author,
        labels,
        comments,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhIssuesIssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesPinnableItem with EquatableMixin {
  GhIssuesPinnableItem();

  factory GhIssuesPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhIssuesPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesNode with EquatableMixin {
  GhIssuesNode();

  factory GhIssuesNode.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesProjectOwner with EquatableMixin {
  GhIssuesProjectOwner();

  factory GhIssuesProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRegistryPackageOwner with EquatableMixin {
  GhIssuesRegistryPackageOwner();

  factory GhIssuesRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRegistryPackageSearch with EquatableMixin {
  GhIssuesRegistryPackageSearch();

  factory GhIssuesRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesSubscribable with EquatableMixin {
  GhIssuesSubscribable();

  factory GhIssuesSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesStarrable with EquatableMixin {
  GhIssuesStarrable();

  factory GhIssuesStarrable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesUniformResourceLocatable with EquatableMixin {
  GhIssuesUniformResourceLocatable();

  factory GhIssuesUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GhIssuesUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GhIssuesUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRepositoryInfo with EquatableMixin {
  GhIssuesRepositoryInfo({this.owner, this.name});

  factory GhIssuesRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRepositoryInfoFromJson(json);

  GhIssuesRepositoryOwner owner;

  String name;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [owner, name, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesActor with EquatableMixin {
  GhIssuesActor({this.login, this.avatarUrl});

  factory GhIssuesActor.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesActorFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesLabelConnection with EquatableMixin {
  GhIssuesLabelConnection({this.nodes});

  factory GhIssuesLabelConnection.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesLabelConnectionFromJson(json);

  List<GhIssuesLabel> nodes;

  @override
  List<Object> get props => [nodes];
  Map<String, dynamic> toJson() => _$GhIssuesLabelConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesLabel with EquatableMixin implements GhIssuesNode {
  GhIssuesLabel({this.name, this.color});

  factory GhIssuesLabel.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesLabelFromJson(json);

  String name;

  String color;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [name, color, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesLabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesIssueCommentConnection with EquatableMixin {
  GhIssuesIssueCommentConnection({this.totalCount});

  factory GhIssuesIssueCommentConnection.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesIssueCommentConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhIssuesIssueCommentConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesProjectCardItem with EquatableMixin {
  GhIssuesProjectCardItem();

  factory GhIssuesProjectCardItem.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesProjectCardItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GhIssuesProjectCardItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesAssignable with EquatableMixin {
  GhIssuesAssignable();

  factory GhIssuesAssignable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesAssignableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesAssignableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesClosable with EquatableMixin {
  GhIssuesClosable();

  factory GhIssuesClosable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesClosableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesClosableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesComment with EquatableMixin {
  GhIssuesComment({this.updatedAt, this.author});

  factory GhIssuesComment.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesCommentFromJson(json);

  DateTime updatedAt;

  GhIssuesActor author;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [updatedAt, author, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesUpdatable with EquatableMixin {
  GhIssuesUpdatable();

  factory GhIssuesUpdatable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesUpdatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesUpdatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesUpdatableComment with EquatableMixin {
  GhIssuesUpdatableComment();

  factory GhIssuesUpdatableComment.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesUpdatableCommentFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesUpdatableCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesLabelable with EquatableMixin {
  GhIssuesLabelable({this.labels});

  factory GhIssuesLabelable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesLabelableFromJson(json);

  GhIssuesLabelConnection labels;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [labels, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesLabelableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesLockable with EquatableMixin {
  GhIssuesLockable();

  factory GhIssuesLockable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesLockableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesLockableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesReactable with EquatableMixin {
  GhIssuesReactable();

  factory GhIssuesReactable.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesReactableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesReactableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesRepositoryNode with EquatableMixin {
  GhIssuesRepositoryNode({this.repository});

  factory GhIssuesRepositoryNode.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesRepositoryNodeFromJson(json);

  GhIssuesRepository repository;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [repository, resolveType];
  Map<String, dynamic> toJson() => _$GhIssuesRepositoryNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhIssuesArguments extends JsonSerializable with EquatableMixin {
  GhIssuesArguments({@required this.owner, @required this.name, this.cursor});

  factory GhIssuesArguments.fromJson(Map<String, dynamic> json) =>
      _$GhIssuesArgumentsFromJson(json);

  final String owner;

  final String name;

  final String cursor;

  @override
  List<Object> get props => [owner, name, cursor];
  Map<String, dynamic> toJson() => _$GhIssuesArgumentsToJson(this);
}

class GhIssuesQuery extends GraphQLQuery<GhIssues, GhIssuesArguments> {
  GhIssuesQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GhIssues'),
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
              variable: VariableNode(name: NameNode(value: 'cursor')),
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
                    name: NameNode(value: 'owner'),
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
                    ])),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'issues'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'states'),
                          value: EnumValueNode(name: NameNode(value: 'OPEN'))),
                      ArgumentNode(
                          name: NameNode(value: 'orderBy'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'field'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'CREATED_AT'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'direction'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'DESC')))
                          ])),
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'cursor')))
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
                                name: NameNode(value: 'repository'),
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
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'title'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'updatedAt'),
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
                                name: NameNode(value: 'labels'),
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
                                      selectionSet:
                                          SelectionSetNode(selections: [
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
                                ])),
                            FieldNode(
                                name: NameNode(value: 'comments'),
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
        ]))
  ]);

  @override
  final String operationName = 'GhIssues';

  @override
  final GhIssuesArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GhIssues parse(Map<String, dynamic> json) => GhIssues.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GhRepos with EquatableMixin {
  GhRepos({this.user});

  factory GhRepos.fromJson(Map<String, dynamic> json) =>
      _$GhReposFromJson(json);

  GhReposUser user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$GhReposToJson(this);
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
  GhReposUser({this.starredRepositories});

  factory GhReposUser.fromJson(Map<String, dynamic> json) =>
      _$GhReposUserFromJson(json);

  @override
  String login;

  @override
  String avatarUrl;

  @override
  GhReposRepositoryConnection repositories;

  GhReposStarredRepositoryConnection starredRepositories;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [login, avatarUrl, repositories, starredRepositories, resolveType];
  Map<String, dynamic> toJson() => _$GhReposUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepositoryConnection with EquatableMixin {
  GhReposRepositoryConnection({this.totalCount, this.pageInfo, this.nodes});

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
  GhReposPageInfo({this.hasNextPage, this.endCursor});

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
  GhReposRepository({this.forks, this.primaryLanguage});

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
  DateTime updatedAt;

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
        updatedAt,
        stargazers,
        forks,
        primaryLanguage,
        resolveType
      ];
  Map<String, dynamic> toJson() => _$GhReposRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposRepositoryOwner with EquatableMixin {
  GhReposRepositoryOwner({this.login, this.avatarUrl});

  factory GhReposRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GhReposRepositoryOwnerFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhReposRepositoryOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposStargazerConnection with EquatableMixin {
  GhReposStargazerConnection({this.totalCount});

  factory GhReposStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhReposStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhReposStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposLanguage with EquatableMixin implements GhReposNode {
  GhReposLanguage({this.color, this.name});

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
  GhReposStarrable({this.stargazers});

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
  GhReposRepositoryInfo(
      {this.owner,
      this.name,
      this.description,
      this.isPrivate,
      this.isFork,
      this.updatedAt});

  factory GhReposRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GhReposRepositoryInfoFromJson(json);

  GhReposRepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  DateTime updatedAt;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, updatedAt, resolveType];
  Map<String, dynamic> toJson() => _$GhReposRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposStarredRepositoryConnection with EquatableMixin {
  GhReposStarredRepositoryConnection({this.pageInfo, this.nodes});

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
  GhReposActor({this.login, this.avatarUrl});

  factory GhReposActor.fromJson(Map<String, dynamic> json) =>
      _$GhReposActorFromJson(json);

  String login;

  String avatarUrl;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, avatarUrl, resolveType];
  Map<String, dynamic> toJson() => _$GhReposActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhReposProfileOwner with EquatableMixin {
  GhReposProfileOwner({this.login});

  factory GhReposProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GhReposProfileOwnerFromJson(json);

  String login;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [login, resolveType];
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
class GhReposArguments extends JsonSerializable with EquatableMixin {
  GhReposArguments({@required this.owner, this.after, @required this.isStar});

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
              name: NameNode(value: 'user'),
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
                FieldNode(
                    name: NameNode(value: 'repositories'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'first'),
                          value: IntValueNode(value: '30')),
                      ArgumentNode(
                          name: NameNode(value: 'after'),
                          value: VariableNode(name: NameNode(value: 'after'))),
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
                      DirectiveNode(name: NameNode(value: 'skip'), arguments: [
                        ArgumentNode(
                            name: NameNode(value: 'if'),
                            value:
                                VariableNode(name: NameNode(value: 'isStar')))
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
                                name: NameNode(value: 'updatedAt'),
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
                          value: VariableNode(name: NameNode(value: 'after'))),
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
                                name: NameNode(value: 'updatedAt'),
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
  GhUser({this.repositoryOwner, this.viewer});

  factory GhUser.fromJson(Map<String, dynamic> json) => _$GhUserFromJson(json);

  GhUserRepositoryOwner repositoryOwner;

  GhUserUser viewer;

  @override
  List<Object> get props => [repositoryOwner, viewer];
  Map<String, dynamic> toJson() => _$GhUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepositoryOwner with EquatableMixin {
  GhUserRepositoryOwner({this.id, this.login, this.avatarUrl, this.url});

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

  String id;

  String login;

  String avatarUrl;

  String url;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [id, login, avatarUrl, url, resolveType];
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
  GhUserUser(
      {this.name,
      this.bio,
      this.company,
      this.location,
      this.email,
      this.createdAt,
      this.websiteUrl,
      this.starredRepositories,
      this.followers,
      this.following,
      this.contributionsCollection,
      this.repositories,
      this.pinnedItems,
      this.viewerCanFollow,
      this.viewerIsFollowing});

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
  String id;

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
        id,
        login,
        avatarUrl,
        url
      ];
  Map<String, dynamic> toJson() => _$GhUserUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserStarredRepositoryConnection with EquatableMixin {
  GhUserStarredRepositoryConnection({this.totalCount});

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
  GhUserFollowerConnection({this.totalCount});

  factory GhUserFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserFollowerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserFollowingConnection with EquatableMixin {
  GhUserFollowingConnection({this.totalCount});

  factory GhUserFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserFollowingConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionsCollection with EquatableMixin {
  GhUserContributionsCollection({this.contributionCalendar});

  factory GhUserContributionsCollection.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionsCollectionFromJson(json);

  GhUserContributionCalendar contributionCalendar;

  @override
  List<Object> get props => [contributionCalendar];
  Map<String, dynamic> toJson() => _$GhUserContributionsCollectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendar with EquatableMixin {
  GhUserContributionCalendar({this.weeks});

  factory GhUserContributionCalendar.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarFromJson(json);

  List<GhUserContributionCalendarWeek> weeks;

  @override
  List<Object> get props => [weeks];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendarWeek with EquatableMixin {
  GhUserContributionCalendarWeek({this.contributionDays});

  factory GhUserContributionCalendarWeek.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarWeekFromJson(json);

  List<GhUserContributionCalendarDay> contributionDays;

  @override
  List<Object> get props => [contributionDays];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarWeekToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserContributionCalendarDay with EquatableMixin {
  GhUserContributionCalendarDay({this.color});

  factory GhUserContributionCalendarDay.fromJson(Map<String, dynamic> json) =>
      _$GhUserContributionCalendarDayFromJson(json);

  String color;

  @override
  List<Object> get props => [color];
  Map<String, dynamic> toJson() => _$GhUserContributionCalendarDayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserRepositoryConnection with EquatableMixin {
  GhUserRepositoryConnection({this.totalCount, this.nodes});

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
  GhUserRepository({this.forks, this.primaryLanguage});

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
  GhUserStargazerConnection({this.totalCount});

  factory GhUserStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GhUserStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GhUserStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserLanguage with EquatableMixin implements GhUserNode {
  GhUserLanguage({this.color, this.name});

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
  GhUserStarrable({this.stargazers});

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
  GhUserRepositoryInfo(
      {this.owner, this.name, this.description, this.isPrivate, this.isFork});

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
  GhUserPinnableItemConnection({this.totalCount, this.nodes});

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
  GhUserProfileOwner(
      {this.name,
      this.location,
      this.email,
      this.websiteUrl,
      this.pinnedItems});

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
  GhUserOrganization(
      {this.name,
      this.description,
      this.location,
      this.email,
      this.websiteUrl,
      this.createdAt,
      this.pinnedItems,
      this.pinnableItems,
      this.membersWithRole});

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
  String id;

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
        id,
        login,
        avatarUrl,
        url
      ];
  Map<String, dynamic> toJson() => _$GhUserOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GhUserOrganizationMemberConnection with EquatableMixin {
  GhUserOrganizationMemberConnection({this.totalCount});

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
  GhUserArguments({@required this.login, @required this.isViewer});

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
                    name: NameNode(value: 'id'),
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
                    name: NameNode(value: 'id'),
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
                          value: EnumValueNode(name: NameNode(value: 'OWNER'))),
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
                                        name: NameNode(value: 'Repository'),
                                        isNonNull: false)),
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

mixin TMixin {
  GhCommitsGitObject target;
}

@JsonSerializable(explicitToJson: true)
class GhCommits with EquatableMixin {
  GhCommits({this.repository});

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
  GhCommitsRepository({this.defaultBranchRef, this.ref});

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
  GhCommitsCommit(
      {this.oid,
      this.url,
      this.messageHeadline,
      this.committedDate,
      this.author,
      this.status,
      this.history});

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
  GhCommitsGitActor({this.name, this.avatarUrl, this.user});

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
  GhCommitsActor({this.login});

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
  GhCommitsRepositoryOwner({this.login});

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
  GhCommitsProfileOwner({this.login});

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
  GhCommitsStatus({this.state});

  factory GhCommitsStatus.fromJson(Map<String, dynamic> json) =>
      _$GhCommitsStatusFromJson(json);

  @JsonKey(unknownEnumValue: GhCommitsStatusState.ARTEMIS_UNKNOWN)
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
  GhCommitsCommitHistoryConnection({this.pageInfo, this.nodes});

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
  GhCommitsPageInfo({this.hasNextPage, this.endCursor});

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
  ARTEMIS_UNKNOWN,
}

@JsonSerializable(explicitToJson: true)
class GhCommitsArguments extends JsonSerializable with EquatableMixin {
  GhCommitsArguments(
      {@required this.owner,
      @required this.name,
      @required this.ref,
      @required this.hasRef,
      this.after});

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
