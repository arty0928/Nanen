import 'package:wonders/common_libs.dart';

class MissionList {
  MissionList(this.missionTitle, this.missionSubTitle, this.missionPic, this.missionPicIsDone, this.aiDiary,
      this.aiDiaryIsDone);

  final String missionTitle;
  final String missionSubTitle;
  String missionPic;
  bool missionPicIsDone = false;
  String aiDiary;
  bool aiDiaryIsDone = false;
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
    MissionList($strings.activeMissionTitle1, $strings.activeMissionSubtitle1, '', false, '', false),
    MissionList($strings.activeMissionTitle2, $strings.activeMissionSubtitle2, '', false, '', false),
    MissionList($strings.activeMissionTitle3, $strings.activeMissionSubtitle3, '', false, '', false),
  ];

  final calmMissionLists = [
    MissionList($strings.calmMissionTitle1, $strings.calmMissionSubtitle1, '', false, '', false),
    MissionList($strings.calmMissionTitle2, $strings.calmMissionSubtitle2, '', false, '', false),
    MissionList($strings.calmMissionTitle3, $strings.calmMissionSubtitle3, '', false, '', false),
  ];

  final creativeMissionLists = [
    MissionList($strings.creativeMissionTitle1, $strings.creativeMissionSubtitle1, '', false, '', false),
    MissionList($strings.creativeMissionTitle2, $strings.creativeMissionSubtitle2, '', false, '', false),
    MissionList($strings.creativeMissionTitle3, $strings.creativeMissionSubtitle3, '', false, '', false),
  ];

  final peopleMissionLists = [
    MissionList($strings.peopleMissionTitle1, $strings.peopleMissionSubtitle1, '', false, '', false),
    MissionList($strings.peopleMissionTitle2, $strings.peopleMissionSubtitle2, '', false, '', false),
    MissionList($strings.peopleMissionTitle3, $strings.peopleMissionSubtitle3, '', false, '', false),
  ];
}
