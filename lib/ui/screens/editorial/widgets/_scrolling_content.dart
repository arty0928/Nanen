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
          delegate: SliverChildListDelegate.fixed([
            Center(
              child: SizedBox(
                width: $styles.sizes.maxContentWidth1,
                child: Column(children: [
                  ..._contentSection([
                    /// History 1
                    // buildDropCapText(data.historyInfo1),

                    /// Callout1
                    // _Callout(text: data.callout1),

                    /// History 2
                    // buildText(data.historyInfo2),
                    // _SectionDivider(scrollPos, sectionNotifier, index: 1),

                    /// Construction 1
                    // buildDropCapText(data.constructionInfo1),
                  ]),
                  Gap($styles.insets.md),
                  ..._contentSection([
                    /// Callout2
                    Gap($styles.insets.xs),
                    // _Callout(text: data.callout2),

                    /// Construction 2
                    buildText(data.constructionInfo2),
                    // _SectionDivider(scrollPos, sectionNotifier, index: 2),

                    /// Location
                    // buildDropCapText(data.locationInfo1),
                    buildText(data.locationInfo2),
                  ]),
                  Gap(150),
                ]),
              ),
            ),
          ]),
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
        Gap($styles.insets.md)
      ],
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
      //   child: children.last,
      // ),
    ];
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
