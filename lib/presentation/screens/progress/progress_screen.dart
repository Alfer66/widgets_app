import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('Circular progress indicator'),
          const SizedBox(height: 10),
          CircularProgressIndicator(
            strokeAlign: 2,
            backgroundColor: Colors.black45,
          ),
          const SizedBox(height: 20),
          Text('Circular y linear indicator controlado'),
          const SizedBox(height: 10),
          _ControlledProgresIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                    strokeWidth: 2, backgroundColor: Colors.black12),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                )),
              ],
            ),
          );
        });
  }
}
