import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rhodecode.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class GetUserResponse {
  GetUserResponse();
  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
  String? error;
  int? id;
  RhodecodeUser? result;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhodecodeUser {
  RhodecodeUser();
  factory RhodecodeUser.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeUserFromJson(json);
  bool? active;
  String? username;
  int? userId;
  // String? avatarUrl;
  String? email;
  String? firstName;
  String? lastName;
  String? description;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhRepoListResponse {
  RhRepoListResponse();
  factory RhRepoListResponse.fromJson(Map<String, dynamic> json) =>
      _$RhRepoListResponseFromJson(json);
  String? error;
  int? id;
  List<RhRepo>? result;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhRepoResponse {
  RhRepoResponse();
  factory RhRepoResponse.fromJson(Map<String, dynamic> json) =>
      _$RhRepoResponseFromJson(json);
  String? error;
  int? id;
  RhRepo? result;
}

@JsonSerializable(
    fieldRename: FieldRename.snake,
    disallowUnrecognizedKeys: false,
    explicitToJson: true
    )
class RhRepo {
  RhRepo();
  factory RhRepo.fromJson(Map<String, dynamic> json) => _$RhRepoFromJson(json);
  String? owner;
  String? repoName;
  String? url;
  bool? private;
  DateTime? createdOn;
  String? description;
  int? repoId;
  int? forkOfId;
  RhLastChangeset? lastChangeset;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhLastChangeset {
  RhLastChangeset();
  factory RhLastChangeset.fromJson(Map<String, dynamic> json) =>
      _$RhLastChangesetFromJson(json);
  String? author;
  String? branch;
  DateTime? date;
  String? message;
  // TODO parents
  String? rawId;
  int? repoCommitCount;
  int? revision;
  String? shortId;
  // DateTime? updateOn; // TODO
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhRepoRefsResponse {
  RhRepoRefsResponse();
  factory RhRepoRefsResponse.fromJson(Map<String, dynamic> json) =>
      _$RhRepoRefsResponseFromJson(json);
  String? error;
  int? id;
  RhRepoRefs? result;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RhRepoRefs {
  RhRepoRefs();
  factory RhRepoRefs.fromJson(Map<String, dynamic> json) =>
      _$RhRepoRefsFromJson(json);
  // TODO String? bookmarks;
  Map<String, String>? branches;
  // TODO branchesClosed
  // TODO tags
}

class RhBranch {
  RhBranch(this.name, this.changeset);
  String? name;
  String? changeset;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhRepoNodesResponse {
  RhRepoNodesResponse();
  factory RhRepoNodesResponse.fromJson(Map<String, dynamic> json) =>
      _$RhRepoNodesResponseFromJson(json);
  String? error;
  int? id;
  List<RhodecodeTreeItem>? result;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RhodecodeTreeItem {
  RhodecodeTreeItem({required this.type, required this.name});
  factory RhodecodeTreeItem.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeTreeItemFromJson(json);
  bool? binary;
  String? extension;
  int? lines;
  String? md5;
  String? mimetype;
  String name;
  int? size;
  String type;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhCommitsResponse {
  RhCommitsResponse();
  factory RhCommitsResponse.fromJson(Map<String, dynamic> json) =>
      _$RhCommitsResponseFromJson(json);
  String? error;
  int? id;
  List<RhodecodeCommit>? result;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RhodecodeCommit {
  RhodecodeCommit(
      {required this.author,
      required this.branch,
      required this.rawId,
      required this.revision,
      required this.shortId});
  factory RhodecodeCommit.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeCommitFromJson(json);
  String author;
  String? branch;
  DateTime? date;
  // diff TODO
  String? message;
  String rawId;
  int revision;
  String shortId;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhChangesetResponse {
  RhChangesetResponse();
  factory RhChangesetResponse.fromJson(Map<String, dynamic> json) =>
      _$RhChangesetResponseFromJson(json);
  String? error;
  int? id;
  RhodecodeChangeset? result;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhodecodeStats {
  RhodecodeStats();
  factory RhodecodeStats.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeStatsFromJson(json);
  int? added;
  bool? binary;
  int? deleted;
  String? newMode;
  String? oldMode;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhodecodeDiff {
  RhodecodeDiff();
  factory RhodecodeDiff.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeDiffFromJson(json);
  String? filename;
  String? newRevision;
  String? oldRevision;
  String? op;
  String? rawDiff;
  RhodecodeStats? stats;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class RhodecodeChangeset {
  RhodecodeChangeset();
  factory RhodecodeChangeset.fromJson(Map<String, dynamic> json) =>
      _$RhodecodeChangesetFromJson(json);
  String? author;
  String? branch;
  DateTime? date;
  List<RhodecodeDiff>? diff;
  String? message;
  // TODO parents
  String? rawId;
  // TODO refs
  int? revision;
  String? shortId;
}

