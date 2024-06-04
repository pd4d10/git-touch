// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/releases.ast.gql.dart' as _i5;
import 'package:gql_github/releases.data.gql.dart' as _i2;
import 'package:gql_github/releases.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'releases.req.gql.g.dart';

abstract class GReleasesReq
    implements
        Built<GReleasesReq, GReleasesReqBuilder>,
        _i1.OperationRequest<_i2.GReleasesData, _i3.GReleasesVars> {
  GReleasesReq._();

  factory GReleasesReq([Function(GReleasesReqBuilder b) updates]) =
      _$GReleasesReq;

  static void _initializeBuilder(GReleasesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Releases',
    )
    ..executeOnListen = true;
  @override
  _i3.GReleasesVars get vars;
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
  _i2.GReleasesData? Function(
    _i2.GReleasesData?,
    _i2.GReleasesData?,
  )? get updateResult;
  @override
  _i2.GReleasesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReleasesData? parseData(Map<String, dynamic> json) =>
      _i2.GReleasesData.fromJson(json);
  static Serializer<GReleasesReq> get serializer => _$gReleasesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReleasesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleasesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReleasesReq.serializer,
        json,
      );
}
