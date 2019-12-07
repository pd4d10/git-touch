// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubObject _$GithubObjectFromJson(Map<String, dynamic> json) {
  return GithubObject()
    ..repository = json['repository'] == null
        ? null
        : GithubObjectRepository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GithubObjectToJson(GithubObject instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

GithubObjectRepository _$GithubObjectRepositoryFromJson(
    Map<String, dynamic> json) {
  return GithubObjectRepository()
    ..object = json['object'] == null
        ? null
        : GithubObjectGitObject.fromJson(json['object'] as Map<String, dynamic>)
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectRepositoryToJson(
        GithubObjectRepository instance) =>
    <String, dynamic>{
      'object': instance.object?.toJson(),
      '__typename': instance.resolveType,
    };

GithubObjectGitObject _$GithubObjectGitObjectFromJson(
    Map<String, dynamic> json) {
  return GithubObjectGitObject()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectGitObjectToJson(
        GithubObjectGitObject instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectTree _$GithubObjectTreeFromJson(Map<String, dynamic> json) {
  return GithubObjectTree()
    ..entries = (json['entries'] as List)
        ?.map((e) => e == null
            ? null
            : GithubObjectTreeEntry.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectTreeToJson(GithubObjectTree instance) =>
    <String, dynamic>{
      'entries': instance.entries?.map((e) => e?.toJson())?.toList(),
      '__typename': instance.resolveType,
    };

GithubObjectTreeEntry _$GithubObjectTreeEntryFromJson(
    Map<String, dynamic> json) {
  return GithubObjectTreeEntry()
    ..type = json['type'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GithubObjectTreeEntryToJson(
        GithubObjectTreeEntry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };

GithubObjectNode _$GithubObjectNodeFromJson(Map<String, dynamic> json) {
  return GithubObjectNode()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectNodeToJson(GithubObjectNode instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectBlob _$GithubObjectBlobFromJson(Map<String, dynamic> json) {
  return GithubObjectBlob()
    ..text = json['text'] as String
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectBlobToJson(GithubObjectBlob instance) =>
    <String, dynamic>{
      'text': instance.text,
      '__typename': instance.resolveType,
    };

GithubObjectPinnableItem _$GithubObjectPinnableItemFromJson(
    Map<String, dynamic> json) {
  return GithubObjectPinnableItem();
}

Map<String, dynamic> _$GithubObjectPinnableItemToJson(
        GithubObjectPinnableItem instance) =>
    <String, dynamic>{};

GithubObjectProjectOwner _$GithubObjectProjectOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubObjectProjectOwner()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectProjectOwnerToJson(
        GithubObjectProjectOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectRegistryPackageOwner _$GithubObjectRegistryPackageOwnerFromJson(
    Map<String, dynamic> json) {
  return GithubObjectRegistryPackageOwner()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectRegistryPackageOwnerToJson(
        GithubObjectRegistryPackageOwner instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectRegistryPackageSearch _$GithubObjectRegistryPackageSearchFromJson(
    Map<String, dynamic> json) {
  return GithubObjectRegistryPackageSearch()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectRegistryPackageSearchToJson(
        GithubObjectRegistryPackageSearch instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectSubscribable _$GithubObjectSubscribableFromJson(
    Map<String, dynamic> json) {
  return GithubObjectSubscribable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectSubscribableToJson(
        GithubObjectSubscribable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectStarrable _$GithubObjectStarrableFromJson(
    Map<String, dynamic> json) {
  return GithubObjectStarrable()..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectStarrableToJson(
        GithubObjectStarrable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectUniformResourceLocatable
    _$GithubObjectUniformResourceLocatableFromJson(Map<String, dynamic> json) {
  return GithubObjectUniformResourceLocatable()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectUniformResourceLocatableToJson(
        GithubObjectUniformResourceLocatable instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectRepositoryInfo _$GithubObjectRepositoryInfoFromJson(
    Map<String, dynamic> json) {
  return GithubObjectRepositoryInfo()
    ..resolveType = json['__typename'] as String;
}

Map<String, dynamic> _$GithubObjectRepositoryInfoToJson(
        GithubObjectRepositoryInfo instance) =>
    <String, dynamic>{
      '__typename': instance.resolveType,
    };

GithubObjectArguments _$GithubObjectArgumentsFromJson(
    Map<String, dynamic> json) {
  return GithubObjectArguments(
    owner: json['owner'] as String,
    name: json['name'] as String,
    expression: json['expression'] as String,
  );
}

Map<String, dynamic> _$GithubObjectArgumentsToJson(
        GithubObjectArguments instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'expression': instance.expression,
    };
