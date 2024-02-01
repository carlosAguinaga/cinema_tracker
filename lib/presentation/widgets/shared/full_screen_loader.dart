import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final mesagges = <String>[
      'Preparing data',
      'Loading movies',
      'Loading popular',
      'Something is taking longer than expected.',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return mesagges[step];
    }).take(mesagges.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please wait'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading');

                return Text(snapshot.data!);
              }),
        ],
      ),
    );
  }
}
