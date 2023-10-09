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
    MissionList($strings.activeMissionTitle4, $strings.activeMissionSubtitle4, '', false, '', false),
    MissionList($strings.activeMissionTitle5, $strings.activeMissionSubtitle5, '', false, '', false),
    MissionList($strings.activeMissionTitle6, $strings.activeMissionSubtitle6, '', false, '', false),
  ];

  final calmMissionLists = [
    MissionList($strings.calmMissionTitle1, $strings.calmMissionSubtitle1, '', false, '', false),
    MissionList($strings.calmMissionTitle2, $strings.calmMissionSubtitle2, '', false, '', false),
    MissionList($strings.calmMissionTitle3, $strings.calmMissionSubtitle3, '', false, '', false),
    MissionList($strings.calmMissionTitle4, $strings.calmMissionSubtitle4, '', false, '', false),
    MissionList($strings.calmMissionTitle5, $strings.calmMissionSubtitle5, '', false, '', false),
    MissionList($strings.calmMissionTitle6, $strings.calmMissionSubtitle6, '', false, '', false),
  ];

  final creativeMissionLists = [
    MissionList($strings.creativeMissionTitle1, $strings.creativeMissionSubtitle1, '', false, '', false),
    MissionList($strings.creativeMissionTitle2, $strings.creativeMissionSubtitle2, '', false, '', false),
    MissionList($strings.creativeMissionTitle3, $strings.creativeMissionSubtitle3, '', false, '', false),
    MissionList($strings.creativeMissionTitle4, $strings.creativeMissionSubtitle4, '', false, '', false),
    MissionList($strings.creativeMissionTitle5, $strings.creativeMissionSubtitle5, '', false, '', false),
    MissionList($strings.creativeMissionTitle6, $strings.creativeMissionSubtitle6, '', false, '', false),
  ];

  final peopleMissionLists = [
    MissionList($strings.peopleMissionTitle1, $strings.peopleMissionSubtitle1, '', false, '', false),
    MissionList($strings.peopleMissionTitle2, $strings.peopleMissionSubtitle2, '', false, '', false),
    MissionList($strings.peopleMissionTitle3, $strings.peopleMissionSubtitle3, '', false, '', false),
    MissionList($strings.peopleMissionTitle4, $strings.peopleMissionSubtitle4, '', false, '', false),
    MissionList($strings.peopleMissionTitle5, $strings.peopleMissionSubtitle5, '', false, '', false),
    MissionList($strings.peopleMissionTitle6, $strings.peopleMissionSubtitle6, '', false, '', false),
  ];
}
