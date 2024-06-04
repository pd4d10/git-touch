// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/gist.ast.gql.dart' as _i5;
import 'package:gql_github/gist.data.gql.dart' as _i2;
import 'package:gql_github/gist.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'gist.req.gql.g.dart';

abstract class GGistReq
    implements
        Built<GGistReq, GGistReqBuilder>,
        _i1.OperationRequest<_i2.GGistData, _i3.GGistVars> {
  GGistReq._();

  factory GGistReq([Function(GGistReqBuilder b) updates]) = _$GGistReq;

  static void _initializeBuilder(GGistReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Gist',
    )
    ..executeOnListen = true;
  @override
  _i3.GGistVars get vars;
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
  _i2.GGistData? Function(
    _i2.GGistData?,
    _i2.GGistData?,
  )? get updateResult;
  @override
  _i2.GGistData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGistData? parseData(Map<String, dynamic> json) =>
      _i2.GGistData.fromJson(json);
  static Serializer<GGistReq> get serializer => _$gGistReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGistReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGistReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGistReq.serializer,
        json,
      );
}
