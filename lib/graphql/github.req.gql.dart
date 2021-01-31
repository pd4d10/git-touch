// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:git_touch/graphql/github.ast.gql.dart' as _i5;
import 'package:git_touch/graphql/github.data.gql.dart' as _i2;
import 'package:git_touch/graphql/github.var.gql.dart' as _i3;
import 'package:git_touch/graphql/serializers.gql.dart' as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'github.req.gql.g.dart';

abstract class GFollowersReq
    implements
        Built<GFollowersReq, GFollowersReqBuilder>,
        _i1.OperationRequest<_i2.GFollowersData, _i3.GFollowersVars> {
  GFollowersReq._();

  factory GFollowersReq([Function(GFollowersReqBuilder b) updates]) =
      _$GFollowersReq;

  static void _initializeBuilder(GFollowersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Followers')
    ..executeOnListen = true;
  _i3.GFollowersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GFollowersData Function(_i2.GFollowersData, _i2.GFollowersData)
      get updateResult;
  @nullable
  _i2.GFollowersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GFollowersData parseData(Map<String, dynamic> json) =>
      _i2.GFollowersData.fromJson(json);
  static Serializer<GFollowersReq> get serializer => _$gFollowersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GFollowersReq.serializer, this);
  static GFollowersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GFollowersReq.serializer, json);
}

abstract class GFollowingReq
    implements
        Built<GFollowingReq, GFollowingReqBuilder>,
        _i1.OperationRequest<_i2.GFollowingData, _i3.GFollowingVars> {
  GFollowingReq._();

  factory GFollowingReq([Function(GFollowingReqBuilder b) updates]) =
      _$GFollowingReq;

  static void _initializeBuilder(GFollowingReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Following')
    ..executeOnListen = true;
  _i3.GFollowingVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GFollowingData Function(_i2.GFollowingData, _i2.GFollowingData)
      get updateResult;
  @nullable
  _i2.GFollowingData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GFollowingData parseData(Map<String, dynamic> json) =>
      _i2.GFollowingData.fromJson(json);
  static Serializer<GFollowingReq> get serializer => _$gFollowingReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GFollowingReq.serializer, this);
  static GFollowingReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GFollowingReq.serializer, json);
}

abstract class GMembersReq
    implements
        Built<GMembersReq, GMembersReqBuilder>,
        _i1.OperationRequest<_i2.GMembersData, _i3.GMembersVars> {
  GMembersReq._();

  factory GMembersReq([Function(GMembersReqBuilder b) updates]) = _$GMembersReq;

  static void _initializeBuilder(GMembersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Members')
    ..executeOnListen = true;
  _i3.GMembersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GMembersData Function(_i2.GMembersData, _i2.GMembersData)
      get updateResult;
  @nullable
  _i2.GMembersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GMembersData parseData(Map<String, dynamic> json) =>
      _i2.GMembersData.fromJson(json);
  static Serializer<GMembersReq> get serializer => _$gMembersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GMembersReq.serializer, this);
  static GMembersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GMembersReq.serializer, json);
}

abstract class GWatchersReq
    implements
        Built<GWatchersReq, GWatchersReqBuilder>,
        _i1.OperationRequest<_i2.GWatchersData, _i3.GWatchersVars> {
  GWatchersReq._();

  factory GWatchersReq([Function(GWatchersReqBuilder b) updates]) =
      _$GWatchersReq;

  static void _initializeBuilder(GWatchersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Watchers')
    ..executeOnListen = true;
  _i3.GWatchersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GWatchersData Function(_i2.GWatchersData, _i2.GWatchersData)
      get updateResult;
  @nullable
  _i2.GWatchersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GWatchersData parseData(Map<String, dynamic> json) =>
      _i2.GWatchersData.fromJson(json);
  static Serializer<GWatchersReq> get serializer => _$gWatchersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GWatchersReq.serializer, this);
  static GWatchersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GWatchersReq.serializer, json);
}

abstract class GStargazersReq
    implements
        Built<GStargazersReq, GStargazersReqBuilder>,
        _i1.OperationRequest<_i2.GStargazersData, _i3.GStargazersVars> {
  GStargazersReq._();

  factory GStargazersReq([Function(GStargazersReqBuilder b) updates]) =
      _$GStargazersReq;

  static void _initializeBuilder(GStargazersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Stargazers')
    ..executeOnListen = true;
  _i3.GStargazersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GStargazersData Function(_i2.GStargazersData, _i2.GStargazersData)
      get updateResult;
  @nullable
  _i2.GStargazersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GStargazersData parseData(Map<String, dynamic> json) =>
      _i2.GStargazersData.fromJson(json);
  static Serializer<GStargazersReq> get serializer =>
      _$gStargazersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GStargazersReq.serializer, this);
  static GStargazersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GStargazersReq.serializer, json);
}

abstract class GReposReq
    implements
        Built<GReposReq, GReposReqBuilder>,
        _i1.OperationRequest<_i2.GReposData, _i3.GReposVars> {
  GReposReq._();

  factory GReposReq([Function(GReposReqBuilder b) updates]) = _$GReposReq;

  static void _initializeBuilder(GReposReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Repos')
    ..executeOnListen = true;
  _i3.GReposVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GReposData Function(_i2.GReposData, _i2.GReposData) get updateResult;
  @nullable
  _i2.GReposData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GReposData parseData(Map<String, dynamic> json) =>
      _i2.GReposData.fromJson(json);
  static Serializer<GReposReq> get serializer => _$gReposReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReposReq.serializer, this);
  static GReposReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReposReq.serializer, json);
}

abstract class GStarsReq
    implements
        Built<GStarsReq, GStarsReqBuilder>,
        _i1.OperationRequest<_i2.GStarsData, _i3.GStarsVars> {
  GStarsReq._();

  factory GStarsReq([Function(GStarsReqBuilder b) updates]) = _$GStarsReq;

  static void _initializeBuilder(GStarsReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Stars')
    ..executeOnListen = true;
  _i3.GStarsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GStarsData Function(_i2.GStarsData, _i2.GStarsData) get updateResult;
  @nullable
  _i2.GStarsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GStarsData parseData(Map<String, dynamic> json) =>
      _i2.GStarsData.fromJson(json);
  static Serializer<GStarsReq> get serializer => _$gStarsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GStarsReq.serializer, this);
  static GStarsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GStarsReq.serializer, json);
}

