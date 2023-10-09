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
            imageUrl: [
              '',
              '',
              '',
              '',
              '',
              ''
            ]);
}
