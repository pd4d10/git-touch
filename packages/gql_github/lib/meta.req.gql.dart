// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/meta.ast.gql.dart' as _i5;
import 'package:gql_github/meta.data.gql.dart' as _i2;
import 'package:gql_github/meta.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'meta.req.gql.g.dart';

abstract class GMetaReq
    implements
        Built<GMetaReq, GMetaReqBuilder>,
        _i1.OperationRequest<_i2.GMetaData, _i3.GMetaVars> {
  GMetaReq._();

  factory GMetaReq([Function(GMetaReqBuilder b) updates]) = _$GMetaReq;

  static void _initializeBuilder(GMetaReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Meta',
    )
    ..executeOnListen = true;
  @override
  _i3.GMetaVars get vars;
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
  _i2.GMetaData? Function(
    _i2.GMetaData?,
    _i2.GMetaData?,
  )? get updateResult;
  @override
  _i2.GMetaData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMetaData? parseData(Map<String, dynamic> json) =>
      _i2.GMetaData.fromJson(json);
  static Serializer<GMetaReq> get serializer => _$gMetaReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMetaReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMetaReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMetaReq.serializer,
        json,
      );
}
