import 'package:craft_buy/app/asset_path.dart';
import 'package:craft_buy/feature/common/prsentation/providers/main_nav_bar_provider.dart';
import 'package:craft_buy/feature/common/prsentation/widgets/category_card.dart';
import 'package:craft_buy/feature/common/prsentation/widgets/product_card.dart';
import 'package:craft_buy/feature/home/prsentation/widgets/cricular_icon_button.dart';
import 'package:craft_buy/feature/home/prsentation/widgets/home_carousal_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widgets/product_search_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              ProductSearchField(),
              HomeCarouselSlider(),
              SectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().changeToCategories();
                },
              ),
              _buildCategoryList(),
              SectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg),
      actions: [
        CircleIconButton(onTap: () {}, icon: Icons.person),
        const SizedBox(width: 4),
        CircleIconButton(onTap: () {}, icon: Icons.call),
        const SizedBox(width: 4),
        CircleIconButton(
          onTap: () {},
          icon: Icons.notifications_active_outlined,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
