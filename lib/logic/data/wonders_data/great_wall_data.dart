import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'package:wonders/logic/data/wonders_data/search/search_data.dart';

part 'search/great_wall_search_data.dart';

class GreatWallData extends WonderData {
  GreatWallData()
      : super(
            searchData: _searchData, // included as a part from ./search/
            searchSuggestions: _searchSuggestions, // included as a part from ./search/
            type: WonderType.greatWall,
            // title: $strings.greatWallTitle,
            title: 'Active',
            // subTitle: $strings.greatWallSubTitle,
            subTitle: 'More active more better',
            // regionTitle: $strings.greatWallRegionTitle,
            regionTitle: 'Active',
            // videoId: 'do1Go22Wu8o',
            // startYr: -700,
            // endYr: 1644,
            // artifactStartYr: -700,
            // artifactEndYr: 1650,
            // artifactCulture: $strings.greatWallArtifactCulture,
            // artifactGeolocation: $strings.greatWallArtifactGeolocation,
            lat: 40.43199751120627,
            lng: 116.57040708482984,
            unsplashCollectionId: 'Kg_h04xvZEo',
            // pullQuote1Top: $strings.greatWallPullQuote1Top,
            // pullQuote1Bottom: $strings.greatWallPullQuote1Bottom,
            // pullQuote1Author: '', //No key because it doesn't generate for empty values
            // pullQuote2: $strings.greatWallPullQuote2,
            // pullQuote2Author: $strings.greatWallPullQuote2Author,
            callout1: $strings.greatWallCallout1,
            callout2: $strings.greatWallCallout2,
            // videoCaption: $strings.greatWallVideoCaption,
            // mapCaption: $strings.greatWallMapCaption,
            // historyInfo1: $strings.greatWallHistoryInfo1,
            // historyInfo2: $strings.greatWallHistoryInfo2,
            constructionInfo1: $strings.greatWallConstructionInfo1,
            constructionInfo2: $strings.greatWallConstructionInfo2,
            locationInfo1: $strings.greatWallLocationInfo1,
            locationInfo2: $strings.greatWallLocationInfo2,
            // highlightArtifacts: const [
            //   '79091',
            //   '781812',
            //   '40213',
            //   '40765',
            //   '57612',
            //   '666573',
            // ],
            // hiddenArtifacts: const [
            //   '39918',
            //   '39666',
            //   '39735',
            // ],
            // events: {
            //   -700: $strings.greatWall700bce,
            //   -214: $strings.greatWall214bce,
            //   -121: $strings.greatWall121bce,
            //   556: $strings.greatWall556ce,
            //   618: $strings.greatWall618ce,
            //   1487: $strings.greatWall1487ce,
            // },
            missionTitle: {
              $strings.activeMissionTitle1: $strings.activeMissionSubtitle1,
              $strings.activeMissionTitle2: $strings.activeMissionSubtitle2,
              $strings.activeMissionTitle3: $strings.activeMissionSubtitle3,
              $strings.activeMissionTitle4: $strings.activeMissionSubtitle4,
              $strings.activeMissionTitle5: $strings.activeMissionSubtitle5,
              $strings.activeMissionTitle6: $strings.activeMissionSubtitle6,
            },
            subTitleText: [
              $strings.creativeMissionSubtitleText1,
              $strings.creativeMissionSubtitleText2,
              $strings.creativeMissionSubtitleText3,
              $strings.creativeMissionSubtitleText4,
              $strings.creativeMissionSubtitleText5,
              $strings.creativeMissionSubtitleText6
            ],
            subTitleText_2: [
              $strings.creativeMissionSubtitleText1_2,
              $strings.creativeMissionSubtitleText2_2,
              $strings.creativeMissionSubtitleText3_2,
              $strings.creativeMissionSubtitleText4_2,
              $strings.creativeMissionSubtitleText5_2,
              $strings.creativeMissionSubtitleText6_2
            ],
            subTitleText_3: [
              $strings.creativeMissionSubtitleText1_3,
              $strings.creativeMissionSubtitleText2_3,
              $strings.creativeMissionSubtitleText3_3,
              $strings.creativeMissionSubtitleText4_3,
              $strings.creativeMissionSubtitleText5_3,
              $strings.creativeMissionSubtitleText6_3
            ],
            subTitleText_4: [
              $strings.creativeMissionSubtitleText1_4,
              $strings.creativeMissionSubtitleText2_4,
              $strings.creativeMissionSubtitleText3_4,
              $strings.creativeMissionSubtitleText4_4,
              $strings.creativeMissionSubtitleText5_4,
              $strings.creativeMissionSubtitleText6_4
            ],
            hashTag1: [
              $strings.creativeHashtag1_1,
              $strings.creativeHashtag2_1,
              $strings.creativeHashtag3_1,
              $strings.creativeHashtag4_1,
              $strings.creativeHashtag5_1,
              $strings.creativeHashtag6_1
            ],
            hastTag2: [
              $strings.creativeHashtag1_2,
              $strings.creativeHashtag2_2,
              $strings.creativeHashtag3_2,
              $strings.creativeHashtag4_2,
              $strings.creativeHashtag5_2,
              $strings.creativeHashtag6_2
            ],
            hashTag3: [
              $strings.creativeHashtag1_3,
              $strings.creativeHashtag2_3,
              $strings.creativeHashtag3_3,
              $strings.creativeHashtag4_3,
              $strings.creativeHashtag5_3,
              $strings.creativeHashtag6_3
            ],
            imageUrl: [
              '',
              '',
              '',
              '',
              '',
              ''
            ]);
}
