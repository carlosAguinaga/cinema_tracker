import 'package:cinema_tracker/presentation/views/views.dart';
import 'package:cinema_tracker/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreem extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  const HomeScreem({
    super.key,
    required this.pageIndex,
  });

  final viewRouts = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRouts,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
