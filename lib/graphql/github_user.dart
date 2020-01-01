// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_user.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubUser with EquatableMixin {
  GithubUser();

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  GithubUserRepositoryOwner repositoryOwner;

  @override
  List<Object> get props => [repositoryOwner];
  Map<String, dynamic> toJson() => _$GithubUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRepositoryOwner with EquatableMixin {
  GithubUserRepositoryOwner();

  factory GithubUserRepositoryOwner.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'User':
        return GithubUserUser.fromJson(json);
      case 'Organization':
        return GithubUserOrganization.fromJson(json);
      default:
    }
    return _$GithubUserRepositoryOwnerFromJson(json);
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
        return (this as GithubUserUser).toJson();
      case 'Organization':
        return (this as GithubUserOrganization).toJson();
      default:
    }
    return _$GithubUserRepositoryOwnerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GithubUserUser extends GithubUserAuditEntryActor
    with EquatableMixin
    implements
        GithubUserNode,
        GithubUserActor,
        GithubUserRegistryPackageOwner,
        GithubUserRegistryPackageSearch,
        GithubUserProjectOwner,
        GithubUserRepositoryOwner,
        GithubUserUniformResourceLocatable,
        GithubUserProfileOwner,
        GithubUserSponsorable {
  GithubUserUser();

  factory GithubUserUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserUserFromJson(json);

  String name;

  String bio;

  String company;

  String location;

  String email;

  String websiteUrl;

  GithubUserStarredRepositoryConnection starredRepositories;

  GithubUserFollowerConnection followers;

  GithubUserFollowingConnection following;

  GithubUserContributionsCollection contributionsCollection;

  GithubUserRepositoryConnection repositories;

  GithubUserPinnableItemConnection pinnedItems;

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
  Map<String, dynamic> toJson() => _$GithubUserUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserStarredRepositoryConnection with EquatableMixin {
  GithubUserStarredRepositoryConnection();

  factory GithubUserStarredRepositoryConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserStarredRepositoryConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubUserStarredRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserFollowerConnection with EquatableMixin {
  GithubUserFollowerConnection();

  factory GithubUserFollowerConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFollowerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubUserFollowerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserFollowingConnection with EquatableMixin {
  GithubUserFollowingConnection();

  factory GithubUserFollowingConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFollowingConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubUserFollowingConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserContributionsCollection with EquatableMixin {
  GithubUserContributionsCollection();

  factory GithubUserContributionsCollection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserContributionsCollectionFromJson(json);

  GithubUserContributionCalendar contributionCalendar;

  @override
  List<Object> get props => [contributionCalendar];
  Map<String, dynamic> toJson() =>
      _$GithubUserContributionsCollectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserContributionCalendar with EquatableMixin {
  GithubUserContributionCalendar();

  factory GithubUserContributionCalendar.fromJson(Map<String, dynamic> json) =>
      _$GithubUserContributionCalendarFromJson(json);

  List<GithubUserContributionCalendarWeek> weeks;

  @override
  List<Object> get props => [weeks];
  Map<String, dynamic> toJson() => _$GithubUserContributionCalendarToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserContributionCalendarWeek with EquatableMixin {
  GithubUserContributionCalendarWeek();

  factory GithubUserContributionCalendarWeek.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserContributionCalendarWeekFromJson(json);

  List<GithubUserContributionCalendarDay> contributionDays;

  @override
  List<Object> get props => [contributionDays];
  Map<String, dynamic> toJson() =>
      _$GithubUserContributionCalendarWeekToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserContributionCalendarDay with EquatableMixin {
  GithubUserContributionCalendarDay();

  factory GithubUserContributionCalendarDay.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserContributionCalendarDayFromJson(json);

  String color;

  @override
  List<Object> get props => [color];
  Map<String, dynamic> toJson() =>
      _$GithubUserContributionCalendarDayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRepositoryConnection with EquatableMixin {
  GithubUserRepositoryConnection();

  factory GithubUserRepositoryConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUserRepositoryConnectionFromJson(json);

  int totalCount;

  List<GithubUserRepository> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() => _$GithubUserRepositoryConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRepository extends GithubUserPinnableItem
    with EquatableMixin
    implements
        GithubUserNode,
        GithubUserProjectOwner,
        GithubUserRegistryPackageOwner,
        GithubUserRegistryPackageSearch,
        GithubUserSubscribable,
        GithubUserStarrable,
        GithubUserUniformResourceLocatable,
        GithubUserRepositoryInfo {
  GithubUserRepository();

  factory GithubUserRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubUserRepositoryFromJson(json);

  @override
  GithubUserRepositoryOwner owner;

  @override
  String name;

  @override
  String description;

  @override
  bool isPrivate;

  @override
  bool isFork;

  @override
  GithubUserStargazerConnection stargazers;

  GithubUserRepositoryConnection forks;

  GithubUserLanguage primaryLanguage;

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
  Map<String, dynamic> toJson() => _$GithubUserRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserStargazerConnection with EquatableMixin {
  GithubUserStargazerConnection();

  factory GithubUserStargazerConnection.fromJson(Map<String, dynamic> json) =>
      _$GithubUserStargazerConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() => _$GithubUserStargazerConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserLanguage with EquatableMixin implements GithubUserNode {
  GithubUserLanguage();

  factory GithubUserLanguage.fromJson(Map<String, dynamic> json) =>
      _$GithubUserLanguageFromJson(json);

  String color;

  String name;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [color, name, resolveType];
  Map<String, dynamic> toJson() => _$GithubUserLanguageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserNode with EquatableMixin {
  GithubUserNode();

  factory GithubUserNode.fromJson(Map<String, dynamic> json) =>
      _$GithubUserNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserPinnableItem with EquatableMixin {
  GithubUserPinnableItem();

  factory GithubUserPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubUserPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubUserPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserProjectOwner with EquatableMixin {
  GithubUserProjectOwner();

  factory GithubUserProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUserProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRegistryPackageOwner with EquatableMixin {
  GithubUserRegistryPackageOwner();

  factory GithubUserRegistryPackageOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUserRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRegistryPackageSearch with EquatableMixin {
  GithubUserRegistryPackageSearch();

  factory GithubUserRegistryPackageSearch.fromJson(Map<String, dynamic> json) =>
      _$GithubUserRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubUserRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserSubscribable with EquatableMixin {
  GithubUserSubscribable();

  factory GithubUserSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubUserSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserStarrable with EquatableMixin {
  GithubUserStarrable();

  factory GithubUserStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubUserStarrableFromJson(json);

  GithubUserStargazerConnection stargazers;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [stargazers, resolveType];
  Map<String, dynamic> toJson() => _$GithubUserStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserUniformResourceLocatable with EquatableMixin {
  GithubUserUniformResourceLocatable();

  factory GithubUserUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubUserUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserRepositoryInfo with EquatableMixin {
  GithubUserRepositoryInfo();

  factory GithubUserRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubUserRepositoryInfoFromJson(json);

  GithubUserRepositoryOwner owner;

  String name;

  String description;

  bool isPrivate;

  bool isFork;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [owner, name, description, isPrivate, isFork, resolveType];
  Map<String, dynamic> toJson() => _$GithubUserRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserPinnableItemConnection with EquatableMixin {
  GithubUserPinnableItemConnection();

  factory GithubUserPinnableItemConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserPinnableItemConnectionFromJson(json);

  int totalCount;

  List<GithubUserPinnableItem> nodes;

  @override
  List<Object> get props => [totalCount, nodes];
  Map<String, dynamic> toJson() =>
      _$GithubUserPinnableItemConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserAuditEntryActor with EquatableMixin {
  GithubUserAuditEntryActor();

  factory GithubUserAuditEntryActor.fromJson(Map<String, dynamic> json) =>
      _$GithubUserAuditEntryActorFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubUserAuditEntryActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserActor with EquatableMixin {
  GithubUserActor();

  factory GithubUserActor.fromJson(Map<String, dynamic> json) =>
      _$GithubUserActorFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserProfileOwner with EquatableMixin {
  GithubUserProfileOwner();

  factory GithubUserProfileOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubUserProfileOwnerFromJson(json);

  String name;

  String location;

  String email;

  String websiteUrl;

  GithubUserPinnableItemConnection pinnedItems;

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props =>
      [name, location, email, websiteUrl, pinnedItems, resolveType];
  Map<String, dynamic> toJson() => _$GithubUserProfileOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserSponsorable with EquatableMixin {
  GithubUserSponsorable();

  factory GithubUserSponsorable.fromJson(Map<String, dynamic> json) =>
      _$GithubUserSponsorableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserSponsorableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserOrganization extends GithubUserAuditEntryActor
    with EquatableMixin
    implements
        GithubUserNode,
        GithubUserActor,
        GithubUserRegistryPackageOwner,
        GithubUserRegistryPackageSearch,
        GithubUserProjectOwner,
        GithubUserRepositoryOwner,
        GithubUserUniformResourceLocatable,
        GithubUserMemberStatusable,
        GithubUserProfileOwner,
        GithubUserSponsorable {
  GithubUserOrganization();

  factory GithubUserOrganization.fromJson(Map<String, dynamic> json) =>
      _$GithubUserOrganizationFromJson(json);

  String name;

  String description;

  String location;

  String email;

  String websiteUrl;

  GithubUserPinnableItemConnection pinnedItems;

  GithubUserPinnableItemConnection pinnableItems;

  GithubUserOrganizationMemberConnection membersWithRole;

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
        pinnedItems,
        pinnableItems,
        membersWithRole,
        resolveType,
        login,
        avatarUrl,
        url
      ];
  Map<String, dynamic> toJson() => _$GithubUserOrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserOrganizationMemberConnection with EquatableMixin {
  GithubUserOrganizationMemberConnection();

  factory GithubUserOrganizationMemberConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GithubUserOrganizationMemberConnectionFromJson(json);

  int totalCount;

  @override
  List<Object> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$GithubUserOrganizationMemberConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserMemberStatusable with EquatableMixin {
  GithubUserMemberStatusable();

  factory GithubUserMemberStatusable.fromJson(Map<String, dynamic> json) =>
      _$GithubUserMemberStatusableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubUserMemberStatusableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubUserArguments extends JsonSerializable with EquatableMixin {
  GithubUserArguments({this.login});

  factory GithubUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubUserArgumentsFromJson(json);

  final String login;

  @override
  List<Object> get props => [login];
  Map<String, dynamic> toJson() => _$GithubUserArgumentsToJson(this);
}

class GithubUserQuery extends GraphQLQuery<GithubUser, GithubUserArguments> {
  GithubUserQuery({this.variables});

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
              ]))
        ]))
  ]);

  @override
  final String operationName = 'github_user';

  @override
  final GithubUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubUser parse(Map<String, dynamic> json) => GithubUser.fromJson(json);
}
