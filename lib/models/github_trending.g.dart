// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubTrendingItem _$GithubTrendingItemFromJson(Map<String, dynamic> json) {
  return GithubTrendingItem()
    ..author = json['author'] as String
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..description = json['description'] as String
    ..language = json['language'] as String
    ..languageColor = json['languageColor'] as String
    ..stars = json['stars'] as int
    ..forks = json['forks'] as int
    ..currentPeriodStars = json['currentPeriodStars'] as int;
}

Map<String, dynamic> _$GithubTrendingItemToJson(GithubTrendingItem instance) =>
    <String, dynamic>{
      'author': instance.author,
      'name': instance.name,
      'avatar': instance.avatar,
      'description': instance.description,
      'language': instance.language,
      'languageColor': instance.languageColor,
      'stars': instance.stars,
      'forks': instance.forks,
      'currentPeriodStars': instance.currentPeriodStars,
    };
