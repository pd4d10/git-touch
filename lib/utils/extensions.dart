import 'dart:convert';

extension MyString<T extends String> on String {
  int get toInt => int.parse(this);
  String get urlencode => Uri.encodeComponent(this);
  String get urldecode => Uri.decodeComponent(this);
  String get dropLineBreak => this.replaceAll('\n', '');
  String get base64ToUtf8 => utf8.decode(base64.decode(this));
}
