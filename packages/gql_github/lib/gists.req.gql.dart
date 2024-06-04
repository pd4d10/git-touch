// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/gists.ast.gql.dart' as _i5;
import 'package:gql_github/gists.data.gql.dart' as _i2;
import 'package:gql_github/gists.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'gists.req.gql.g.dart';

abstract class GGistsReq
    implements
        Built<GGistsReq, GGistsReqBuilder>,
        _i1.OperationRequest<_i2.GGistsData, _i3.GGistsVars> {
  GGistsReq._();

  factory GGistsReq([Function(GGistsReqBuilder b) updates]) = _$GGistsReq;

  static void _initializeBuilder(GGistsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Gists',
    )
    ..executeOnListen = true;
  @override
  _i3.GGistsVars get vars;
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
  _i2.GGistsData? Function(
    _i2.GGistsData?,
    _i2.GGistsData?,
  )? get updateResult;
  @override
  _i2.GGistsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGistsData? parseData(Map<String, dynamic> json) =>
      _i2.GGistsData.fromJson(json);
  static Serializer<GGistsReq> get serializer => _$gGistsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGistsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGistsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGistsReq.serializer,
        json,
      );
}
