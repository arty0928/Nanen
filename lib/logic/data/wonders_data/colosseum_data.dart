import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'package:wonders/logic/data/wonders_data/search/search_data.dart';

part 'search/colosseum_search_data.dart';

class ColosseumData extends WonderData {
  ColosseumData()
      : super(
            searchData: _searchData, // included as a part from ./search/
            searchSuggestions: _searchSuggestions, // included as a part from ./search/
            type: WonderType.colosseum,
            // title: $strings.colosseumTitle,
            title: 'Creative',
            // subTitle: $strings.colosseumSubTitle,
            subTitle: 'Make creative your life',
            // regionTitle: $strings.colosseumRegionTitle,
            regionTitle: 'Creative',
            // videoId: 'GXoEpNjgKzg',
            // startYr: 70,
            // endYr: 80,
            // artifactStartYr: 0,
            // artifactEndYr: 500,
            // artifactCulture: $strings.colosseumArtifactCulture,
            // artifactGeolocation: $strings.colosseumArtifactGeolocation,
            lat: 41.890242126393495,
            lng: 12.492349361871392,
            unsplashCollectionId: 'VPdti8Kjq9o',
            // pullQuote1Top: $strings.colosseumPullQuote1Top,
            // pullQuote1Bottom: $strings.colosseumPullQuote1Bottom,
            // pullQuote1Author: '',
            // pullQuote2: $strings.colosseumPullQuote2,
            // pullQuote2Author: $strings.colosseumPullQuote2Author,
            callout1: $strings.colosseumCallout1,
            callout2: $strings.colosseumCallout2,
            // videoCaption: $strings.colosseumVideoCaption,
            // mapCaption: $strings.colosseumMapCaption,
            // historyInfo1: $strings.colosseumHistoryInfo1,
            // historyInfo2: $strings.colosseumHistoryInfo2,
            constructionInfo1: $strings.colosseumConstructionInfo1,
            constructionInfo2: $strings.colosseumConstructionInfo2,
            locationInfo1: $strings.colosseumLocationInfo1,
            locationInfo2: $strings.colosseumLocationInfo2,
            // highlightArtifacts: const [
            //   '251350',
            //   '255960',
            //   '247993',
            //   '250464',
            //   '251476',
            //   '255960',
            // ],
            // hiddenArtifacts: const [
            //   '245376',
            //   '256570',
            //   '286136',
            // ],
            // events: {
            //   70: $strings.colosseum70ce,
            //   82: $strings.colosseum82ce,
            //   1140: $strings.colosseum1140ce,
            //   1490: $strings.colosseum1490ce,
            //   1829: $strings.colosseum1829ce,
            //   1990: $strings.colosseum1990ce,
            // },
            missionTitle: {
              $strings.calmMissionTitle1: $strings.calmMissionSubtitle1,
              $strings.calmMissionTitle2: $strings.calmMissionSubtitle2,
              $strings.calmMissionTitle3: $strings.calmMissionSubtitle3,
              $strings.calmMissionTitle4: $strings.calmMissionSubtitle4,
              $strings.calmMissionTitle5: $strings.calmMissionSubtitle5,
              $strings.calmMissionTitle6: $strings.calmMissionSubtitle6,
            },
            subTitleText: [
              $strings.calmMissionSubtitleText1,
              $strings.calmMissionSubtitleText2,
              $strings.calmMissionSubtitleText3,
              $strings.calmMissionSubtitleText4,
              $strings.calmMissionSubtitleText5,
              $strings.calmMissionSubtitleText6
            ],
            subTitleText_2: [
              $strings.calmMissionSubtitleText1_2,
              $strings.calmMissionSubtitleText2_2,
              $strings.calmMissionSubtitleText3_2,
              $strings.calmMissionSubtitleText4_2,
              $strings.calmMissionSubtitleText5_2,
              $strings.calmMissionSubtitleText6_2
            ],
            subTitleText_3: [
              $strings.calmMissionSubtitleText1_3,
              $strings.calmMissionSubtitleText2_3,
              $strings.calmMissionSubtitleText3_3,
              $strings.calmMissionSubtitleText4_3,
              $strings.calmMissionSubtitleText5_3,
              $strings.calmMissionSubtitleText6_3
            ],
            subTitleText_4: [
              $strings.calmMissionSubtitleText1_4,
              $strings.calmMissionSubtitleText2_4,
              $strings.calmMissionSubtitleText3_4,
              $strings.calmMissionSubtitleText4_4,
              $strings.calmMissionSubtitleText5_4,
              $strings.calmMissionSubtitleText6_4
            ],
            hashTag1: [
              $strings.calmHashtag1_1,
              $strings.calmHashtag2_1,
              $strings.calmHashtag3_1,
              $strings.calmHashtag4_1,
              $strings.calmHashtag5_1,
              $strings.calmHashtag6_1
            ],
            hastTag2: [
              $strings.calmHashtag1_2,
              $strings.calmHashtag2_2,
              $strings.calmHashtag3_2,
              $strings.calmHashtag4_2,
              $strings.calmHashtag5_2,
              $strings.calmHashtag6_2
            ],
            hashTag3: [
              $strings.calmHashtag1_3,
              $strings.calmHashtag2_3,
              $strings.calmHashtag3_3,
              $strings.calmHashtag4_3,
              $strings.calmHashtag5_3,
              $strings.calmHashtag6_3
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
