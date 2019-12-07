// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'github_object.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubObject with EquatableMixin {
  GithubObject();

  factory GithubObject.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectFromJson(json);

  GithubObjectRepository repository;

  @override
  List<Object> get props => [repository];
  Map<String, dynamic> toJson() => _$GithubObjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectRepository extends GithubObjectPinnableItem
    with EquatableMixin
    implements
        GithubObjectNode,
        GithubObjectProjectOwner,
        GithubObjectRegistryPackageOwner,
        GithubObjectRegistryPackageSearch,
        GithubObjectSubscribable,
        GithubObjectStarrable,
        GithubObjectUniformResourceLocatable,
        GithubObjectRepositoryInfo {
  GithubObjectRepository();

  factory GithubObjectRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectRepositoryFromJson(json);

  GithubObjectGitObject object;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [object, resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectRepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectGitObject with EquatableMixin {
  GithubObjectGitObject();

  factory GithubObjectGitObject.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case 'Tree':
        return GithubObjectTree.fromJson(json);
      case 'Blob':
        return GithubObjectBlob.fromJson(json);
      default:
    }
    return _$GithubObjectGitObjectFromJson(json);
  }

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() {
    switch (resolveType) {
      case 'Tree':
        return (this as GithubObjectTree).toJson();
      case 'Blob':
        return (this as GithubObjectBlob).toJson();
      default:
    }
    return _$GithubObjectGitObjectToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GithubObjectTree
    with EquatableMixin
    implements GithubObjectNode, GithubObjectGitObject {
  GithubObjectTree();

  factory GithubObjectTree.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectTreeFromJson(json);

  List<GithubObjectTreeEntry> entries;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [entries, resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectTreeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectTreeEntry with EquatableMixin {
  GithubObjectTreeEntry();

  factory GithubObjectTreeEntry.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectTreeEntryFromJson(json);

  String type;

  String name;

  @override
  List<Object> get props => [type, name];
  Map<String, dynamic> toJson() => _$GithubObjectTreeEntryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectNode with EquatableMixin {
  GithubObjectNode();

  factory GithubObjectNode.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectNodeFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectBlob
    with EquatableMixin
    implements GithubObjectNode, GithubObjectGitObject {
  GithubObjectBlob();

  factory GithubObjectBlob.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectBlobFromJson(json);

  String text;

  @override
  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [text, resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectBlobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectPinnableItem with EquatableMixin {
  GithubObjectPinnableItem();

  factory GithubObjectPinnableItem.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectPinnableItemFromJson(json);

  @override
  List<Object> get props => [];
  Map<String, dynamic> toJson() => _$GithubObjectPinnableItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectProjectOwner with EquatableMixin {
  GithubObjectProjectOwner();

  factory GithubObjectProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectProjectOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectProjectOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectRegistryPackageOwner with EquatableMixin {
  GithubObjectRegistryPackageOwner();

  factory GithubObjectRegistryPackageOwner.fromJson(
          Map<String, dynamic> json) =>
      _$GithubObjectRegistryPackageOwnerFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubObjectRegistryPackageOwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectRegistryPackageSearch with EquatableMixin {
  GithubObjectRegistryPackageSearch();

  factory GithubObjectRegistryPackageSearch.fromJson(
          Map<String, dynamic> json) =>
      _$GithubObjectRegistryPackageSearchFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubObjectRegistryPackageSearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectSubscribable with EquatableMixin {
  GithubObjectSubscribable();

  factory GithubObjectSubscribable.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectSubscribableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectSubscribableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectStarrable with EquatableMixin {
  GithubObjectStarrable();

  factory GithubObjectStarrable.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectStarrableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectStarrableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectUniformResourceLocatable with EquatableMixin {
  GithubObjectUniformResourceLocatable();

  factory GithubObjectUniformResourceLocatable.fromJson(
          Map<String, dynamic> json) =>
      _$GithubObjectUniformResourceLocatableFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() =>
      _$GithubObjectUniformResourceLocatableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectRepositoryInfo with EquatableMixin {
  GithubObjectRepositoryInfo();

  factory GithubObjectRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectRepositoryInfoFromJson(json);

  @JsonKey(name: '__typename')
  String resolveType;

  @override
  List<Object> get props => [resolveType];
  Map<String, dynamic> toJson() => _$GithubObjectRepositoryInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GithubObjectArguments extends JsonSerializable with EquatableMixin {
  GithubObjectArguments({this.owner, this.name, this.expression});

  factory GithubObjectArguments.fromJson(Map<String, dynamic> json) =>
      _$GithubObjectArgumentsFromJson(json);

  final String owner;

  final String name;

  final String expression;

  @override
  List<Object> get props => [owner, name, expression];
  Map<String, dynamic> toJson() => _$GithubObjectArgumentsToJson(this);
}

class GithubObjectQuery
    extends GraphQLQuery<GithubObject, GithubObjectArguments> {
  GithubObjectQuery({this.variables});

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
  final String operationName = 'github_object';

  @override
  final GithubObjectArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GithubObject parse(Map<String, dynamic> json) => GithubObject.fromJson(json);
}
