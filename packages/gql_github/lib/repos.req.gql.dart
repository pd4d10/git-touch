// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/repos.ast.gql.dart' as _i5;
import 'package:gql_github/repos.data.gql.dart' as _i2;
import 'package:gql_github/repos.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'repos.req.gql.g.dart';

abstract class GReposReq
    implements
        Built<GReposReq, GReposReqBuilder>,
        _i1.OperationRequest<_i2.GReposData, _i3.GReposVars> {
  GReposReq._();

  factory GReposReq([Function(GReposReqBuilder b) updates]) = _$GReposReq;

  static void _initializeBuilder(GReposReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Repos',
    )
    ..executeOnListen = true;
  @override
  _i3.GReposVars get vars;
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
  _i2.GReposData? Function(
    _i2.GReposData?,
    _i2.GReposData?,
  )? get updateResult;
  @override
  _i2.GReposData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReposData? parseData(Map<String, dynamic> json) =>
      _i2.GReposData.fromJson(json);
  static Serializer<GReposReq> get serializer => _$gReposReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReposReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReposReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReposReq.serializer,
        json,
      );
}

abstract class GStarsReq
    implements
        Built<GStarsReq, GStarsReqBuilder>,
        _i1.OperationRequest<_i2.GStarsData, _i3.GStarsVars> {
  GStarsReq._();

  factory GStarsReq([Function(GStarsReqBuilder b) updates]) = _$GStarsReq;

  static void _initializeBuilder(GStarsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Stars',
    )
    ..executeOnListen = true;
  @override
  _i3.GStarsVars get vars;
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
  _i2.GStarsData? Function(
    _i2.GStarsData?,
    _i2.GStarsData?,
  )? get updateResult;
  @override
  _i2.GStarsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GStarsData? parseData(Map<String, dynamic> json) =>
      _i2.GStarsData.fromJson(json);
  static Serializer<GStarsReq> get serializer => _$gStarsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GStarsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStarsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GStarsReq.serializer,
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
