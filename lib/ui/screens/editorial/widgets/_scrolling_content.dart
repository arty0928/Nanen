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
    Widget buildText(String value) => Focus(child: Text(_fixNewlines(value), style: $styles.text.body));

    Widget buildDropCapText(String value) {
      final TextStyle dropStyle = $styles.text.dropCase;
      final TextStyle bodyStyle = $styles.text.body;
      final String dropChar = value.substring(0, 1);
      final textScale = MediaQuery.of(context).textScaleFactor;
      final double dropCapWidth = StringUtils.measure(dropChar, dropStyle).width * textScale;
      final bool skipCaps = !localeLogic.isEnglish;
      return Semantics(
        label: value,
        child: ExcludeSemantics(
          child: !skipCaps
              ? DropCapText(
                  _fixNewlines(value).substring(1),
                  dropCap: DropCap(
                    width: dropCapWidth,
                    height: $styles.text.body.fontSize! * $styles.text.body.height! * 2,
                    child: Transform.translate(
                      offset: Offset(0, bodyStyle.fontSize! * (bodyStyle.height! - 1) - 2),
                      child: Text(
                        dropChar,
                        overflow: TextOverflow.visible,
                        style: $styles.text.dropCase.copyWith(
                          color: $styles.colors.accent1,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  style: $styles.text.body,
                  dropCapPadding: EdgeInsets.only(right: 6),
                  dropCapStyle: $styles.text.dropCase.copyWith(
                    color: $styles.colors.accent1,
                    height: 1,
                  ),
                )
              : Text(value, style: bodyStyle),
        ),
      );
    }

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
                    children: [_MissionBoxList(data, context)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget to provide hz padding to multiple widgets. Keeps the layout of the scrolling content cleaner.
  List<Widget> _contentSection(List<Widget> children) {
    return [
      for (int i = 0; i < children.length - 1; i++) ...[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
          child: children[i],
        ),
        // Gap($styles.insets.md)
        SizedBox(
          height: 10,
        ),
      ],
    ];
  }
}

class _MissionBoxList extends StatelessWidget {
  final WonderData data;
  final BuildContext context;

  const _MissionBoxList(this.data, this.context);

  @override
  Widget build(BuildContext context) {
    final missionTitle = data.missionTitle;

    return Column(
      children: missionTitle.entries.map((entry) {
        final title = _truncateString(entry.key, 20);
        final subtitle = _truncateString(entry.value, 30);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: missionBox(data: data, context: context, title: title, subtitle: subtitle),
        );
      }).toList(),
    );
  }

  String _truncateString(String text, int maxLength) {
    return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
  }
}
//   List<Widget> _MissionBoxList(List<Widget> children) {
//     List<Widget> result = [];

//     for (int i = 0; i < children.length; i++) {
//       result.add(
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: children[i],
//         ),
//       );
//       result.add(SizedBox(height: 10));
//     }

//     return result;
//   }
// }

class missionBox extends StatelessWidget {
  final WonderData data;
  final BuildContext context;
  final String title;
  final String subtitle;

  const missionBox({
    Key? key,
    required this.data,
    required this.context,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ... Existing code ...

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          callMissionDetail(context);
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
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: NanenAppTheme.darkGrey,
                                fontSize: 12,
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

// ... Rest of your code ...

void callMissionDetail(BuildContext context) {
  // appRouter.go(ScreenPaths.details);
  Navigator.of(context).push(CustomPageRoute(AxisDirection.left, child: CourseInfoScreen()));

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (BuildContext context) => const CourseInfoScreen(),
  //   ),
  // );
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
                    // missionBox(data: data, context: context, index: null,),
                    // missionBox(data: data, context: context, index: null,),
                    // missionBox(data: data, context: context, index: null,),
                    // missionBox(data: data, context: context, index: null,),
                    // missionBox(data: data, context: context, index: null,),
                  // ),

                  // ..._contentSection([
                  /// History 1
                  // buildDropCapText(data.historyInfo1),

                  /// Callout1
                  // _Callout(text: data.callout1),

                  /// History 2
                  // buildText(data.historyInfo2),
                  // _SectionDivider(scrollPos, sectionNotifier, index: 1),

                  /// Construction 1
                  // buildDropCapText(data.constructionInfo1),
                  // ]),
                  // Gap($styles.insets.md),
                  // ..._contentSection([
                  //   /// Callout2
                  //   Gap($styles.insets.xs),
                  //   // _Callout(text: data.callout2),

                  //   /// Construction 2
                  //   buildText(data.constructionInfo2),

                  //   buildText(data.constructionInfo2),

                  //   // _SectionDivider(scrollPos, sectionNotifier, index: 2),

                  //   /// Location
                  //   // buildDropCapText(data.locationInfo1),
                  //   buildText(data.locationInfo2),
                  // ]),