abstract class GViewerReq
    implements
        Built<GViewerReq, GViewerReqBuilder>,
        _i1.OperationRequest<_i2.GViewerData, _i3.GViewerVars> {
  GViewerReq._();

  factory GViewerReq([Function(GViewerReqBuilder b) updates]) = _$GViewerReq;

  static void _initializeBuilder(GViewerReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Viewer')
    ..executeOnListen = true;
  _i3.GViewerVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GViewerData Function(_i2.GViewerData, _i2.GViewerData) get updateResult;
  @nullable
  _i2.GViewerData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GViewerData parseData(Map<String, dynamic> json) =>
      _i2.GViewerData.fromJson(json);
  static Serializer<GViewerReq> get serializer => _$gViewerReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GViewerReq.serializer, this);
  static GViewerReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GViewerReq.serializer, json);
}

abstract class GUserReq
    implements
        Built<GUserReq, GUserReqBuilder>,
        _i1.OperationRequest<_i2.GUserData, _i3.GUserVars> {
  GUserReq._();

  factory GUserReq([Function(GUserReqBuilder b) updates]) = _$GUserReq;

  static void _initializeBuilder(GUserReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'User')
    ..executeOnListen = true;
  _i3.GUserVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GUserData Function(_i2.GUserData, _i2.GUserData) get updateResult;
  @nullable
  _i2.GUserData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GUserData parseData(Map<String, dynamic> json) =>
      _i2.GUserData.fromJson(json);
  static Serializer<GUserReq> get serializer => _$gUserReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUserReq.serializer, this);
  static GUserReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserReq.serializer, json);
}

abstract class GRepoReq
    implements
        Built<GRepoReq, GRepoReqBuilder>,
        _i1.OperationRequest<_i2.GRepoData, _i3.GRepoVars> {
  GRepoReq._();

  factory GRepoReq([Function(GRepoReqBuilder b) updates]) = _$GRepoReq;

  static void _initializeBuilder(GRepoReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Repo')
    ..executeOnListen = true;
  _i3.GRepoVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GRepoData Function(_i2.GRepoData, _i2.GRepoData) get updateResult;
  @nullable
  _i2.GRepoData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GRepoData parseData(Map<String, dynamic> json) =>
      _i2.GRepoData.fromJson(json);
  static Serializer<GRepoReq> get serializer => _$gRepoReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GRepoReq.serializer, this);
  static GRepoReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRepoReq.serializer, json);
}

abstract class GCommitsReq
    implements
        Built<GCommitsReq, GCommitsReqBuilder>,
        _i1.OperationRequest<_i2.GCommitsData, _i3.GCommitsVars> {
  GCommitsReq._();

  factory GCommitsReq([Function(GCommitsReqBuilder b) updates]) = _$GCommitsReq;

  static void _initializeBuilder(GCommitsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Commits')
    ..executeOnListen = true;
  _i3.GCommitsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GCommitsData Function(_i2.GCommitsData, _i2.GCommitsData)
      get updateResult;
  @nullable
  _i2.GCommitsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GCommitsData parseData(Map<String, dynamic> json) =>
      _i2.GCommitsData.fromJson(json);
  static Serializer<GCommitsReq> get serializer => _$gCommitsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GCommitsReq.serializer, this);
  static GCommitsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCommitsReq.serializer, json);
}

abstract class GIssuesReq
    implements
        Built<GIssuesReq, GIssuesReqBuilder>,
        _i1.OperationRequest<_i2.GIssuesData, _i3.GIssuesVars> {
  GIssuesReq._();

  factory GIssuesReq([Function(GIssuesReqBuilder b) updates]) = _$GIssuesReq;

  static void _initializeBuilder(GIssuesReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Issues')
    ..executeOnListen = true;
  _i3.GIssuesVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GIssuesData Function(_i2.GIssuesData, _i2.GIssuesData) get updateResult;
  @nullable
  _i2.GIssuesData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GIssuesData parseData(Map<String, dynamic> json) =>
      _i2.GIssuesData.fromJson(json);
  static Serializer<GIssuesReq> get serializer => _$gIssuesReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GIssuesReq.serializer, this);
  static GIssuesReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GIssuesReq.serializer, json);
}

abstract class GPullsReq
    implements
        Built<GPullsReq, GPullsReqBuilder>,
        _i1.OperationRequest<_i2.GPullsData, _i3.GPullsVars> {
  GPullsReq._();

  factory GPullsReq([Function(GPullsReqBuilder b) updates]) = _$GPullsReq;

  static void _initializeBuilder(GPullsReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Pulls')
    ..executeOnListen = true;
  _i3.GPullsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GPullsData Function(_i2.GPullsData, _i2.GPullsData) get updateResult;
  @nullable
  _i2.GPullsData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GPullsData parseData(Map<String, dynamic> json) =>
      _i2.GPullsData.fromJson(json);
  static Serializer<GPullsReq> get serializer => _$gPullsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPullsReq.serializer, this);
  static GPullsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPullsReq.serializer, json);
}

abstract class GIssueReq
    implements
        Built<GIssueReq, GIssueReqBuilder>,
        _i1.OperationRequest<_i2.GIssueData, _i3.GIssueVars> {
  GIssueReq._();

  factory GIssueReq([Function(GIssueReqBuilder b) updates]) = _$GIssueReq;

  static void _initializeBuilder(GIssueReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Issue')
    ..executeOnListen = true;
  _i3.GIssueVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GIssueData Function(_i2.GIssueData, _i2.GIssueData) get updateResult;
  @nullable
  _i2.GIssueData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GIssueData parseData(Map<String, dynamic> json) =>
      _i2.GIssueData.fromJson(json);
  static Serializer<GIssueReq> get serializer => _$gIssueReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GIssueReq.serializer, this);
  static GIssueReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GIssueReq.serializer, json);
}

