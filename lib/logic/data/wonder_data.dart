import 'package:equatable/equatable.dart';
import 'package:wonders/logic/data/wonder_type.dart';
import 'package:wonders/logic/data/wonders_data/search/search_data.dart';

class WonderData extends Equatable {
  WonderData({
    required this.missionTitle,
    required this.type,
    required this.title,
    required this.subTitle,
    required this.subTitleText,
    required this.regionTitle,
    this.lat = 0,
    this.lng = 0,
    this.imageIds = const [],
    required this.unsplashCollectionId,
    this.callout1 = '',
    this.callout2 = '',
    this.facts = const [],
    required this.constructionInfo1,
    required this.constructionInfo2,
    required this.locationInfo1,
    required this.locationInfo2,
    this.searchData = const [],
    this.searchSuggestions = const [],
    required this.imageUrl,
    required List<String> subTitleText_2,
    required List<String> subTitleText_3,
    required List<String> subTitleText_4,
  });

  final WonderType type;
  final String title;
  final String subTitle;
  final List<String> subTitleText;

  final String regionTitle;
  final String constructionInfo1;
  final String constructionInfo2;
  final String locationInfo1;
  final String locationInfo2;
  final String callout1;
  final String callout2;
  final String unsplashCollectionId;
  final List<String> imageIds;
  final List<String> facts;
  final double lat;
  final double lng;
  List<String> imageUrl = ['', '', '', '', '', ''];

  final Map<String, String> missionTitle;
  // final List<String> missionSubTitle;
  // final List<String> highlightArtifacts; // IDs used to assemble HighlightsData, should not be used directly
  // final List<String> hiddenArtifacts; // IDs used to assemble CollectibleData, should not be used directly
  // final Map<int, String> events;
  final List<SearchData> searchData;
  final List<String> searchSuggestions;

  String get titleWithBreaks => title.replaceFirst(' ', '\n');

  @override
  List<Object?> get props => [type, title, imageIds, facts];
}
