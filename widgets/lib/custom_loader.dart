import 'package:flutter/material.dart';

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

// class CustomSkeleton extends StatefulWidget {
//   const CustomSkeleton({Key? key}) : super(key: key);

//   @override
//   State<CustomSkeleton> createState() => _CustomSkeletonState();
// }

// class _CustomSkeletonState extends State<CustomSkeleton> {
//   late bool _isLoading;

//   @override
//   void initState() {
//     super.initState();
//     _isLoading = true; // Initialize _isLoading to true
//     _simulateLoading();
//   }

//   void _simulateLoading() async {
//     // ignore: inference_failure_on_instance_creation
//     await Future.delayed(Duration(seconds: 2)); // Simulate a delay
//     if (mounted) {
//       setState(() {
//         _isLoading = false; // Set _isLoading to false after the delay
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: _isLoading,
//       enableSwitchAnimation: _isLoading,
//       child: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) => Card(
//           child: ListTile(
//             title: Text('Item number $index as title'),
//             subtitle: const Text('Subtitle here'),
//             trailing: const Icon(Icons.ac_unit),
//           ),
//         ),
//       ),
//     );
//   }
// }