abstract class GPageInfoPartsReq
    implements
        Built<GPageInfoPartsReq, GPageInfoPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPageInfoPartsData, _i3.GPageInfoPartsVars> {
  GPageInfoPartsReq._();

  factory GPageInfoPartsReq([Function(GPageInfoPartsReqBuilder b) updates]) =
      _$GPageInfoPartsReq;

  static void _initializeBuilder(GPageInfoPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PageInfoParts';
  _i3.GPageInfoPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPageInfoPartsData parseData(Map<String, dynamic> json) =>
      _i2.GPageInfoPartsData.fromJson(json);
  static Serializer<GPageInfoPartsReq> get serializer =>
      _$gPageInfoPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPageInfoPartsReq.serializer, this);
  static GPageInfoPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPageInfoPartsReq.serializer, json);
}

abstract class GRepoItemReq
    implements
        Built<GRepoItemReq, GRepoItemReqBuilder>,
        _i1.FragmentRequest<_i2.GRepoItemData, _i3.GRepoItemVars> {
  GRepoItemReq._();

  factory GRepoItemReq([Function(GRepoItemReqBuilder b) updates]) =
      _$GRepoItemReq;

  static void _initializeBuilder(GRepoItemReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RepoItem';
  _i3.GRepoItemVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GRepoItemData parseData(Map<String, dynamic> json) =>
      _i2.GRepoItemData.fromJson(json);
  static Serializer<GRepoItemReq> get serializer => _$gRepoItemReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GRepoItemReq.serializer, this);
  static GRepoItemReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRepoItemReq.serializer, json);
}

abstract class GUserItemReq
    implements
        Built<GUserItemReq, GUserItemReqBuilder>,
        _i1.FragmentRequest<_i2.GUserItemData, _i3.GUserItemVars> {
  GUserItemReq._();

  factory GUserItemReq([Function(GUserItemReqBuilder b) updates]) =
      _$GUserItemReq;

  static void _initializeBuilder(GUserItemReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UserItem';
  _i3.GUserItemVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserItemData parseData(Map<String, dynamic> json) =>
      _i2.GUserItemData.fromJson(json);
  static Serializer<GUserItemReq> get serializer => _$gUserItemReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUserItemReq.serializer, this);
  static GUserItemReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserItemReq.serializer, json);
}

abstract class GReposRepoItemReq
    implements
        Built<GReposRepoItemReq, GReposRepoItemReqBuilder>,
        _i1.FragmentRequest<_i2.GReposRepoItemData, _i3.GReposRepoItemVars> {
  GReposRepoItemReq._();

  factory GReposRepoItemReq([Function(GReposRepoItemReqBuilder b) updates]) =
      _$GReposRepoItemReq;

  static void _initializeBuilder(GReposRepoItemReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReposRepoItem';
  _i3.GReposRepoItemVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReposRepoItemData parseData(Map<String, dynamic> json) =>
      _i2.GReposRepoItemData.fromJson(json);
  static Serializer<GReposRepoItemReq> get serializer =>
      _$gReposRepoItemReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReposRepoItemReq.serializer, this);
  static GReposRepoItemReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReposRepoItemReq.serializer, json);
}

abstract class GUserPartsReq
    implements
        Built<GUserPartsReq, GUserPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUserPartsData, _i3.GUserPartsVars> {
  GUserPartsReq._();

  factory GUserPartsReq([Function(GUserPartsReqBuilder b) updates]) =
      _$GUserPartsReq;

  static void _initializeBuilder(GUserPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UserParts';
  _i3.GUserPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserPartsData parseData(Map<String, dynamic> json) =>
      _i2.GUserPartsData.fromJson(json);
  static Serializer<GUserPartsReq> get serializer => _$gUserPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUserPartsReq.serializer, this);
  static GUserPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserPartsReq.serializer, json);
}

abstract class GRepoCommitReq
    implements
        Built<GRepoCommitReq, GRepoCommitReqBuilder>,
        _i1.FragmentRequest<_i2.GRepoCommitData, _i3.GRepoCommitVars> {
  GRepoCommitReq._();

  factory GRepoCommitReq([Function(GRepoCommitReqBuilder b) updates]) =
      _$GRepoCommitReq;

  static void _initializeBuilder(GRepoCommitReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RepoCommit';
  _i3.GRepoCommitVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GRepoCommitData parseData(Map<String, dynamic> json) =>
      _i2.GRepoCommitData.fromJson(json);
  static Serializer<GRepoCommitReq> get serializer =>
      _$gRepoCommitReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GRepoCommitReq.serializer, this);
  static GRepoCommitReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRepoCommitReq.serializer, json);
}

abstract class GRepoRefReq
    implements
        Built<GRepoRefReq, GRepoRefReqBuilder>,
        _i1.FragmentRequest<_i2.GRepoRefData, _i3.GRepoRefVars> {
  GRepoRefReq._();

  factory GRepoRefReq([Function(GRepoRefReqBuilder b) updates]) = _$GRepoRefReq;

  static void _initializeBuilder(GRepoRefReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RepoRef';
  _i3.GRepoRefVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GRepoRefData parseData(Map<String, dynamic> json) =>
      _i2.GRepoRefData.fromJson(json);
  static Serializer<GRepoRefReq> get serializer => _$gRepoRefReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GRepoRefReq.serializer, this);
  static GRepoRefReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GRepoRefReq.serializer, json);
}

