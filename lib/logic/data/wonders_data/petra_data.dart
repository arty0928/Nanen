import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/data/wonder_data.dart';
import 'package:wonders/logic/data/wonders_data/search/search_data.dart';

part 'search/petra_search_data.dart';

class PetraData extends WonderData {
  PetraData()
      : super(
            searchData: _searchData, // included as a part from ./search/
            searchSuggestions: _searchSuggestions, // included as a part from ./search/
            type: WonderType.petra,
            // title: $strings.petraTitle,
            title: 'Calm',
            // subTitle: $strings.petraSubTitle,
            subTitle: 'Look inside your heart',
            regionTitle: 'Calm',
            // videoId: 'ezDiSkOU0wc',
            // startYr: -312,
            // endYr: 100,
            // artifactStartYr: -500,
            // artifactEndYr: 500,
            // artifactCulture: $strings.petraArtifactCulture,
            // artifactGeolocation: $strings.petraArtifactGeolocation,
            lat: 30.328830750209903,
            lng: 35.44398203484667,
            unsplashCollectionId: 'qWQJbDvCMW8',
            // pullQuote1Top: $strings.petraPullQuote1Top,
            // pullQuote1Bottom: $strings.petraPullQuote1Bottom,
            // pullQuote1Author: $strings.petraPullQuote1Author,
            // pullQuote2: $strings.petraPullQuote2,
            // pullQuote2Author: $strings.petraPullQuote2Author,
            callout1: $strings.petraCallout1,
            callout2: $strings.petraCallout2,
            // videoCaption: $strings.petraVideoCaption,
            // mapCaption: $strings.petraMapCaption,
            // historyInfo1: $strings.petraHistoryInfo1,
            // historyInfo2: $strings.petraHistoryInfo2,
            constructionInfo1: $strings.petraConstructionInfo1,
            constructionInfo2: $strings.petraConstructionInfo2,
            locationInfo1: $strings.petraLocationInfo1,
            locationInfo2: $strings.petraLocationInfo2,
            missionTitle: {
              $strings.peopleMissionTitle1: $strings.peopleMissionSubtitle1,
              $strings.peopleMissionTitle2: $strings.peopleMissionSubtitle2,
              $strings.peopleMissionTitle3: $strings.peopleMissionSubtitle3,
              $strings.peopleMissionTitle4: $strings.peopleMissionSubtitle4,
              $strings.peopleMissionTitle5: $strings.peopleMissionSubtitle5,
              $strings.peopleMissionTitle6: $strings.peopleMissionSubtitle6,
            },
            imageUrl: [
              '',
              '',
              '',
              '',
              '',
              ''
            ]
            // events: {
            //   // -1200: $strings.active,
            //   -106: $strings.petra106bce,
            //   551: $strings.petra551ce,
            //   1812: $strings.petra1812ce,
            //   1958: $strings.petra1958ce,
            //   1989: $strings.petra1989ce,
            // },
            );
}
