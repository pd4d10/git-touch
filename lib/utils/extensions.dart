extension MyString<T extends String> on String {
  String get urlencode {
    return Uri.encodeComponent(this);
  }

  String get urldecode {
    return Uri.decodeComponent(this);
  }
}
