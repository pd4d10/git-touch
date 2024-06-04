// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/commits.ast.gql.dart' as _i5;
import 'package:gql_github/commits.data.gql.dart' as _i2;
import 'package:gql_github/commits.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'commits.req.gql.g.dart';

abstract class GCommitsReq
    implements
        Built<GCommitsReq, GCommitsReqBuilder>,
        _i1.OperationRequest<_i2.GCommitsData, _i3.GCommitsVars> {
  GCommitsReq._();

  factory GCommitsReq([Function(GCommitsReqBuilder b) updates]) = _$GCommitsReq;

  static void _initializeBuilder(GCommitsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Commits',
    )
    ..executeOnListen = true;
  @override
  _i3.GCommitsVars get vars;
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
  _i2.GCommitsData? Function(
    _i2.GCommitsData?,
    _i2.GCommitsData?,
  )? get updateResult;
  @override
  _i2.GCommitsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCommitsData? parseData(Map<String, dynamic> json) =>
      _i2.GCommitsData.fromJson(json);
  static Serializer<GCommitsReq> get serializer => _$gCommitsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCommitsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCommitsReq.serializer,
        json,
      );
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
  @override
  _i3.GCommitsRefCommitVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommitsRefCommitData? parseData(Map<String, dynamic> json) =>
      _i2.GCommitsRefCommitData.fromJson(json);
  static Serializer<GCommitsRefCommitReq> get serializer =>
      _$gCommitsRefCommitReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCommitsRefCommitReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitsRefCommitReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCommitsRefCommitReq.serializer,
        json,
      );
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
  @override
  _i3.GCommitsRefVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommitsRefData? parseData(Map<String, dynamic> json) =>
      _i2.GCommitsRefData.fromJson(json);
  static Serializer<GCommitsRefReq> get serializer =>
      _$gCommitsRefReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCommitsRefReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitsRefReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCommitsRefReq.serializer,
        json,
      );
}
