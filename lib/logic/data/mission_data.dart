import 'package:wonders/common_libs.dart';

class MissionList {
  MissionList(this.missionTitle, this.missionSubTitle);
  final String missionTitle;
  final String missionSubTitle;
}

class MissionLists {
  List<MissionList> getMissionList(WonderType type) {
    if (type == WonderType.greatWall) {
      return activeMissionLists;
    } else if (type == WonderType.colosseum) {
      return creativeMissionLists;
    } else if (type == WonderType.chichenItza) {
      return peopleMissionLists;
    } else {
      return calmMissionLists;
    }
  }

  final activeMissionLists = [
    MissionList($strings.activeMissionTitle1, $strings.activeMissionSubtitle1),
    MissionList($strings.activeMissionTitle2, $strings.activeMissionSubtitle2),
    MissionList($strings.activeMissionTitle3, $strings.activeMissionSubtitle3),
  ];

  final calmMissionLists = [
    MissionList($strings.calmMissionTitle1, $strings.calmMissionSubtitle1),
    MissionList($strings.calmMissionTitle2, $strings.calmMissionSubtitle2),
    MissionList($strings.calmMissionTitle3, $strings.calmMissionSubtitle3),
  ];

  final creativeMissionLists = [
    MissionList($strings.creativeMissionTitle1, $strings.creativeMissionSubtitle1),
    MissionList($strings.creativeMissionTitle2, $strings.creativeMissionSubtitle2),
    MissionList($strings.creativeMissionTitle3, $strings.creativeMissionSubtitle3),
  ];

  final peopleMissionLists = [
    MissionList($strings.peopleMissionTitle1, $strings.peopleMissionSubtitle1),
    MissionList($strings.peopleMissionTitle2, $strings.peopleMissionSubtitle2),
    MissionList($strings.peopleMissionTitle3, $strings.peopleMissionSubtitle3),
  ];
}
