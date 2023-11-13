import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'package:wonders/logic/data/wonders_data/search/search_data.dart';

part 'search/chichen_itza_search_data.dart';

class ChichenItzaData extends WonderData {
  ChichenItzaData()
      : super(
            searchData: _searchData, // included as a part from ./search/
            searchSuggestions: _searchSuggestions, // included as a part from ./search/
            type: WonderType.chichenItza,
            // title: $strings.chichenItzaTitle,
            title: 'People',
            // subTitle: $strings.chichenItzaSubTitle,
            subTitle: 'Share with your memory',
            // regionTitle: $strings.chichenItzaRegionTitle,
            regionTitle: 'People',
            lat: 20.68346184201756,
            lng: -88.56769676930931,
            unsplashCollectionId: 'SUK0tuMnLLw',
            callout1: $strings.chichenItzaCallout1,
            callout2: $strings.chichenItzaCallout2,
            constructionInfo1: $strings.chichenItzaConstructionInfo1,
            constructionInfo2: $strings.chichenItzaConstructionInfo2,
            locationInfo1: $strings.chichenItzaLocationInfo1,
            locationInfo2: $strings.chichenItzaLocationInfo2,
            missionTitle: {
              $strings.activeMissionTitle1: $strings.activeMissionSubtitle1,
              $strings.activeMissionTitle2: $strings.activeMissionSubtitle2,
              $strings.activeMissionTitle3: $strings.activeMissionSubtitle3,
              $strings.activeMissionTitle4: $strings.activeMissionSubtitle4,
              $strings.activeMissionTitle5: $strings.activeMissionSubtitle5,
              $strings.activeMissionTitle6: $strings.activeMissionSubtitle6,
            },
            subTitleText: [
              $strings.activeMissionSubtitleText1,
              $strings.activeMissionSubtitleText2,
              $strings.activeMissionSubtitleText3,
              $strings.activeMissionSubtitleText4,
              $strings.activeMissionSubtitleText5,
              $strings.activeMissionSubtitleText6
            ],
            subTitleText_2: [
              $strings.activeMissionSubtitleText1_2,
              $strings.activeMissionSubtitleText2_2,
              $strings.activeMissionSubtitleText3_2,
              $strings.activeMissionSubtitleText4_2,
              $strings.activeMissionSubtitleText5_2,
              $strings.activeMissionSubtitleText6_2
            ],
            subTitleText_3: [
              $strings.activeMissionSubtitleText1_3,
              $strings.activeMissionSubtitleText2_3,
              $strings.activeMissionSubtitleText3_3,
              $strings.activeMissionSubtitleText4_3,
              $strings.activeMissionSubtitleText5_3,
              $strings.activeMissionSubtitleText6_3
            ],
            subTitleText_4: [
              $strings.activeMissionSubtitleText1_4,
              $strings.activeMissionSubtitleText2_4,
              $strings.activeMissionSubtitleText3_4,
              $strings.activeMissionSubtitleText4_4,
              $strings.activeMissionSubtitleText5_4,
              $strings.activeMissionSubtitleText6_4
            ],
            hashTag1: [
              $strings.activeHashtag1_1,
              $strings.activeHashtag2_1,
              $strings.activeHashtag3_1,
              $strings.activeHashtag4_1,
              $strings.activeHashtag5_1,
              $strings.activeHashtag6_1
            ],
            hastTag2: [
              $strings.activeHashtag1_2,
              $strings.activeHashtag2_2,
              $strings.activeHashtag3_2,
              $strings.activeHashtag4_2,
              $strings.activeHashtag5_2,
              $strings.activeHashtag6_2
            ],
            hashTag3: [
              $strings.activeHashtag1_3,
              $strings.activeHashtag2_3,
              $strings.activeHashtag3_3,
              $strings.activeHashtag4_3,
              $strings.activeHashtag5_3,
              $strings.activeHashtag6_3
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
