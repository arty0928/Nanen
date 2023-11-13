import 'package:wonders/common_libs.dart';

class MissionList {
  MissionList(
      this.missionTitle,
      this.missionSubTitle,
      this.missionPic,
      this.missionPicIsDone,
      this.aiDiary,
      this.aiDiaryIsDone,
      this.missionSubTitleText,
      this.missionSubTitleText2,
      this.missionSubTitleText3,
      this.missionSubTitleText4);
  final String missionTitle;
  final String missionSubTitle;
  final String missionSubTitleText;
  final String missionSubTitleText2;
  final String missionSubTitleText3;
  final String missionSubTitleText4;

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
    MissionList(
        $strings.activeMissionTitle1,
        $strings.activeMissionSubtitle1,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText1,
        $strings.activeMissionSubtitleText1_2,
        $strings.activeMissionSubtitleText1_3,
        $strings.activeMissionSubtitleText1_4),
    MissionList(
        $strings.activeMissionTitle2,
        $strings.activeMissionSubtitle2,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText2,
        $strings.activeMissionSubtitleText2_2,
        $strings.activeMissionSubtitleText2_3,
        $strings.activeMissionSubtitleText2_4),
    MissionList(
        $strings.activeMissionTitle3,
        $strings.activeMissionSubtitle3,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText3,
        $strings.activeMissionSubtitleText3_2,
        $strings.activeMissionSubtitleText3_3,
        $strings.activeMissionSubtitleText3_4),
    MissionList(
        $strings.activeMissionTitle4,
        $strings.activeMissionSubtitle4,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText4,
        $strings.activeMissionSubtitleText4_2,
        $strings.activeMissionSubtitleText4_3,
        $strings.activeMissionSubtitleText4_4),
    MissionList(
        $strings.activeMissionTitle5,
        $strings.activeMissionSubtitle5,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText5,
        $strings.activeMissionSubtitleText5_2,
        $strings.activeMissionSubtitleText5_3,
        $strings.activeMissionSubtitleText5_4),
    MissionList(
        $strings.activeMissionTitle6,
        $strings.activeMissionSubtitle6,
        '',
        false,
        '',
        false,
        $strings.activeMissionSubtitleText6,
        $strings.activeMissionSubtitleText6_2,
        $strings.activeMissionSubtitleText6_3,
        $strings.activeMissionSubtitleText6_4),
  ];

  final calmMissionLists = [
    MissionList(
        $strings.calmMissionTitle1,
        $strings.calmMissionSubtitle1,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText1,
        $strings.calmMissionSubtitleText1_2,
        $strings.calmMissionSubtitleText1_3,
        $strings.calmMissionSubtitleText1_4),
    MissionList(
        $strings.calmMissionTitle2,
        $strings.calmMissionSubtitle2,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText2,
        $strings.calmMissionSubtitleText2_2,
        $strings.calmMissionSubtitleText2_3,
        $strings.calmMissionSubtitleText2_4),
    MissionList(
        $strings.calmMissionTitle3,
        $strings.calmMissionSubtitle3,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText3,
        $strings.calmMissionSubtitleText3_2,
        $strings.calmMissionSubtitleText3_3,
        $strings.calmMissionSubtitleText3_4),
    MissionList(
        $strings.calmMissionTitle4,
        $strings.calmMissionSubtitle4,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText4,
        $strings.calmMissionSubtitleText4_2,
        $strings.calmMissionSubtitleText4_3,
        $strings.calmMissionSubtitleText4_4),
    MissionList(
        $strings.calmMissionTitle5,
        $strings.calmMissionSubtitle5,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText5,
        $strings.calmMissionSubtitleText5_2,
        $strings.calmMissionSubtitleText5_3,
        $strings.calmMissionSubtitleText5_4),
    MissionList(
        $strings.calmMissionTitle6,
        $strings.calmMissionSubtitle6,
        '',
        false,
        '',
        false,
        $strings.calmMissionSubtitleText6,
        $strings.calmMissionSubtitleText6_2,
        $strings.calmMissionSubtitleText6_3,
        $strings.calmMissionSubtitleText6_4),
  ];

  final creativeMissionLists = [
    MissionList(
        $strings.creativeMissionTitle1,
        $strings.creativeMissionSubtitle1,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText1,
        $strings.creativeMissionSubtitleText1_2,
        $strings.creativeMissionSubtitleText1_3,
        $strings.creativeMissionSubtitleText1_4),
    MissionList(
        $strings.creativeMissionTitle2,
        $strings.creativeMissionSubtitle2,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText2,
        $strings.creativeMissionSubtitleText2_2,
        $strings.creativeMissionSubtitleText2_3,
        $strings.creativeMissionSubtitleText2_4),
    MissionList(
        $strings.creativeMissionTitle3,
        $strings.creativeMissionSubtitle3,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText3,
        $strings.creativeMissionSubtitleText3_2,
        $strings.creativeMissionSubtitleText3_3,
        $strings.creativeMissionSubtitleText3_4),
    MissionList(
        $strings.creativeMissionTitle4,
        $strings.creativeMissionSubtitle4,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText4,
        $strings.creativeMissionSubtitleText4_2,
        $strings.creativeMissionSubtitleText4_3,
        $strings.creativeMissionSubtitleText4_4),
    MissionList(
        $strings.creativeMissionTitle5,
        $strings.creativeMissionSubtitle5,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText5,
        $strings.creativeMissionSubtitleText5_2,
        $strings.creativeMissionSubtitleText5_3,
        $strings.creativeMissionSubtitleText5_4),
    MissionList(
        $strings.creativeMissionTitle6,
        $strings.creativeMissionSubtitle6,
        '',
        false,
        '',
        false,
        $strings.creativeMissionSubtitleText6,
        $strings.creativeMissionSubtitleText6_2,
        $strings.creativeMissionSubtitleText6_3,
        $strings.creativeMissionSubtitleText6_4),
  ];

  final peopleMissionLists = [
    MissionList(
        $strings.peopleMissionTitle1,
        $strings.peopleMissionSubtitle1,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText1,
        $strings.peopleMissionSubtitleText1_2,
        $strings.peopleMissionSubtitleText1_3,
        $strings.peopleMissionSubtitleText1_4),
    MissionList(
        $strings.peopleMissionTitle2,
        $strings.peopleMissionSubtitle2,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText2,
        $strings.peopleMissionSubtitleText2_2,
        $strings.peopleMissionSubtitleText2_3,
        $strings.peopleMissionSubtitleText2_4),
    MissionList(
        $strings.peopleMissionTitle3,
        $strings.peopleMissionSubtitle3,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText3,
        $strings.peopleMissionSubtitleText3_2,
        $strings.peopleMissionSubtitleText3_3,
        $strings.peopleMissionSubtitleText3_4),
    MissionList(
        $strings.peopleMissionTitle4,
        $strings.peopleMissionSubtitle4,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText4,
        $strings.peopleMissionSubtitleText4_2,
        $strings.peopleMissionSubtitleText4_3,
        $strings.peopleMissionSubtitleText4_4),
    MissionList(
        $strings.peopleMissionTitle5,
        $strings.peopleMissionSubtitle5,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText5,
        $strings.peopleMissionSubtitleText5_2,
        $strings.peopleMissionSubtitleText5_3,
        $strings.peopleMissionSubtitleText5_4),
    MissionList(
        $strings.peopleMissionTitle6,
        $strings.peopleMissionSubtitle6,
        '',
        false,
        '',
        false,
        $strings.peopleMissionSubtitleText6,
        $strings.peopleMissionSubtitleText6_2,
        $strings.peopleMissionSubtitleText6_3,
        $strings.peopleMissionSubtitleText6_4),
  ];
}
