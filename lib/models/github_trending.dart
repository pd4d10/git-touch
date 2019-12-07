import 'package:json_annotation/json_annotation.dart';

part 'github_trending.g.dart';

@JsonSerializable()
class GithubTrendingItem {
  String author;
  String name;
  String avatar;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;

  GithubTrendingItem();

  factory GithubTrendingItem.fromJson(Map<String, dynamic> json) =>
      _$GithubTrendingItemFromJson(json);
}