abstract class GCommitsRefCommitReq
    implements
        Built<GCommitsRefCommitReq, GCommitsRefCommitReqBuilder>,
        _i1.FragmentRequest<_i2.GCommitsRefCommitData,
            _i3.GCommitsRefCommitVars> {
  GCommitsRefCommitReq._();

  factory GCommitsRefCommitReq(
          [Function(GCommitsRefCommitReqBuilder b) updates]) =
      _$GCommitsRefCommitReq;

  static void _initializeBuilder(GCommitsRefCommitReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CommitsRefCommit';
  _i3.GCommitsRefCommitVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommitsRefCommitData parseData(Map<String, dynamic> json) =>
      _i2.GCommitsRefCommitData.fromJson(json);
  static Serializer<GCommitsRefCommitReq> get serializer =>
      _$gCommitsRefCommitReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GCommitsRefCommitReq.serializer, this);
  static GCommitsRefCommitReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCommitsRefCommitReq.serializer, json);
}

abstract class GCommitsRefReq
    implements
        Built<GCommitsRefReq, GCommitsRefReqBuilder>,
        _i1.FragmentRequest<_i2.GCommitsRefData, _i3.GCommitsRefVars> {
  GCommitsRefReq._();

  factory GCommitsRefReq([Function(GCommitsRefReqBuilder b) updates]) =
      _$GCommitsRefReq;

  static void _initializeBuilder(GCommitsRefReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CommitsRef';
  _i3.GCommitsRefVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommitsRefData parseData(Map<String, dynamic> json) =>
      _i2.GCommitsRefData.fromJson(json);
  static Serializer<GCommitsRefReq> get serializer =>
      _$gCommitsRefReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GCommitsRefReq.serializer, this);
  static GCommitsRefReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCommitsRefReq.serializer, json);
}

abstract class GCommentPartsReq
    implements
        Built<GCommentPartsReq, GCommentPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GCommentPartsData, _i3.GCommentPartsVars> {
  GCommentPartsReq._();

  factory GCommentPartsReq([Function(GCommentPartsReqBuilder b) updates]) =
      _$GCommentPartsReq;

  static void _initializeBuilder(GCommentPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CommentParts';
  _i3.GCommentPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommentPartsData parseData(Map<String, dynamic> json) =>
      _i2.GCommentPartsData.fromJson(json);
  static Serializer<GCommentPartsReq> get serializer =>
      _$gCommentPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GCommentPartsReq.serializer, this);
  static GCommentPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCommentPartsReq.serializer, json);
}

abstract class GReactionConnectionPartsReq
    implements
        Built<GReactionConnectionPartsReq, GReactionConnectionPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReactionConnectionPartsData,
            _i3.GReactionConnectionPartsVars> {
  GReactionConnectionPartsReq._();

  factory GReactionConnectionPartsReq(
          [Function(GReactionConnectionPartsReqBuilder b) updates]) =
      _$GReactionConnectionPartsReq;

  static void _initializeBuilder(GReactionConnectionPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReactionConnectionParts';
  _i3.GReactionConnectionPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReactionConnectionPartsData parseData(Map<String, dynamic> json) =>
      _i2.GReactionConnectionPartsData.fromJson(json);
  static Serializer<GReactionConnectionPartsReq> get serializer =>
      _$gReactionConnectionPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GReactionConnectionPartsReq.serializer, this);
  static GReactionConnectionPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GReactionConnectionPartsReq.serializer, json);
}

abstract class GReactablePartsReq
    implements
        Built<GReactablePartsReq, GReactablePartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReactablePartsData, _i3.GReactablePartsVars> {
  GReactablePartsReq._();

  factory GReactablePartsReq([Function(GReactablePartsReqBuilder b) updates]) =
      _$GReactablePartsReq;

  static void _initializeBuilder(GReactablePartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReactableParts';
  _i3.GReactablePartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReactablePartsData parseData(Map<String, dynamic> json) =>
      _i2.GReactablePartsData.fromJson(json);
  static Serializer<GReactablePartsReq> get serializer =>
      _$gReactablePartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReactablePartsReq.serializer, this);
  static GReactablePartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReactablePartsReq.serializer, json);
}

abstract class GReferencedEventPartsReq
    implements
        Built<GReferencedEventPartsReq, GReferencedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReferencedEventPartsData,
            _i3.GReferencedEventPartsVars> {
  GReferencedEventPartsReq._();

  factory GReferencedEventPartsReq(
          [Function(GReferencedEventPartsReqBuilder b) updates]) =
      _$GReferencedEventPartsReq;

  static void _initializeBuilder(GReferencedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReferencedEventParts';
  _i3.GReferencedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReferencedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GReferencedEventPartsData.fromJson(json);
  static Serializer<GReferencedEventPartsReq> get serializer =>
      _$gReferencedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReferencedEventPartsReq.serializer, this);
  static GReferencedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GReferencedEventPartsReq.serializer, json);
}

abstract class GRenamedTitleEventPartsReq
    implements
        Built<GRenamedTitleEventPartsReq, GRenamedTitleEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GRenamedTitleEventPartsData,
            _i3.GRenamedTitleEventPartsVars> {
  GRenamedTitleEventPartsReq._();

  factory GRenamedTitleEventPartsReq(
          [Function(GRenamedTitleEventPartsReqBuilder b) updates]) =
      _$GRenamedTitleEventPartsReq;

  static void _initializeBuilder(GRenamedTitleEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RenamedTitleEventParts';
  _i3.GRenamedTitleEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GRenamedTitleEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GRenamedTitleEventPartsData.fromJson(json);
  static Serializer<GRenamedTitleEventPartsReq> get serializer =>
      _$gRenamedTitleEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GRenamedTitleEventPartsReq.serializer, this);
  static GRenamedTitleEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GRenamedTitleEventPartsReq.serializer, json);
}

abstract class GClosedEventPartsReq
    implements
        Built<GClosedEventPartsReq, GClosedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GClosedEventPartsData,
            _i3.GClosedEventPartsVars> {
  GClosedEventPartsReq._();

  factory GClosedEventPartsReq(
          [Function(GClosedEventPartsReqBuilder b) updates]) =
      _$GClosedEventPartsReq;

  static void _initializeBuilder(GClosedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ClosedEventParts';
  _i3.GClosedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GClosedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GClosedEventPartsData.fromJson(json);
  static Serializer<GClosedEventPartsReq> get serializer =>
      _$gClosedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GClosedEventPartsReq.serializer, this);
  static GClosedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GClosedEventPartsReq.serializer, json);
}

