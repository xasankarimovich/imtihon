import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/screen/favorite_screen/favorite_screen.dart';
import 'package:imtihon/screen/homePage/classic_car_screen.dart';
import 'package:imtihon/screen/homePage/f1_screen.dart';
import 'package:imtihon/screen/homePage/gibrid_screen.dart';
import 'package:imtihon/screen/homePage/hatch_back_screen.dart';
import 'package:imtihon/screen/homePage/model_screen.dart';
import 'package:imtihon/screen/homePage/recomadation_screen.dart';
import 'package:imtihon/screen/homePage/sedan_screen.dart';
import 'package:imtihon/screen/homePage/turbo_screen.dart';
import 'package:imtihon/screen/homePage/view_all.dart';
import 'package:imtihon/screen/tab_box/tab_box_screen.dart';
import 'package:imtihon/screen/widgets/custom_card.dart';
import 'package:imtihon/screen/widgets/custom_card_with_row.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/image_path/images_path.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategoryRow(),
              const SizedBox(height: 20),
              _buildRecommendationHeader(),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildCustomCardRow(),
              ),
              const SizedBox(height: 20),
              _buildTopCategoryHeader(),
              const SizedBox(height: 10),
              _buildTopCategoryRow(),
              const SizedBox(height: 20),
              _buildRecommendationHeader(),
              const SizedBox(height: 20),
              const CustomCardWithRow(),
              const CustomCardWithRow(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TabBoxScreen(),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.location_on, size: 40, color: Colors.black),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Locations",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  "Indonesia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Stack(
            children: [
               Icon(Icons.notifications_rounded,
                  size: 40.h, color: Colors.blue),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  constraints:
                      const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Your Idea...",
        suffixIcon: const Icon(CupertinoIcons.search),
        hintStyle: AppTextStyle.regular.copyWith(color: AppColors.c8F95AB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryCard("Sedan", const SedanScreen()),
          10.boxH(),
          _buildCategoryCard("Hatchback", const HatchbackScreen()),
          10.boxH(),
          _buildCategoryCard("Classic", const ClassicCarScreen()),
          10.boxH(),
          _buildCategoryCard("Model", const ModelScreen()),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String label, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: const Color(0xfff8f8f8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RecomendationScreen()));
          },
          child: const Text(
            "Recommendation",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ViewAll()));
          },
          child: const Text(
            "View All",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8F95AB)),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomCardRow() {
    return const Row(
      children: [
        CustomCard(),
        SizedBox(width: 16),
        CustomCard(),
      ],
    );
  }

  Widget _buildTopCategoryHeader() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Top Category Car",
        style: AppTextStyle.medium.copyWith(
          color: AppColors.c8F95AB,
        ),
      ),
    );
  }

  Widget _buildTopCategoryRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTopCategoryCard(
              "Classic", AppIconsSvg.classicIcon, const ClassicCarScreen()),
          10.boxH(),
          _buildTopCategoryCard(
              "Turbo", AppIconsSvg.turboIcon, const TurboScreen()),
          10.boxH(),
          _buildTopCategoryCard("F1", AppIconsSvg.f1Icon, const F1Screen()),
          10.boxH(),
          _buildTopCategoryCard(
              "Gybrid", AppIconsSvg.gybridIcon, const GybridScreen()),
        ],
      ),
    );
  }

  Widget _buildTopCategoryCard(String label, String asset, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        width: 100.w,
        height: 150.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, width: 60, height: 60),
            10.boxH(),
            Text(
              label,
              style: const TextStyle(color: Color(0xffB5BBCF)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationIcon(
      IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, color: color, size: 30),
    );
  }
}
