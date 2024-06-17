import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/classic_car_card.dart';
import 'package:imtihon/screen/widgets/custom_card_with_row.dart';

class SedanScreen extends StatefulWidget {
  const SedanScreen({super.key});

  @override
  State<SedanScreen> createState() => _SedanScreenState();
}

class _SedanScreenState extends State<SedanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sedan Screen'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ClassCarCard(),
            CustomCardWithRow(),
            CustomCardWithRow(),
            CustomCardWithRow()
          ],
        ),
      ),
    );
  }
}