abstract class GReopenedEventPartsReq
    implements
        Built<GReopenedEventPartsReq, GReopenedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReopenedEventPartsData,
            _i3.GReopenedEventPartsVars> {
  GReopenedEventPartsReq._();

  factory GReopenedEventPartsReq(
          [Function(GReopenedEventPartsReqBuilder b) updates]) =
      _$GReopenedEventPartsReq;

  static void _initializeBuilder(GReopenedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReopenedEventParts';
  _i3.GReopenedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReopenedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GReopenedEventPartsData.fromJson(json);
  static Serializer<GReopenedEventPartsReq> get serializer =>
      _$gReopenedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GReopenedEventPartsReq.serializer, this);
  static GReopenedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReopenedEventPartsReq.serializer, json);
}

abstract class GCrossReferencedEventPartsReq
    implements
        Built<GCrossReferencedEventPartsReq,
            GCrossReferencedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GCrossReferencedEventPartsData,
            _i3.GCrossReferencedEventPartsVars> {
  GCrossReferencedEventPartsReq._();

  factory GCrossReferencedEventPartsReq(
          [Function(GCrossReferencedEventPartsReqBuilder b) updates]) =
      _$GCrossReferencedEventPartsReq;

  static void _initializeBuilder(GCrossReferencedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CrossReferencedEventParts';
  _i3.GCrossReferencedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GCrossReferencedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GCrossReferencedEventPartsData.fromJson(json);
  static Serializer<GCrossReferencedEventPartsReq> get serializer =>
      _$gCrossReferencedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GCrossReferencedEventPartsReq.serializer, this);
  static GCrossReferencedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GCrossReferencedEventPartsReq.serializer, json);
}

abstract class GLabeledEventPartsReq
    implements
        Built<GLabeledEventPartsReq, GLabeledEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GLabeledEventPartsData,
            _i3.GLabeledEventPartsVars> {
  GLabeledEventPartsReq._();

  factory GLabeledEventPartsReq(
          [Function(GLabeledEventPartsReqBuilder b) updates]) =
      _$GLabeledEventPartsReq;

  static void _initializeBuilder(GLabeledEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'LabeledEventParts';
  _i3.GLabeledEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GLabeledEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GLabeledEventPartsData.fromJson(json);
  static Serializer<GLabeledEventPartsReq> get serializer =>
      _$gLabeledEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GLabeledEventPartsReq.serializer, this);
  static GLabeledEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLabeledEventPartsReq.serializer, json);
}

abstract class GUnlabeledEventPartsReq
    implements
        Built<GUnlabeledEventPartsReq, GUnlabeledEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnlabeledEventPartsData,
            _i3.GUnlabeledEventPartsVars> {
  GUnlabeledEventPartsReq._();

  factory GUnlabeledEventPartsReq(
          [Function(GUnlabeledEventPartsReqBuilder b) updates]) =
      _$GUnlabeledEventPartsReq;

  static void _initializeBuilder(GUnlabeledEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnlabeledEventParts';
  _i3.GUnlabeledEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnlabeledEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GUnlabeledEventPartsData.fromJson(json);
  static Serializer<GUnlabeledEventPartsReq> get serializer =>
      _$gUnlabeledEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUnlabeledEventPartsReq.serializer, this);
  static GUnlabeledEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUnlabeledEventPartsReq.serializer, json);
}

abstract class GMilestonedEventPartsReq
    implements
        Built<GMilestonedEventPartsReq, GMilestonedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMilestonedEventPartsData,
            _i3.GMilestonedEventPartsVars> {
  GMilestonedEventPartsReq._();

  factory GMilestonedEventPartsReq(
          [Function(GMilestonedEventPartsReqBuilder b) updates]) =
      _$GMilestonedEventPartsReq;

  static void _initializeBuilder(GMilestonedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MilestonedEventParts';
  _i3.GMilestonedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GMilestonedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GMilestonedEventPartsData.fromJson(json);
  static Serializer<GMilestonedEventPartsReq> get serializer =>
      _$gMilestonedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GMilestonedEventPartsReq.serializer, this);
  static GMilestonedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GMilestonedEventPartsReq.serializer, json);
}

abstract class GDemilestonedEventPartsReq
    implements
        Built<GDemilestonedEventPartsReq, GDemilestonedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDemilestonedEventPartsData,
            _i3.GDemilestonedEventPartsVars> {
  GDemilestonedEventPartsReq._();

  factory GDemilestonedEventPartsReq(
          [Function(GDemilestonedEventPartsReqBuilder b) updates]) =
      _$GDemilestonedEventPartsReq;

  static void _initializeBuilder(GDemilestonedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DemilestonedEventParts';
  _i3.GDemilestonedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GDemilestonedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GDemilestonedEventPartsData.fromJson(json);
  static Serializer<GDemilestonedEventPartsReq> get serializer =>
      _$gDemilestonedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GDemilestonedEventPartsReq.serializer, this);
  static GDemilestonedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GDemilestonedEventPartsReq.serializer, json);
}

abstract class GLockedEventPartsReq
    implements
        Built<GLockedEventPartsReq, GLockedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GLockedEventPartsData,
            _i3.GLockedEventPartsVars> {
  GLockedEventPartsReq._();

  factory GLockedEventPartsReq(
          [Function(GLockedEventPartsReqBuilder b) updates]) =
      _$GLockedEventPartsReq;

  static void _initializeBuilder(GLockedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'LockedEventParts';
  _i3.GLockedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GLockedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GLockedEventPartsData.fromJson(json);
  static Serializer<GLockedEventPartsReq> get serializer =>
      _$gLockedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GLockedEventPartsReq.serializer, this);
  static GLockedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLockedEventPartsReq.serializer, json);
}

