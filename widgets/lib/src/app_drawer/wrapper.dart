part of '../src.dart';

class AppDrawerWrapper extends StatelessWidget {
  final List<Widget> drawerItems;
  final double itemGap;
  final Widget child;
  final TheDrawerController controller;
  final double cornerRadius;
  final EdgeInsets? drawerPadding;

  const AppDrawerWrapper({
    super.key,
    required this.drawerItems,
    required this.child,
    required this.controller,
    this.itemGap = 10.0,
    this.cornerRadius = 8.0,
    this.drawerPadding,
  });

  Widget _renderContent(BuildContext context) {
    final slideAmount =
        MediaQuery.of(context).size.width * 0.55 * (controller.percentOpen);
    final contentScale = 1.0 - (0.2 * (controller.percentOpen));
    final contentCornerRadius = cornerRadius * (controller.percentOpen);

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scaleByDouble(
          contentScale,
          contentScale,
          1.0,
          1.0,
        ),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              offset: const Offset(0.0, 4.0),
              blurRadius: 40.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(contentCornerRadius),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            controller.open();
          }
          if (details.delta.dx < 0) {
            controller.close();
          }
        },
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: drawerItems.map(
                (item) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: item,
                    ),
                  );
                },
              ).toList(),
            ),
            _renderContent(context)
          ],
        ),
      ),
    );
  }
}
