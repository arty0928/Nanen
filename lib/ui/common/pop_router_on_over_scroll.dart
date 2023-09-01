import 'package:wonders/common_libs.dart';

class PopRouterOnOverScroll extends StatefulWidget {
  const PopRouterOnOverScroll({Key? key, required this.child, required this.controller}) : super(key: key);
  final ScrollController controller;
  final Widget child;

  @override
  State<PopRouterOnOverScroll> createState() => _PopRouterOnOverScrollState();
}

class _PopRouterOnOverScrollState extends State<PopRouterOnOverScroll> {
  final _scrollToPopThreshold = 70;
  bool _isPointerDown = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleScrollChanged);
  }

  @override
  void didUpdateWidget(covariant PopRouterOnOverScroll oldWidget) {
    if (widget.controller != oldWidget.controller) {
      widget.controller.addListener(_handleScrollChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  bool _checkPointerIsDown(d) => _isPointerDown = d.dragDetails != null;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _checkPointerIsDown,
      child: widget.child,
    );
  }

  void _handleScrollChanged() {
    // If user pulls far down on the elastic list, pop back to
    final px = widget.controller.position.pixels;
    if (px < -_scrollToPopThreshold) {
      if (_isPointerDown) {
        // context.pop();
        if (Navigator.of(context).canPop()) {
          context.pop();
          widget.controller.removeListener(_handleScrollChanged);
        } else {
          appRouter.go(ScreenPaths.home);
        }
      }
    }
  }
  // void _handleScrollChanged() {
  //   final px = widget.controller.position.pixels;
  //   if (px < -_scrollToPopThreshold) {
  //     if (_isPointerDown) {
  //       if (Navigator.of(context).canPop()) {
  //         // If there are routes to pop, pop the current route.
  //         Navigator.of(context).pop();
  //       } else {
  //         // If there are no routes to pop, navigate to the home screen.
  //         // Navigator.of(context).pushReplacement(
  //         //   CustomPageRoute(
  //         //     axisDirection: AxisDirection.down,
  //         //     child: HomeScreen(),
  //         //   ),
  //         // );
  //         appRouter.go(ScreenPaths.home);
  //       }
  //       widget.controller.removeListener(() => _handleScrollChanged(context));
  //     }
  //   }
  // }
}
