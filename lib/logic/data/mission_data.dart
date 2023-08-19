import 'package:wonders/common_libs.dart';

class MissionList {
  MissionList(this.missionTitle, this.missionSubTitle);
  final String missionTitle;
  final String missionSubTitle;
}

class MissionLists {
  List<MissionList> getMissionList(WonderType type) {
    if (type == WonderType.chichenItza) {
      return activeMissionLists;
    } else if (type == WonderType.colosseum) {
      return calmMissionLists;
    } else if (type == WonderType.greatWall) {
      return creativeMissionLists;
    } else {
      return peopleMissionLists;
    }
  }

  final activeMissionLists = [
    MissionList($strings.activeMissionTitle1, $strings.activeMissionSubTitle1),
    MissionList($strings.activeMissionTitle2, $strings.activeMissionSubTitle2),
    MissionList($strings.activeMissionTitle3, $strings.activeMissionSubTitle3),
  ];

  final calmMissionLists = [
    MissionList($strings.calmMissionTitle1, $strings.calmMissionsSubTitle1),
    MissionList($strings.calmMissionTitle2, $strings.calmMissionsSubTitle2),
    MissionList($strings.calmMissionTitle3, $strings.calmMissionsSubTitle3),
  ];

  final creativeMissionLists = [
    MissionList($strings.activeMissionTitle1, $strings.activeMissionSubTitle1),
    MissionList($strings.activeMissionTitle2, $strings.activeMissionSubTitle2),
    MissionList($strings.activeMissionTitle3, $strings.activeMissionSubTitle3),
  ];

  final peopleMissionLists = [
    MissionList($strings.peopleMissionTitle1, $strings.peopleMissionSubTitle1),
    MissionList($strings.peopleMissionTitle2, $strings.peopleMissionSubTitle2),
    MissionList($strings.peopleMissionTitle3, $strings.peopleMissionSubTitle3),
  ];
}
