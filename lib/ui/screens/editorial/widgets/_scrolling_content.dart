part of '../editorial_screen.dart';

class _ScrollingContent extends StatelessWidget {
  const _ScrollingContent(this.data, {Key? key, required this.scrollPos, required this.sectionNotifier})
      : super(key: key);
  final WonderData data;
  final ValueNotifier<double> scrollPos;
  final ValueNotifier<int> sectionNotifier;

  String _fixNewlines(String text) {
    const nl = '\n';
    final chunks = text.split(nl);
    while (chunks.last == nl) {
      chunks.removeLast();
    }
    chunks.removeWhere((element) => element.trim().isEmpty);
    final result = chunks.join('$nl$nl');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SliverBackgroundColor(
      color: $styles.colors.offWhite,
      sliver: SliverPadding(
        padding: EdgeInsets.symmetric(vertical: $styles.insets.md),
        sliver: SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              Center(
                child: SizedBox(
                  width: $styles.sizes.maxContentWidth1,
                  child: Column(
                    children: _MissionBoxList(data, context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _MissionBoxList(WonderData data, BuildContext context) {
    final missionLists = MissionLists().getMissionList(data.type);

    return missionLists.asMap().entries.map((entry) {
      final int missionIndex = entry.key;
      final mission = entry.value;
      final title = _truncateString(mission.missionTitle, 20);
      final subtitle = _truncateString(mission.missionSubTitle, 30);
      final subTitleText = _truncateString(mission.missionSubTitleText, 80);
      String missionPic = mission.missionPic;
      bool missionPicIsDone = mission.missionPicIsDone;
      String aiDiary = mission.aiDiary;
      bool aiDiaryIsDone = mission.aiDiaryIsDone;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: missionBox(
          missionIndex: missionIndex,
          data: data,
          context: context,
          title: title,
          subtitle: subtitle,
          missionPic: missionPic,
          missionPicIsDone: missionPicIsDone,
          aiDiary: aiDiary,
          aiDiaryIsDone: aiDiaryIsDone,
          subTitleText: subTitleText,
        ),
      );
    }).toList();
  }

  String _truncateString(String text, int maxLength) {
    return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
  }
}

class missionBox extends StatelessWidget {
  final int missionIndex;
  final WonderData data;
  final BuildContext context;
  final String title;
  final String subtitle;
  final String subTitleText;
  String missionPic = '';
  bool missionPicIsDone = false;
  String aiDiary = '';
  bool aiDiaryIsDone = false;

  missionBox(
      {Key? key,
      required this.missionIndex,
      required this.data,
      required this.context,
      required this.title,
      required this.subtitle,
      required this.missionPic,
      required this.missionPicIsDone,
      required this.aiDiary,
      required this.aiDiaryIsDone,
      required this.subTitleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ... Existing code ...

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(CustomPageRoute(AxisDirection.left,
              child: MissionDetailScreen(
                  missionIndex: missionIndex,
                  data: data,
                  selectedMission: MissionList(
                      title, subtitle, missionPic, missionPicIsDone, aiDiary, aiDiaryIsDone, subTitleText))));
        },
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: NanenAppTheme.background,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: NanenAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(0, 1.1),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            color: NanenAppTheme.grey.withOpacity(0.1),
                            child: Icon(Icons.favorite),
                          ),
                        ),
                        SizedBox(width: 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily: 'writerFont',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: NanenAppTheme.darkGrey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.more_horiz),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverBackgroundColor extends SingleChildRenderObjectWidget {
  const SliverBackgroundColor({
    Key? key,
    required this.color,
    Widget? sliver,
  }) : super(key: key, child: sliver);

  final Color color;

  @override
  RenderSliverBackgroundColor createRenderObject(BuildContext context) {
    return RenderSliverBackgroundColor(
      color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderSliverBackgroundColor renderObject) {
    renderObject.color = color;
  }
}

class RenderSliverBackgroundColor extends RenderProxySliver {
  RenderSliverBackgroundColor(this._color);

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (value == color) {
      return;
    }
    _color = color;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null && child!.geometry!.visible) {
      final SliverPhysicalParentData childParentData = child!.parentData! as SliverPhysicalParentData;
      final Rect childRect =
          offset + childParentData.paintOffset & Size(constraints.crossAxisExtent, child!.geometry!.paintExtent);
      context.canvas.drawRect(
          childRect,
          Paint()
            ..style = PaintingStyle.fill
            ..color = color);
      context.paintChild(child!, offset + childParentData.paintOffset);
    }
  }
}
