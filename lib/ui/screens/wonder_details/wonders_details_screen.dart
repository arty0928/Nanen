import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/common/measurable_widget.dart';
import 'package:wonders/ui/screens/editorial/editorial_screen.dart';

import 'wonder_details_tab_menu.dart';

class WonderDetailsScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  WonderDetailsScreen({Key? key, required this.type, this.initialTabIndex = 0})
      : super(key: key);
  final WonderType type;
  final int initialTabIndex;

  @override
  State<WonderDetailsScreen> createState() => _WonderDetailsScreenState();
}

class _WonderDetailsScreenState extends State<WonderDetailsScreen>
    with GetItStateMixin, SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: widget.initialTabIndex,
  )..addListener(_handleTabChanged);
  AnimationController? _fade;

  double? _tabBarSize;
  bool _useNavRail = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChanged() {
    _fade?.forward(from: 0);
    setState(() {});
  }

  void _handleTabMenuSized(Size size) {
    setState(() {
      _tabBarSize = (_useNavRail ? size.width : size.height) -
          WonderDetailsTabMenu.buttonInset;
    });
  }

  @override
  Widget build(BuildContext context) {
    _useNavRail = appLogic.shouldUseNavRail();

    final wonder = wondersLogic.getData(widget.type);
    int tabIndex = _tabController.index;
    bool showTabBarBg = tabIndex != 1;
    final tabBarSize = _tabBarSize ?? 0;
    final menuPadding = _useNavRail
        ? EdgeInsets.only(left: tabBarSize)
        : EdgeInsets.only(bottom: tabBarSize);
    return ColoredBox(
      color: Colors.black,
      child: Stack(
        children: [
          /// Fullscreen tab views
          WonderEditorialScreen(wonder, contentPadding: menuPadding),

          /// Tab menu
          Align(
            alignment:
                _useNavRail ? Alignment.centerLeft : Alignment.bottomCenter,
            child: MeasurableWidget(
              onChange: _handleTabMenuSized,
              child: WonderDetailsTabMenu(
                  tabController: _tabController,
                  wonderType: wonder.type,
                  showBg: showTabBarBg,
                  axis: _useNavRail ? Axis.vertical : Axis.horizontal),
            ),
          ),
        ],
      ),
    );
  }
}
