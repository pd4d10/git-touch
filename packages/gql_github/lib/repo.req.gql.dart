// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/repo.ast.gql.dart' as _i5;
import 'package:gql_github/repo.data.gql.dart' as _i2;
import 'package:gql_github/repo.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'repo.req.gql.g.dart';

abstract class GRepoReq
    implements
        Built<GRepoReq, GRepoReqBuilder>,
        _i1.OperationRequest<_i2.GRepoData, _i3.GRepoVars> {
  GRepoReq._();

  factory GRepoReq([Function(GRepoReqBuilder b) updates]) = _$GRepoReq;

  static void _initializeBuilder(GRepoReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Repo',
    )
    ..executeOnListen = true;
  @override
  _i3.GRepoVars get vars;
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
  _i2.GRepoData? Function(
    _i2.GRepoData?,
    _i2.GRepoData?,
  )? get updateResult;
  @override
  _i2.GRepoData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GRepoData? parseData(Map<String, dynamic> json) =>
      _i2.GRepoData.fromJson(json);
  static Serializer<GRepoReq> get serializer => _$gRepoReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GRepoReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRepoReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GRepoReq.serializer,
        json,
      );
}

abstract class GCommitPartsReq
    implements
        Built<GCommitPartsReq, GCommitPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GCommitPartsData, _i3.GCommitPartsVars> {
  GCommitPartsReq._();

  factory GCommitPartsReq([Function(GCommitPartsReqBuilder b) updates]) =
      _$GCommitPartsReq;

  static void _initializeBuilder(GCommitPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CommitParts';
  @override
  _i3.GCommitPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommitPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GCommitPartsData.fromJson(json);
  static Serializer<GCommitPartsReq> get serializer =>
      _$gCommitPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCommitPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCommitPartsReq.serializer,
        json,
      );
}

abstract class GRefPartsReq
    implements
        Built<GRefPartsReq, GRefPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GRefPartsData, _i3.GRefPartsVars> {
  GRefPartsReq._();

  factory GRefPartsReq([Function(GRefPartsReqBuilder b) updates]) =
      _$GRefPartsReq;

  static void _initializeBuilder(GRefPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RefParts';
  @override
  _i3.GRefPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GRefPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GRefPartsData.fromJson(json);
  static Serializer<GRefPartsReq> get serializer => _$gRefPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GRefPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRefPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GRefPartsReq.serializer,
        json,
      );
}
