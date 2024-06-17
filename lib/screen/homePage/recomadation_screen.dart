
import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/classic_car_card.dart';
import 'package:imtihon/screen/widgets/custom_card_with_row.dart';

class RecomendationScreen extends StatefulWidget {
  const RecomendationScreen({super.key});

  @override
  State<RecomendationScreen> createState() => _RecomendationScreenState();
}

class _RecomendationScreenState extends State<RecomendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendation Screen'),
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