abstract class GUnlockedEventPartsReq
    implements
        Built<GUnlockedEventPartsReq, GUnlockedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnlockedEventPartsData,
            _i3.GUnlockedEventPartsVars> {
  GUnlockedEventPartsReq._();

  factory GUnlockedEventPartsReq(
          [Function(GUnlockedEventPartsReqBuilder b) updates]) =
      _$GUnlockedEventPartsReq;

  static void _initializeBuilder(GUnlockedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnlockedEventParts';
  _i3.GUnlockedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnlockedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GUnlockedEventPartsData.fromJson(json);
  static Serializer<GUnlockedEventPartsReq> get serializer =>
      _$gUnlockedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUnlockedEventPartsReq.serializer, this);
  static GUnlockedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUnlockedEventPartsReq.serializer, json);
}

abstract class GAssignedEventPartsReq
    implements
        Built<GAssignedEventPartsReq, GAssignedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GAssignedEventPartsData,
            _i3.GAssignedEventPartsVars> {
  GAssignedEventPartsReq._();

  factory GAssignedEventPartsReq(
          [Function(GAssignedEventPartsReqBuilder b) updates]) =
      _$GAssignedEventPartsReq;

  static void _initializeBuilder(GAssignedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'AssignedEventParts';
  _i3.GAssignedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GAssignedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GAssignedEventPartsData.fromJson(json);
  static Serializer<GAssignedEventPartsReq> get serializer =>
      _$gAssignedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GAssignedEventPartsReq.serializer, this);
  static GAssignedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAssignedEventPartsReq.serializer, json);
}

abstract class GUnassignedEventPartsReq
    implements
        Built<GUnassignedEventPartsReq, GUnassignedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnassignedEventPartsData,
            _i3.GUnassignedEventPartsVars> {
  GUnassignedEventPartsReq._();

  factory GUnassignedEventPartsReq(
          [Function(GUnassignedEventPartsReqBuilder b) updates]) =
      _$GUnassignedEventPartsReq;

  static void _initializeBuilder(GUnassignedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnassignedEventParts';
  _i3.GUnassignedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnassignedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GUnassignedEventPartsData.fromJson(json);
  static Serializer<GUnassignedEventPartsReq> get serializer =>
      _$gUnassignedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUnassignedEventPartsReq.serializer, this);
  static GUnassignedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GUnassignedEventPartsReq.serializer, json);
}

abstract class GSubscribedEventPartsReq
    implements
        Built<GSubscribedEventPartsReq, GSubscribedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GSubscribedEventPartsData,
            _i3.GSubscribedEventPartsVars> {
  GSubscribedEventPartsReq._();

  factory GSubscribedEventPartsReq(
          [Function(GSubscribedEventPartsReqBuilder b) updates]) =
      _$GSubscribedEventPartsReq;

  static void _initializeBuilder(GSubscribedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'SubscribedEventParts';
  _i3.GSubscribedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GSubscribedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GSubscribedEventPartsData.fromJson(json);
  static Serializer<GSubscribedEventPartsReq> get serializer =>
      _$gSubscribedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GSubscribedEventPartsReq.serializer, this);
  static GSubscribedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GSubscribedEventPartsReq.serializer, json);
}

abstract class GUnsubscribedEventPartsReq
    implements
        Built<GUnsubscribedEventPartsReq, GUnsubscribedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnsubscribedEventPartsData,
            _i3.GUnsubscribedEventPartsVars> {
  GUnsubscribedEventPartsReq._();

  factory GUnsubscribedEventPartsReq(
          [Function(GUnsubscribedEventPartsReqBuilder b) updates]) =
      _$GUnsubscribedEventPartsReq;

  static void _initializeBuilder(GUnsubscribedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnsubscribedEventParts';
  _i3.GUnsubscribedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnsubscribedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GUnsubscribedEventPartsData.fromJson(json);
  static Serializer<GUnsubscribedEventPartsReq> get serializer =>
      _$gUnsubscribedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GUnsubscribedEventPartsReq.serializer, this);
  static GUnsubscribedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GUnsubscribedEventPartsReq.serializer, json);
}

abstract class GMentionedEventPartsReq
    implements
        Built<GMentionedEventPartsReq, GMentionedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMentionedEventPartsData,
            _i3.GMentionedEventPartsVars> {
  GMentionedEventPartsReq._();

  factory GMentionedEventPartsReq(
          [Function(GMentionedEventPartsReqBuilder b) updates]) =
      _$GMentionedEventPartsReq;

  static void _initializeBuilder(GMentionedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MentionedEventParts';
  _i3.GMentionedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GMentionedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GMentionedEventPartsData.fromJson(json);
  static Serializer<GMentionedEventPartsReq> get serializer =>
      _$gMentionedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GMentionedEventPartsReq.serializer, this);
  static GMentionedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GMentionedEventPartsReq.serializer, json);
}

abstract class GPinnedEventPartsReq
    implements
        Built<GPinnedEventPartsReq, GPinnedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPinnedEventPartsData,
            _i3.GPinnedEventPartsVars> {
  GPinnedEventPartsReq._();

  factory GPinnedEventPartsReq(
          [Function(GPinnedEventPartsReqBuilder b) updates]) =
      _$GPinnedEventPartsReq;

  static void _initializeBuilder(GPinnedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PinnedEventParts';
  _i3.GPinnedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPinnedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GPinnedEventPartsData.fromJson(json);
  static Serializer<GPinnedEventPartsReq> get serializer =>
      _$gPinnedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPinnedEventPartsReq.serializer, this);
  static GPinnedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPinnedEventPartsReq.serializer, json);
}

abstract class GTransferredEventPartsReq
    implements
        Built<GTransferredEventPartsReq, GTransferredEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GTransferredEventPartsData,
            _i3.GTransferredEventPartsVars> {
  GTransferredEventPartsReq._();

  factory GTransferredEventPartsReq(
          [Function(GTransferredEventPartsReqBuilder b) updates]) =
      _$GTransferredEventPartsReq;

  static void _initializeBuilder(GTransferredEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'TransferredEventParts';
  _i3.GTransferredEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GTransferredEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GTransferredEventPartsData.fromJson(json);
  static Serializer<GTransferredEventPartsReq> get serializer =>
      _$gTransferredEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GTransferredEventPartsReq.serializer, this);
  static GTransferredEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GTransferredEventPartsReq.serializer, json);
}

