// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/serializers.gql.dart' as _i6;
import 'package:gql_github/user.ast.gql.dart' as _i5;
import 'package:gql_github/user.data.gql.dart' as _i2;
import 'package:gql_github/user.var.gql.dart' as _i3;

part 'user.req.gql.g.dart';

abstract class GViewerReq
    implements
        Built<GViewerReq, GViewerReqBuilder>,
        _i1.OperationRequest<_i2.GViewerData, _i3.GViewerVars> {
  GViewerReq._();

  factory GViewerReq([Function(GViewerReqBuilder b) updates]) = _$GViewerReq;

  static void _initializeBuilder(GViewerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Viewer',
    )
    ..executeOnListen = true;
  @override
  _i3.GViewerVars get vars;
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
  _i2.GViewerData? Function(
    _i2.GViewerData?,
    _i2.GViewerData?,
  )? get updateResult;
  @override
  _i2.GViewerData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GViewerData? parseData(Map<String, dynamic> json) =>
      _i2.GViewerData.fromJson(json);
  static Serializer<GViewerReq> get serializer => _$gViewerReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GViewerReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GViewerReq.serializer,
        json,
      );
}

abstract class GUserReq
    implements
        Built<GUserReq, GUserReqBuilder>,
        _i1.OperationRequest<_i2.GUserData, _i3.GUserVars> {
  GUserReq._();

  factory GUserReq([Function(GUserReqBuilder b) updates]) = _$GUserReq;

  static void _initializeBuilder(GUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'User',
    )
    ..executeOnListen = true;
  @override
  _i3.GUserVars get vars;
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
  _i2.GUserData? Function(
    _i2.GUserData?,
    _i2.GUserData?,
  )? get updateResult;
  @override
  _i2.GUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserData? parseData(Map<String, dynamic> json) =>
      _i2.GUserData.fromJson(json);
  static Serializer<GUserReq> get serializer => _$gUserReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserReq.serializer,
        json,
      );
}

abstract class GRepoPartsReq
    implements
        Built<GRepoPartsReq, GRepoPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GRepoPartsData, _i3.GRepoPartsVars> {
  GRepoPartsReq._();

  factory GRepoPartsReq([Function(GRepoPartsReqBuilder b) updates]) =
      _$GRepoPartsReq;

  static void _initializeBuilder(GRepoPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RepoParts';
  @override
  _i3.GRepoPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GRepoPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GRepoPartsData.fromJson(json);
  static Serializer<GRepoPartsReq> get serializer => _$gRepoPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GRepoPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRepoPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GRepoPartsReq.serializer,
        json,
      );
}

abstract class GSponsorConnectionPartsReq
    implements
        Built<GSponsorConnectionPartsReq, GSponsorConnectionPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GSponsorConnectionPartsData,
            _i3.GSponsorConnectionPartsVars> {
  GSponsorConnectionPartsReq._();

  factory GSponsorConnectionPartsReq(
          [Function(GSponsorConnectionPartsReqBuilder b) updates]) =
      _$GSponsorConnectionPartsReq;

  static void _initializeBuilder(GSponsorConnectionPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'SponsorConnectionParts';
  @override
  _i3.GSponsorConnectionPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GSponsorConnectionPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GSponsorConnectionPartsData.fromJson(json);
  static Serializer<GSponsorConnectionPartsReq> get serializer =>
      _$gSponsorConnectionPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSponsorConnectionPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSponsorConnectionPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSponsorConnectionPartsReq.serializer,
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
