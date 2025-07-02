part of 'src.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    required this.child,
    required this.popupList,
    super.key,
  });

  final Widget child;
  final List<PopupMenuItem<String>> popupList;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.25,
        maxWidth: MediaQuery.sizeOf(context).width * 0.6,
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                itemBuilder: (context) => popupList,
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
