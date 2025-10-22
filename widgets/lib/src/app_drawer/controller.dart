part of '../src.dart';

/// Controls the Drawer Wrapper class
/// Field [TickerProvider vsync] is required
/// Field [Duration duration] is set to 250ms by default
class TheDrawerController extends ChangeNotifier {
  final TickerProvider vsync;
  final Duration duration;
  final AnimationController _animationController;
  DrawerState state = DrawerState.closed;

  TheDrawerController({
    required this.vsync,
    this.duration = const Duration(milliseconds: 250),
  }) : _animationController =
            AnimationController(vsync: vsync, duration: duration) {
    _initController();
  }

  void _initController() {
    _animationController
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener(
        (AnimationStatus status) {
          switch (status) {
            case AnimationStatus.forward:
              state = DrawerState.opening;
            case AnimationStatus.reverse:
              state = DrawerState.closing;
            case AnimationStatus.completed:
              state = DrawerState.closed;
            case AnimationStatus.dismissed:
              state = DrawerState.closed;
          }
          notifyListeners();
        },
      );
  }

  double get percentOpen => _animationController.value;

  AnimationStatus get status => _animationController.status;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Open the drawer programmatically
  void open() {
    _animationController.forward();
  }

  /// Close the drawer programmatically
  void close() {
    _animationController.reverse();
  }
}
