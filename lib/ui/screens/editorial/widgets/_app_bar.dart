part of '../editorial_screen.dart';

class _AppBar extends StatelessWidget {
  String _getTitleValue(wonderType) {
    switch (wonderType) {
      case WonderType.greatWall:
        return NanenCategory[0]; // Active
      case WonderType.petra:
        return NanenCategory[1]; // Calm
      case WonderType.colosseum:
        return NanenCategory[2]; // Careative
      case WonderType.chichenItza:
        return NanenCategory[3]; // People
      default:
        return ''; // 기본값은 빈 문자열로 처리
    }
  }

  _AppBar(this.wonderType, {Key? key, required this.sectionIndex, required this.scrollPos}) : super(key: key);
  final WonderType wonderType;
  final ValueNotifier<int> sectionIndex;
  final ValueNotifier<double> scrollPos;

  // final _titleValues = [
  //   // $strings.appBarTitleFactsHistory,
  //   // 'C A L M',
  //   // NanenCategory[widegt.sectionIndex.value],
  //   $strings.appBarTitleFactsHistory,
  //   $strings.appBarTitleConstruction,
  //   $strings.appBarTitleLocation,
  // ];

  final _iconValues = const [
    'history.png',
    'construction.png',
    'geography.png',
  ];

  ArchType _getArchType() {
    switch (wonderType) {
      case WonderType.chichenItza:
        return ArchType.flatPyramid;
      case WonderType.colosseum:
        return ArchType.arch;
      case WonderType.greatWall:
        return ArchType.arch;
      case WonderType.petra:
        return ArchType.wideArch;
    }
  }

  @override
  Widget build(BuildContext context) {
    final arch = _getArchType();
    final index = _getTitleValue(wonderType);
    final title = [index, index, index];
    return LayoutBuilder(builder: (_, constraints) {
      bool showOverlay = constraints.biggest.height < 300;
      return Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: $styles.times.med,
            child: Stack(
              key: ValueKey(showOverlay),
              fit: StackFit.expand,
              children: [
                /// Masked image
                BottomCenter(
                  child: SizedBox(
                    width: showOverlay ? double.infinity : $styles.sizes.maxContentWidth1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ClipPath(
                        // Switch arch type to Rect if we are showing the title bar
                        clipper: showOverlay ? null : ArchClipper(arch),
                        child: ValueListenableBuilder<double>(
                          valueListenable: scrollPos,
                          builder: (_, value, child) {
                            double opacity = (.4 + (value / 1500)).clamp(0, 1);
                            return ScalingListItem(
                              scrollPos: scrollPos,
                              child: Image.asset(
                                wonderType.photo1,
                                fit: BoxFit.cover,
                                opacity: AlwaysStoppedAnimation(opacity),
                              ),
                            );
                          },
                        ),
                      ).animate(delay: $styles.times.pageTransition + 500.ms).fadeIn(duration: $styles.times.slow),
                    ),
                  ),
                ),

                /// Colored overlay
                if (showOverlay) ...[
                  AnimatedContainer(
                    duration: $styles.times.med,
                    color: wonderType.bgColor.withOpacity(showOverlay ? .8 : 0),
                  ),
                ],
              ],
            ),
          ),

          /// Circular Titlebar
          BottomCenter(
            child: ValueListenableBuilder<int>(
              valueListenable: sectionIndex,
              builder: (_, value, __) {
                return _CircularTitleBar(
                  index: value,
                  titles: title,
                  icons: _iconValues,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
