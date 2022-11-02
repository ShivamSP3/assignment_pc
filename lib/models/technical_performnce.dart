import 'package:assignment_pc/home_page.dart';
import 'package:flutter/material.dart';

class TCPerformance extends StatefulWidget {
  const TCPerformance({super.key});

  @override
  State<TCPerformance> createState() => _TCPerformanceState();
}

class _TCPerformanceState extends State<TCPerformance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
          Text(tcResponse.toString())              ],
            )
          ],
        );
      },),
    );
  }
}