abstract class GPullRequestCommitPartsReq
    implements
        Built<GPullRequestCommitPartsReq, GPullRequestCommitPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPullRequestCommitPartsData,
            _i3.GPullRequestCommitPartsVars> {
  GPullRequestCommitPartsReq._();

  factory GPullRequestCommitPartsReq(
          [Function(GPullRequestCommitPartsReqBuilder b) updates]) =
      _$GPullRequestCommitPartsReq;

  static void _initializeBuilder(GPullRequestCommitPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PullRequestCommitParts';
  _i3.GPullRequestCommitPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPullRequestCommitPartsData parseData(Map<String, dynamic> json) =>
      _i2.GPullRequestCommitPartsData.fromJson(json);
  static Serializer<GPullRequestCommitPartsReq> get serializer =>
      _$gPullRequestCommitPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GPullRequestCommitPartsReq.serializer, this);
  static GPullRequestCommitPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GPullRequestCommitPartsReq.serializer, json);
}

abstract class GDeployedEventPartsReq
    implements
        Built<GDeployedEventPartsReq, GDeployedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDeployedEventPartsData,
            _i3.GDeployedEventPartsVars> {
  GDeployedEventPartsReq._();

  factory GDeployedEventPartsReq(
          [Function(GDeployedEventPartsReqBuilder b) updates]) =
      _$GDeployedEventPartsReq;

  static void _initializeBuilder(GDeployedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DeployedEventParts';
  _i3.GDeployedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GDeployedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GDeployedEventPartsData.fromJson(json);
  static Serializer<GDeployedEventPartsReq> get serializer =>
      _$gDeployedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GDeployedEventPartsReq.serializer, this);
  static GDeployedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GDeployedEventPartsReq.serializer, json);
}

abstract class GDeploymentEnvironmentChangedEventPartsReq
    implements
        Built<GDeploymentEnvironmentChangedEventPartsReq,
            GDeploymentEnvironmentChangedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDeploymentEnvironmentChangedEventPartsData,
            _i3.GDeploymentEnvironmentChangedEventPartsVars> {
  GDeploymentEnvironmentChangedEventPartsReq._();

  factory GDeploymentEnvironmentChangedEventPartsReq(
      [Function(GDeploymentEnvironmentChangedEventPartsReqBuilder b)
          updates]) = _$GDeploymentEnvironmentChangedEventPartsReq;

  static void _initializeBuilder(
          GDeploymentEnvironmentChangedEventPartsReqBuilder b) =>
      b
        ..document = _i5.document
        ..fragmentName = 'DeploymentEnvironmentChangedEventParts';
  _i3.GDeploymentEnvironmentChangedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GDeploymentEnvironmentChangedEventPartsData parseData(
          Map<String, dynamic> json) =>
      _i2.GDeploymentEnvironmentChangedEventPartsData.fromJson(json);
  static Serializer<GDeploymentEnvironmentChangedEventPartsReq>
      get serializer => _$gDeploymentEnvironmentChangedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers.serializeWith(
      GDeploymentEnvironmentChangedEventPartsReq.serializer, this);
  static GDeploymentEnvironmentChangedEventPartsReq fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
          GDeploymentEnvironmentChangedEventPartsReq.serializer, json);
}

abstract class GHeadRefRestoredEventPartsReq
    implements
        Built<GHeadRefRestoredEventPartsReq,
            GHeadRefRestoredEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefRestoredEventPartsData,
            _i3.GHeadRefRestoredEventPartsVars> {
  GHeadRefRestoredEventPartsReq._();

  factory GHeadRefRestoredEventPartsReq(
          [Function(GHeadRefRestoredEventPartsReqBuilder b) updates]) =
      _$GHeadRefRestoredEventPartsReq;

  static void _initializeBuilder(GHeadRefRestoredEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefRestoredEventParts';
  _i3.GHeadRefRestoredEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefRestoredEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefRestoredEventPartsData.fromJson(json);
  static Serializer<GHeadRefRestoredEventPartsReq> get serializer =>
      _$gHeadRefRestoredEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GHeadRefRestoredEventPartsReq.serializer, this);
  static GHeadRefRestoredEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GHeadRefRestoredEventPartsReq.serializer, json);
}

abstract class GBaseRefForcePushedEventPartsReq
    implements
        Built<GBaseRefForcePushedEventPartsReq,
            GBaseRefForcePushedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GBaseRefForcePushedEventPartsData,
            _i3.GBaseRefForcePushedEventPartsVars> {
  GBaseRefForcePushedEventPartsReq._();

  factory GBaseRefForcePushedEventPartsReq(
          [Function(GBaseRefForcePushedEventPartsReqBuilder b) updates]) =
      _$GBaseRefForcePushedEventPartsReq;

  static void _initializeBuilder(GBaseRefForcePushedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'BaseRefForcePushedEventParts';
  _i3.GBaseRefForcePushedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GBaseRefForcePushedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GBaseRefForcePushedEventPartsData.fromJson(json);
  static Serializer<GBaseRefForcePushedEventPartsReq> get serializer =>
      _$gBaseRefForcePushedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GBaseRefForcePushedEventPartsReq.serializer, this);
  static GBaseRefForcePushedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GBaseRefForcePushedEventPartsReq.serializer, json);
}

abstract class GHeadRefForcePushedEventPartsReq
    implements
        Built<GHeadRefForcePushedEventPartsReq,
            GHeadRefForcePushedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefForcePushedEventPartsData,
            _i3.GHeadRefForcePushedEventPartsVars> {
  GHeadRefForcePushedEventPartsReq._();

  factory GHeadRefForcePushedEventPartsReq(
          [Function(GHeadRefForcePushedEventPartsReqBuilder b) updates]) =
      _$GHeadRefForcePushedEventPartsReq;

  static void _initializeBuilder(GHeadRefForcePushedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefForcePushedEventParts';
  _i3.GHeadRefForcePushedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefForcePushedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefForcePushedEventPartsData.fromJson(json);
  static Serializer<GHeadRefForcePushedEventPartsReq> get serializer =>
      _$gHeadRefForcePushedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GHeadRefForcePushedEventPartsReq.serializer, this);
  static GHeadRefForcePushedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GHeadRefForcePushedEventPartsReq.serializer, json);
}

