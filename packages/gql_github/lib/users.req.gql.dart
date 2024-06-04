// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/serializers.gql.dart' as _i6;
import 'package:gql_github/users.ast.gql.dart' as _i5;
import 'package:gql_github/users.data.gql.dart' as _i2;
import 'package:gql_github/users.var.gql.dart' as _i3;

part 'users.req.gql.g.dart';

abstract class GFollowersReq
    implements
        Built<GFollowersReq, GFollowersReqBuilder>,
        _i1.OperationRequest<_i2.GFollowersData, _i3.GFollowersVars> {
  GFollowersReq._();

  factory GFollowersReq([Function(GFollowersReqBuilder b) updates]) =
      _$GFollowersReq;

  static void _initializeBuilder(GFollowersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Followers',
    )
    ..executeOnListen = true;
  @override
  _i3.GFollowersVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GFollowersData? Function(
    _i2.GFollowersData?,
    _i2.GFollowersData?,
  )? get updateResult;
  @override
  _i2.GFollowersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFollowersData? parseData(Map<String, dynamic> json) =>
      _i2.GFollowersData.fromJson(json);
  static Serializer<GFollowersReq> get serializer => _$gFollowersReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFollowersReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFollowersReq.serializer,
        json,
      );
}

abstract class GFollowingReq
    implements
        Built<GFollowingReq, GFollowingReqBuilder>,
        _i1.OperationRequest<_i2.GFollowingData, _i3.GFollowingVars> {
  GFollowingReq._();

  factory GFollowingReq([Function(GFollowingReqBuilder b) updates]) =
      _$GFollowingReq;

  static void _initializeBuilder(GFollowingReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Following',
    )
    ..executeOnListen = true;
  @override
  _i3.GFollowingVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GFollowingData? Function(
    _i2.GFollowingData?,
    _i2.GFollowingData?,
  )? get updateResult;
  @override
  _i2.GFollowingData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFollowingData? parseData(Map<String, dynamic> json) =>
      _i2.GFollowingData.fromJson(json);
  static Serializer<GFollowingReq> get serializer => _$gFollowingReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFollowingReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowingReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFollowingReq.serializer,
        json,
      );
}

abstract class GOrgsReq
    implements
        Built<GOrgsReq, GOrgsReqBuilder>,
        _i1.OperationRequest<_i2.GOrgsData, _i3.GOrgsVars> {
  GOrgsReq._();

  factory GOrgsReq([Function(GOrgsReqBuilder b) updates]) = _$GOrgsReq;

  static void _initializeBuilder(GOrgsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Orgs',
    )
    ..executeOnListen = true;
  @override
  _i3.GOrgsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GOrgsData? Function(
    _i2.GOrgsData?,
    _i2.GOrgsData?,
  )? get updateResult;
  @override
  _i2.GOrgsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GOrgsData? parseData(Map<String, dynamic> json) =>
      _i2.GOrgsData.fromJson(json);
  static Serializer<GOrgsReq> get serializer => _$gOrgsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GOrgsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOrgsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GOrgsReq.serializer,
        json,
      );
}

abstract class GMembersReq
    implements
        Built<GMembersReq, GMembersReqBuilder>,
        _i1.OperationRequest<_i2.GMembersData, _i3.GMembersVars> {
  GMembersReq._();

  factory GMembersReq([Function(GMembersReqBuilder b) updates]) = _$GMembersReq;

  static void _initializeBuilder(GMembersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Members',
    )
    ..executeOnListen = true;
  @override
  _i3.GMembersVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GMembersData? Function(
    _i2.GMembersData?,
    _i2.GMembersData?,
  )? get updateResult;
  @override
  _i2.GMembersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMembersData? parseData(Map<String, dynamic> json) =>
      _i2.GMembersData.fromJson(json);
  static Serializer<GMembersReq> get serializer => _$gMembersReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMembersReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMembersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMembersReq.serializer,
        json,
      );
}

abstract class GWatchersReq
    implements
        Built<GWatchersReq, GWatchersReqBuilder>,
        _i1.OperationRequest<_i2.GWatchersData, _i3.GWatchersVars> {
  GWatchersReq._();

  factory GWatchersReq([Function(GWatchersReqBuilder b) updates]) =
      _$GWatchersReq;

  static void _initializeBuilder(GWatchersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Watchers',
    )
    ..executeOnListen = true;
  @override
  _i3.GWatchersVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GWatchersData? Function(
    _i2.GWatchersData?,
    _i2.GWatchersData?,
  )? get updateResult;
  @override
  _i2.GWatchersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GWatchersData? parseData(Map<String, dynamic> json) =>
      _i2.GWatchersData.fromJson(json);
  static Serializer<GWatchersReq> get serializer => _$gWatchersReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWatchersReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWatchersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWatchersReq.serializer,
        json,
      );
}

abstract class GStargazersReq
    implements
        Built<GStargazersReq, GStargazersReqBuilder>,
        _i1.OperationRequest<_i2.GStargazersData, _i3.GStargazersVars> {
  GStargazersReq._();

  factory GStargazersReq([Function(GStargazersReqBuilder b) updates]) =
      _$GStargazersReq;

  static void _initializeBuilder(GStargazersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Stargazers',
    )
    ..executeOnListen = true;
  @override
  _i3.GStargazersVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GStargazersData? Function(
    _i2.GStargazersData?,
    _i2.GStargazersData?,
  )? get updateResult;
  @override
  _i2.GStargazersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GStargazersData? parseData(Map<String, dynamic> json) =>
      _i2.GStargazersData.fromJson(json);
  static Serializer<GStargazersReq> get serializer =>
      _$gStargazersReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GStargazersReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStargazersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GStargazersReq.serializer,
        json,
      );
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
  @override
  _i3.GUserPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GUserPartsData.fromJson(json);
  static Serializer<GUserPartsReq> get serializer => _$gUserPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserPartsReq.serializer,
        json,
      );
}

abstract class GOrgPartsReq
    implements
        Built<GOrgPartsReq, GOrgPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GOrgPartsData, _i3.GOrgPartsVars> {
  GOrgPartsReq._();

  factory GOrgPartsReq([Function(GOrgPartsReqBuilder b) updates]) =
      _$GOrgPartsReq;

  static void _initializeBuilder(GOrgPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'OrgParts';
  @override
  _i3.GOrgPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GOrgPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GOrgPartsData.fromJson(json);
  static Serializer<GOrgPartsReq> get serializer => _$gOrgPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GOrgPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOrgPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GOrgPartsReq.serializer,
        json,
      );
}
