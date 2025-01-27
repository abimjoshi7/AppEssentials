part of 'src.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