abstract class GReviewRequestedEventPartsReq
    implements
        Built<GReviewRequestedEventPartsReq,
            GReviewRequestedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewRequestedEventPartsData,
            _i3.GReviewRequestedEventPartsVars> {
  GReviewRequestedEventPartsReq._();

  factory GReviewRequestedEventPartsReq(
          [Function(GReviewRequestedEventPartsReqBuilder b) updates]) =
      _$GReviewRequestedEventPartsReq;

  static void _initializeBuilder(GReviewRequestedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReviewRequestedEventParts';
  _i3.GReviewRequestedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewRequestedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GReviewRequestedEventPartsData.fromJson(json);
  static Serializer<GReviewRequestedEventPartsReq> get serializer =>
      _$gReviewRequestedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GReviewRequestedEventPartsReq.serializer, this);
  static GReviewRequestedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GReviewRequestedEventPartsReq.serializer, json);
}

abstract class GReviewRequestRemovedEventPartsReq
    implements
        Built<GReviewRequestRemovedEventPartsReq,
            GReviewRequestRemovedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewRequestRemovedEventPartsData,
            _i3.GReviewRequestRemovedEventPartsVars> {
  GReviewRequestRemovedEventPartsReq._();

  factory GReviewRequestRemovedEventPartsReq(
          [Function(GReviewRequestRemovedEventPartsReqBuilder b) updates]) =
      _$GReviewRequestRemovedEventPartsReq;

  static void _initializeBuilder(GReviewRequestRemovedEventPartsReqBuilder b) =>
      b
        ..document = _i5.document
        ..fragmentName = 'ReviewRequestRemovedEventParts';
  _i3.GReviewRequestRemovedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewRequestRemovedEventPartsData parseData(
          Map<String, dynamic> json) =>
      _i2.GReviewRequestRemovedEventPartsData.fromJson(json);
  static Serializer<GReviewRequestRemovedEventPartsReq> get serializer =>
      _$gReviewRequestRemovedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GReviewRequestRemovedEventPartsReq.serializer, this);
  static GReviewRequestRemovedEventPartsReq fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GReviewRequestRemovedEventPartsReq.serializer, json);
}

abstract class GReviewDismissedEventPartsReq
    implements
        Built<GReviewDismissedEventPartsReq,
            GReviewDismissedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewDismissedEventPartsData,
            _i3.GReviewDismissedEventPartsVars> {
  GReviewDismissedEventPartsReq._();

  factory GReviewDismissedEventPartsReq(
          [Function(GReviewDismissedEventPartsReqBuilder b) updates]) =
      _$GReviewDismissedEventPartsReq;

  static void _initializeBuilder(GReviewDismissedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReviewDismissedEventParts';
  _i3.GReviewDismissedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewDismissedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GReviewDismissedEventPartsData.fromJson(json);
  static Serializer<GReviewDismissedEventPartsReq> get serializer =>
      _$gReviewDismissedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GReviewDismissedEventPartsReq.serializer, this);
  static GReviewDismissedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GReviewDismissedEventPartsReq.serializer, json);
}

abstract class GPullRequestReviewPartsReq
    implements
        Built<GPullRequestReviewPartsReq, GPullRequestReviewPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPullRequestReviewPartsData,
            _i3.GPullRequestReviewPartsVars> {
  GPullRequestReviewPartsReq._();

  factory GPullRequestReviewPartsReq(
          [Function(GPullRequestReviewPartsReqBuilder b) updates]) =
      _$GPullRequestReviewPartsReq;

  static void _initializeBuilder(GPullRequestReviewPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PullRequestReviewParts';
  _i3.GPullRequestReviewPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPullRequestReviewPartsData parseData(Map<String, dynamic> json) =>
      _i2.GPullRequestReviewPartsData.fromJson(json);
  static Serializer<GPullRequestReviewPartsReq> get serializer =>
      _$gPullRequestReviewPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GPullRequestReviewPartsReq.serializer, this);
  static GPullRequestReviewPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GPullRequestReviewPartsReq.serializer, json);
}

abstract class GMergedEventPartsReq
    implements
        Built<GMergedEventPartsReq, GMergedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMergedEventPartsData,
            _i3.GMergedEventPartsVars> {
  GMergedEventPartsReq._();

  factory GMergedEventPartsReq(
          [Function(GMergedEventPartsReqBuilder b) updates]) =
      _$GMergedEventPartsReq;

  static void _initializeBuilder(GMergedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MergedEventParts';
  _i3.GMergedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GMergedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GMergedEventPartsData.fromJson(json);
  static Serializer<GMergedEventPartsReq> get serializer =>
      _$gMergedEventPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GMergedEventPartsReq.serializer, this);
  static GMergedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GMergedEventPartsReq.serializer, json);
}

abstract class GHeadRefDeletedEventPartsReq
    implements
        Built<GHeadRefDeletedEventPartsReq,
            GHeadRefDeletedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefDeletedEventPartsData,
            _i3.GHeadRefDeletedEventPartsVars> {
  GHeadRefDeletedEventPartsReq._();

  factory GHeadRefDeletedEventPartsReq(
          [Function(GHeadRefDeletedEventPartsReqBuilder b) updates]) =
      _$GHeadRefDeletedEventPartsReq;

  static void _initializeBuilder(GHeadRefDeletedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefDeletedEventParts';
  _i3.GHeadRefDeletedEventPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefDeletedEventPartsData parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefDeletedEventPartsData.fromJson(json);
  static Serializer<GHeadRefDeletedEventPartsReq> get serializer =>
      _$gHeadRefDeletedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => _i6.serializers
      .serializeWith(GHeadRefDeletedEventPartsReq.serializer, this);
  static GHeadRefDeletedEventPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GHeadRefDeletedEventPartsReq.serializer, json);
}
