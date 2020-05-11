// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitbucket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BbPagination _$BbPaginationFromJson(Map<String, dynamic> json) {
  return BbPagination()
    ..pagelen = json['pagelen'] as int
    ..size = json['size'] as int
    ..page = json['page'] as int
    ..next = json['next'] as String
    ..values = json['values'] as List;
}

Map<String, dynamic> _$BbPaginationToJson(BbPagination instance) =>
    <String, dynamic>{
      'pagelen': instance.pagelen,
      'size': instance.size,
      'page': instance.page,
      'next': instance.next,
      'values': instance.values,
    };

BbRepoOwner _$BbRepoOwnerFromJson(Map<String, dynamic> json) {
  return BbRepoOwner()
    ..nickname = json['nickname'] as String
    ..displayName = json['display_name'] as String
    ..type = json['type'] as String
    ..links = json['links'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BbRepoOwnerToJson(BbRepoOwner instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'display_name': instance.displayName,
      'type': instance.type,
      'links': instance.links,
    };

BbUser _$BbUserFromJson(Map<String, dynamic> json) {
  return BbUser()
    ..nickname = json['nickname'] as String
    ..displayName = json['display_name'] as String
    ..type = json['type'] as String
    ..links = json['links'] as Map<String, dynamic>
    ..username = json['username'] as String
    ..isStaff = json['is_staff'] as bool
    ..createdOn = json['created_on'] == null
        ? null
        : DateTime.parse(json['created_on'] as String)
    ..accountId = json['account_id'] as String;
}

Map<String, dynamic> _$BbUserToJson(BbUser instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'display_name': instance.displayName,
      'type': instance.type,
      'links': instance.links,
      'username': instance.username,
      'is_staff': instance.isStaff,
      'created_on': instance.createdOn?.toIso8601String(),
      'account_id': instance.accountId,
    };

BbRepo _$BbRepoFromJson(Map<String, dynamic> json) {
  return BbRepo()
    ..name = json['name'] as String
    ..owner = json['owner'] == null
        ? null
        : BbRepoOwner.fromJson(json['owner'] as Map<String, dynamic>)
    ..website = json['website'] as String
    ..language = json['language'] as String
    ..size = json['size'] as int
    ..type = json['type'] as String
    ..isPrivate = json['is_private'] as bool
    ..createdOn = json['created_on'] == null
        ? null
        : DateTime.parse(json['created_on'] as String)
    ..updatedOn = json['updated_on'] == null
        ? null
        : DateTime.parse(json['updated_on'] as String)
    ..description = json['description'] as String
    ..fullName = json['full_name'] as String
    ..slug = json['slug'] as String
    ..mainbranch = json['mainbranch'] == null
        ? null
        : BbRepoMainbranch.fromJson(json['mainbranch'] as Map<String, dynamic>)
    ..links = json['links'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BbRepoToJson(BbRepo instance) => <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'website': instance.website,
      'language': instance.language,
      'size': instance.size,
      'type': instance.type,
      'is_private': instance.isPrivate,
      'created_on': instance.createdOn?.toIso8601String(),
      'updated_on': instance.updatedOn?.toIso8601String(),
      'description': instance.description,
      'full_name': instance.fullName,
      'slug': instance.slug,
      'mainbranch': instance.mainbranch,
      'links': instance.links,
    };

BbRepoMainbranch _$BbRepoMainbranchFromJson(Map<String, dynamic> json) {
  return BbRepoMainbranch()
    ..type = json['type'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$BbRepoMainbranchToJson(BbRepoMainbranch instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };

BbTree _$BbTreeFromJson(Map<String, dynamic> json) {
  return BbTree()
    ..type = json['type'] as String
    ..path = json['path'] as String
    ..size = json['size'] as int
    ..links = json['links'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BbTreeToJson(BbTree instance) => <String, dynamic>{
      'type': instance.type,
      'path': instance.path,
      'size': instance.size,
      'links': instance.links,
    };

BbCommit _$BbCommitFromJson(Map<String, dynamic> json) {
  return BbCommit()
    ..message = json['message'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..hash = json['hash'] as String
    ..author = json['author'] == null
        ? null
        : BbCommitAuthor.fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BbCommitToJson(BbCommit instance) => <String, dynamic>{
      'message': instance.message,
      'date': instance.date?.toIso8601String(),
      'hash': instance.hash,
      'author': instance.author,
    };

BbCommitAuthor _$BbCommitAuthorFromJson(Map<String, dynamic> json) {
  return BbCommitAuthor()
    ..raw = json['raw'] as String
    ..user = json['user'] == null
        ? null
        : BbRepoOwner.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BbCommitAuthorToJson(BbCommitAuthor instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'user': instance.user,
    };
