extension MyString<T extends String> on String {
  int get toInt {
    return int.parse(this);
  }

  String get urlencode {
    return Uri.encodeComponent(this);
  }

  String get urldecode {
    return Uri.decodeComponent(this);
  }
}
