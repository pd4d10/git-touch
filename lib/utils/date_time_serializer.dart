import 'package:built_value/serializer.dart';

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  DateTime deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(serialized is String,
        "DateTimeSerializer expected 'String' but got ${serialized.runtimeType}");
    return DateTime.parse(serialized as String);
  }

  @override
  Object serialize(
    Serializers serializers,
    DateTime dt, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      dt.toString();

  @override
  Iterable<Type> get types => [DateTime];

  @override
  String get wireName => "DateTime";
}
